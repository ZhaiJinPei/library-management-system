package com.xy.fileservice.controller;


import com.xy.fileservice.entity.FileUploadInfo;
import com.xy.fileservice.service.UploadService;
import com.xy.fileservice.util.MinioUtils;
import com.xy.fileservice.util.ResponseResult;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;


/**
 * minio上传流程
 * <p>
 * 1.检查数据库中是否存在上传文件
 * <p>
 * 2.根据文件信息初始化，获取分片预签名url地址，前端根据url地址上传文件
 * <p>
 * 3.上传完成后，将分片上传的文件进行合并
 * <p>
 * 4.保存文件信息到数据库
 */
@Slf4j
@RestController
@RequestMapping("/upload")
public class FileMinioController {

    @Resource
    private UploadService uploadService;

    @Resource
    private MinioUtils minioUtils;

    /**
     * 校验文件是否存在
     *
     * @param md5 String
     * @return ResponseResult<Object>
     */
    @GetMapping("/multipart/check")
    public ResponseResult checkFileUploadedByMd5(@RequestParam("md5") String md5) {
        log.info("REST: 通过查询 <{}> 文件是否存在、是否进行断点续传", md5);
        return uploadService.getByFileMd5(md5);
    }

    /**
     * 分片初始化
     *
     * @param fileUploadInfo 文件信息
     * @return ResponseResult<Object>
     */
    @PostMapping("/multipart/init")
    public ResponseResult initMultiPartUpload(@RequestBody FileUploadInfo fileUploadInfo) {
        log.info("REST: 通过 <{}> 初始化上传任务", fileUploadInfo);
        return uploadService.initMultiPartUpload(fileUploadInfo);
    }

    /**
     * 完成上传
     *
     * @param fileUploadInfo 文件信息
     * @return ResponseResult<Object>
     */
    @PostMapping("/multipart/merge")
    public ResponseResult completeMultiPartUpload(@RequestBody FileUploadInfo fileUploadInfo) {
        log.info("REST: 通过 <{}> 合并上传任务", fileUploadInfo);
        return uploadService.mergeMultipartUpload(fileUploadInfo);
    }


    @RequestMapping("/createBucket")
    public void createBucket(@RequestParam("bucketName") String bucketName) {
        String bucket = minioUtils.createBucket(bucketName);
    }

}
