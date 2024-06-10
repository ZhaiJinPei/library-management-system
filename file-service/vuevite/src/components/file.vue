<!--
[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)

This project is licensed under the Apache-2.0 license - see the LICENSE file for details.

Copyright (c) 2024-present, Zhai JinPei
-->
<template>
  <div class="container"
       style="width:100%;height:100%;background: url('http://10.20.245.160:9000/jpg/minioss.png') no-repeat;background-size: 100%;background-attachment: scroll;">
    <h2 style="font-family: 华文楷体,sans-serif;font-size: 50px;">本地文件上传</h2>
    <span style="margin-top: 0;font-size: 22px"><code>url: http://ip:9000/</code></span>
    <br>
    <br>
    <el-upload ref="upload" :auto-upload="false" :file-list="uploadFileList" :on-change="handleFileChange"
               :on-remove="handleRemove" :show-file-list="false" class="upload-demo" multiple
               style="height: 50px;">
      <template #trigger>
        <el-button plain style="transform: scale(1.4,1.5);margin: 10px 40px 20px 20px;" type="primary">选择文件
        </el-button>
      </template>

      <el-button :disabled="uploadDisabled" style="transform: scale(1.4,1.3);margin: 10px 30px 20px 20px;"
                 type="success" @click="handler">上传
      </el-button>

      <el-button style="transform: scale(1.4,1.3);margin: 10px 30px 20px 20px;" type="danger" @click="clearFileHandler">
        清空
      </el-button>

      <el-button
          style="transform:scale(1.4,1.3);margin: 10px 30px 20px 20px;"
          :disabled="!uploadIdInfoList[currentFileIndex] || (uploadIdInfoList[currentFileIndex] && uploadIdInfoList[currentFileIndex].status != '正在上传')"
          :type="isPaused ? 'success' : 'danger'" @click="continueOrPauseUpload">{{
          isPaused ? '继续' : '暂停'
        }}
      </el-button>
    </el-upload>
    <div class="list" style="overflow: scroll;height: 80%;margin-top: 35px">
      <!-- 文件列表 -->
      <div class="file-list-wrapper" style="width: 52%;margin: 200px auto;padding-left: 50px;">

        <el-collapse>
          <el-collapse-item v-for="(item, index) in uploadFileList"
                            :key="index" :name="index" style="margin-bottom: 20px;box-shadow: 2px 3px #56575c;border-radius: 10px;">
            <template #title>

              <el-row align="middle" style="width:98%;
            border-radius: 10px;
            background: rgba(6,148,246,0.71);
            opacity: 0.9;
            font-family: Menlo, Monaco, Andale Mono, Ubuntu Mono, monospace;
            font-size: 24px;
            " type="flex">

                <el-col :span="10">
                  <div :title="item.name" class="file-name"
                       style="text-align: left;padding-left: 10px;width: 600px;overflow: hidden">{{ item.name }}
                  </div>

                </el-col>

                <el-col :span="4">
                  <div class="file-size">{{ transformByte(item.size) || item.size }}</div>
                </el-col>

                <el-col :span="6">
                  <el-progress :percentage="item.uploadProgress"/>
                </el-col>

                <el-col :span="4" style="background: rgb(10,201,40);border-radius: 5px;">
                  <div>
                    <el-tag v-if="item.status === '等待上传'"
                            size="default" style="color: #1a1a1a;font-size: 18px;font-family: 'Avenir', Helvetica, Arial, sans-serif;" type="info">等待上传
                    </el-tag>
                    <el-tag v-else-if="item.status === '校验MD5'"
                            size="default" style="color: #1a1a1a;font-size: 18px;font-family: 'Avenir', Helvetica, Arial, sans-serif;" type="warning">校验MD5
                    </el-tag>
                    <el-tag v-else-if="item.status === '正在创建序列'"
                            size="default" style="color: #1a1a1a;font-size: 18px;font-family: 'Avenir', Helvetica, Arial, sans-serif;"
                            type="warning">正在创建序列
                    </el-tag>
                    <el-tag v-else-if="item.status === '正在上传'"
                            size="default" style="color: #1a1a1a;font-size: 18px;font-family: 'Avenir', Helvetica, Arial, sans-serif;">正在上传
                    </el-tag>
                    <el-tag v-else-if="item.status === '上传成功'"
                            size="default" style="color: #1a1a1a;font-size: 18px;font-family: 'Avenir', Helvetica, Arial, sans-serif;" type="success">上传完成
                    </el-tag>
                    <el-tag v-else
                            size="default" style="color: #1a1a1a;font-size: 18px;font-family: 'Avenir', Helvetica, Arial, sans-serif;" type="danger">上传错误
                    </el-tag>
                  </div>
                </el-col>

              </el-row>

            </template>

            <div class="file-chunk-list-wrapper"
                 style="margin: 5px;box-shadow: 2px 3px #1c0662;border-radius: 10px;width: 98%">
              <el-table :data="item.chunkList" max-height="400"
                        style="width: 100%;border-radius: 10px;font-family: Menlo, Monaco, Andale Mono, Ubuntu Mono, monospace;font-size: 19px">
                <el-table-column label="分片序号" prop="chunkNumber" width="180">
                </el-table-column>
                <el-table-column label="上传进度" prop="progress">
                  <template v-slot="{ row }">
                    <el-progress v-if="!row.status || row.progressStatus === 'normal'"
                                 :percentage="row.progress"/>
                    <el-progress v-else :percentage="row.progress" :status="row.progressStatus"
                                 :stroke-width="14" :text-inside="true"/>
                  </template>
                </el-table-column>
                <el-table-column label="状态" prop="status" width="180">
                </el-table-column>
              </el-table>
            </div>

          </el-collapse-item>
        </el-collapse>
      </div>
    </div>

  </div>
</template>

<style>
.list::before {
  background: rgb(157, 181, 194);
  box-shadow: 3px 3px #242424;
  border-radius: 10px;
  width: 65%;
  height: 80%;
  content: "";
  position: absolute;
  filter: opacity(0.6);
  -webkit-filter: opacity(0.6);
  right: 17%;
  top: 22%;
}

</style>
<script>

import {reactive} from 'vue';

import {checkUpload, initUpload, mergeUpload} from "./upload";

import SparkMD5 from 'spark-md5'

import axios from 'axios'
import {Moon, Sunny} from "@element-plus/icons";

const FILE_UPLOAD_ID_KEY = 'file_upload_id'

const chunkSize = 10 * 1024 * 1024

// 用于axios请求的取消
const CancelToken = axios.CancelToken;
let source = CancelToken.source();

const FileStatus = {
  wait: '等待上传',
  getMd5: '校验MD5',
  chip: '正在创建序列',
  uploading: '正在上传',
  success: '上传成功',
  error: '上传错误'
}

export default {
  computed: {
    Sunny() {
      return Sunny
    },
    Moon() {
      return Moon
    }
  },
  data() {
    return {
      changeDisabled: false,
      uploadDisabled: false,
      // 上传并发数
      currentFileIndex: 0,
      simultaneousUploads: 3,
      uploadIdInfoList: reactive([]),
      uploadFileList: reactive([]),
      isPaused: false, // 暂停true 继续false
    }
  },

  methods: {
    /**
     * 开始上传文件
     */
    handler() {
      const self = this
      //判断文件列表是否为空
      if (self.uploadFileList.length === 0) {
        self.$message.error('请先选择文件')
        return
      }

      //当前操作文件
      const currentFile = self.uploadFileList[self.currentFileIndex]

      if (!currentFile) {
        self.uploadDisabled = false
        return
      }

      self.uploadDisabled = true

      //更新上传标签
      currentFile.status = FileStatus.getMd5

      // 1. 计算文件MD5
      self.getFileMd5(currentFile.raw, async (md5, totalChunks) => {

        const checkResult = await self.checkFileUploadedByMd5(md5);

        if (checkResult.code === 1) {
          self.$message.success(`上传成功，文件地址：${checkResult.data.url}`);
          currentFile.status = FileStatus.success;
          currentFile.uploadProgress = 100;
          return;
        } else if (checkResult.code === 2) {
          currentFile.chunkUploadedList = checkResult.data;
        }

        // 3. 正在创建分片
        currentFile.status = FileStatus.chip;

        const fileChunks = self.createFileChunk(currentFile.raw);

        const fileName = self.getNewFileName(currentFile);

        // // 获取文件类型
        const fileType = self.fileSuffixTypeUtil(currentFile.name)

        const uploadIdInfoResult = await self.getFileUploadUrls({
          fileName,
          fileSize: currentFile.size,
          chunkSize: chunkSize,
          partCount: fileChunks.length,
          fileMd5: md5,
          contentType: 'application/octet-stream',
          fileType,
        });

        let uploadIdInfo = uploadIdInfoResult.data.data

        self.saveFileUploadId(uploadIdInfo.uploadId);

        const uploadUrls = uploadIdInfo.urlList;

        currentFile.chunkList = fileChunks.map((chunkItem, index) => ({
          chunkNumber: index + 1,
          chunk: chunkItem,
          uploadUrl: uploadUrls[index],
          progress: 0,
          status: '—',
        }));

        let tempFileChunks = []

        currentFile.chunkList.forEach((item) => {
          tempFileChunks.push(item)
        })

        uploadIdInfo.fileName = fileName

        uploadIdInfo.fileType = fileType

        uploadIdInfo.md5 = md5

        self.uploadIdInfoList[self.currentFileIndex] = uploadIdInfo

        uploadIdInfo.status = FileStatus.uploading;

        currentFile.status = FileStatus.uploading;

        // 处理分片列表，删除已上传的分片
        tempFileChunks = self.processUploadChunkList(tempFileChunks);

        console.log("删除已上传的分片-->", tempFileChunks);

        await self.uploadChunkBase(tempFileChunks);

        self.mergeFiles(uploadIdInfo)

      })
    },

    async mergeFiles(uploadIdInfo) {
      const self = this;
      //当前操作文件
      const currentFile = self.uploadFileList[self.currentFileIndex];

      if (uploadIdInfo.uploadId === 'SingleFileUpload') {
        currentFile.status = FileStatus.success;
      } else {
        const mergeResult = await self.mergeFile({
          uploadId: uploadIdInfo.uploadId,
          fileName: uploadIdInfo.fileName,
          fileMd5: uploadIdInfo.md5,
          fileType: uploadIdInfo.fileType,
        });

        if (!mergeResult.data) {
          currentFile.status = FileStatus.error;
          self.$message.error(mergeResult.error);
        } else {
          currentFile.status = FileStatus.success;
          console.log('文件访问地址：' + mergeResult.data);
          self.$message.success(`上传成功，文件地址：${mergeResult.data}`);
        }
      }

      if (self.currentFileIndex <= self.uploadFileList.length) {
        self.currentFileIndex++;
        self.handler();
      } else {
        self.uploadDisabled = false
      }
    },


    async continueOrPauseUpload() {

      const self = this;

      // 检查上传是否正在进行
      if (self.isPaused) {

        self.isPaused = false

        //当前操作文件
        const currentFile = self.uploadFileList[self.currentFileIndex];

        let tempFileChunks = []

        currentFile.chunkList.forEach((item) => {
          tempFileChunks.push(item)
        })

        // 处理分片列表，删除已上传的分片
        tempFileChunks = self.processUploadChunkList(tempFileChunks)

        console.log("删除已上传的分片-->", tempFileChunks)

        await self.uploadChunkBase(tempFileChunks);

        const uploadIdInfo = self.uploadIdInfoList[self.currentFileIndex];

        self.mergeFiles(uploadIdInfo)

      } else {
        try {
          source.cancel('中断上传!');
          source = CancelToken.source();
        } catch (err) {
        }

        self.isPaused = true
      }

    },


    /**
     * 清空列表
     */
    clearFileHandler() {
      this.uploadFileList = []
      this.uploadIdInfo = null
      this.currentFileIndex = 0
    },

    /**
     * 上传文件列表
     * @param {*} file
     * @param {*} fileList
     */
    handleFileChange(file, fileList) {

      fileList.forEach((item) => {
        // 去除重复文件
        if (this.uploadFileList.indexOf(item) === -1) {

          // 初始化自定义属性
          item.chunkList = [];
          item.status = FileStatus.wait;
          item.progressStatus = 'warning';
          item.uploadProgress = 0;

          // 新增文件
          this.uploadFileList.push(item);
        }
      })
    },

    /**
     * 移除文件列表
     * @param {*} file
     * @param {*} fileList
     */
    handleRemove(file, fileList) {
      this.uploadFileList = []
    },

    getNewFileName(file, md5) {
      return new Date().getTime() + file.name
    },


    /**
     * 分片读取文件 MD5
     */
    getFileMd5(file, callback) {
      const blobSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice
      const fileReader = new FileReader()
      // 计算分片数
      const totalChunks = Math.ceil(file.size / chunkSize)
      console.log('总分片数：' + totalChunks)
      let currentChunk = 0
      const spark = new SparkMD5.ArrayBuffer()
      loadNext()
      fileReader.onload = function (e) {
        try {
          spark.append(e.target.result)
        } catch (error) {
          console.log('获取Md5错误：' + currentChunk)
        }
        if (currentChunk < totalChunks) {
          currentChunk++
          loadNext()
        } else {
          callback(spark.end(), totalChunks)
        }
      }
      fileReader.onerror = function () {
        console.warn('读取Md5失败，文件读取错误')
      }

      function loadNext() {
        const start = currentChunk * chunkSize
        const end = ((start + chunkSize) >= file.size) ? file.size : start + chunkSize
        // 注意这里的 fileRaw
        fileReader.readAsArrayBuffer(blobSlice.call(file, start, end))
      }
    },

    /**
     * 文件分片
     */
    createFileChunk(file, size = chunkSize) {
      const chunks = Array.from({length: Math.ceil(file.size / size)}, (_, i) => {
        const start = i * size;
        const end = Math.min(start + size, file.size);
        return {file: file.slice(start, end)};
      });
      return chunks;
    },


    /**
     * 处理即将上传的分片列表，判断是否有已上传的分片，有则从列表中删除
     */
    processUploadChunkList(chunkList) {
      // 使用 reduce 过滤并生成新的数组
      return chunkList.reduce((acc, chunkItem) => {
        if (chunkItem.progress < 100) {
          acc.push(chunkItem);
        }
        return acc;
      }, []);
    },

    /**
     * 上传分片文件
     * @param {*} chunkList
     */
    async uploadChunkBase(chunkList) {
      const self = this;
      const promises = chunkList.map(async (chunk) => {

        const response = await axios.put(chunk.uploadUrl, chunk.chunk.file, {
          onUploadProgress: self.checkChunkUploadProgress(chunk),
          headers: {
            'Content-Type': 'application/octet-stream'
          },
          cancelToken: source.token,
        });
        if (response.status === 200) {
          console.log('分片：' + chunk.chunkNumber + ' 上传成功');
        } else {
          console.log('上传失败：' + response.status + '，' + response.statusText);
          chunkList.push(chunk);
        }
        return response;
      });
      await Promise.all(promises);
    },


    /**
     * 根据文件信息获取分片url
     * @param {*} fileParam
     */
    getFileUploadUrls(fileParam) {
      return initUpload(fileParam)
    },

    /**
     * 保存文件id
     * @param {*} data
     */
    saveFileUploadId(data) {
      localStorage.setItem(FILE_UPLOAD_ID_KEY, data)
    },

    /**
     * 检查文件上传的md5,判断是否上传
     * @param {*} md5
     */
    async checkFileUploadedByMd5(md5) {
      try {
        const response = await checkUpload(md5)
        console.log(response.data)
        return response.data
      } catch (error) {
        console.error(error)
      } finally {
        // 无论是否发生异常，都会执行
      }
    },


    /**
     * 合并文件
     *   uploadId: self.uploadIdInfo.uploadId,
     *   fileName: currentFile.name,
     *    fileMd5: fileMd5,
     *   bucketName: 'bucket'
     */
    mergeFile(fileParam) {
      const self = this;
      return new Promise((resolve, reject) => {
        mergeUpload(fileParam).then(response => {
          console.log(response.data);
          let data = response.data
          if (!data.data) {
            data.msg = FileStatus.error
            resolve(data)
          } else {
            data.msg = FileStatus.success
            resolve(data)
          }
        })
      })
    },


    /**
     * 获取当前文件进度
     */
    getCurrentFileProgress() {
      const currentFile = this.uploadFileList[this.currentFileIndex];
      if (!currentFile || !currentFile.chunkList) {
        return;
      }
      const chunkList = currentFile.chunkList;
      const uploadedSize = chunkList.reduce((acc, cur) => acc + cur.chunk.file.size * cur.progress, 0);
      // 计算方式：已上传大小 / 文件总大小
      let progress = parseInt((uploadedSize / currentFile.size).toFixed(2));
      currentFile.uploadProgress = progress;
      this.uploadFileList.currentFile = currentFile;
    },

    /**
     * 检查分片上传进度
     */
    checkChunkUploadProgress(item) {
      return p => {
        item.progress = parseInt(String((p.loaded / p.total) * 100))
        if (item.progress >= 100) {
          item.status = FileStatus.success
          item.progressStatus = 'success'
        }
        this.getCurrentFileProgress()
      }
    },

    fileSuffixTypeUtil(filename) {
      const lastDotIndex = filename.lastIndexOf('.');
      if (lastDotIndex === -1) {
        return ''; // 文件名中没有'.'，返回空字符串
      }
      return filename.slice(lastDotIndex + 1); // 返回'.'后的字符串
    },

    // 字节转标准单位
    transformByte(size) {
      const units = ['B', 'K', 'M', 'G', 'T'];
      if (!size) return '0B';
      let index = 0;
      while (size >= 1024 && index < units.length - 1) {
        size /= 1024;
        index++;
      }
      return `${size.toFixed(2)}${units[index]}`;
    },

  },
}
</script>


<style scoped>
.container {
  width: 800px;
  margin: 0 auto;
}

.file-list-wrapper {
  margin-top: 20px;
}

h2 {
  text-align: center;
}

.file-info-item {
  margin: 0 10px;
}

.upload-file-item {
  display: flex;
}

.file-progress {
  display: flex;
  align-items: center;
}

.file-progress-value {
  width: 150px;
}

.file-name {
  width: 300px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.file-size {
  width: 100px;
}
</style>
