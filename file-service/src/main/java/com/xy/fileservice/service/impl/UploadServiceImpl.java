package com.xy.fileservice.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.xy.fileservice.entity.FileUploadInfo;
import com.xy.fileservice.service.UploadService;
import com.xy.fileservice.util.MinioUtils;
import com.xy.fileservice.util.RedisRepo;
import com.xy.fileservice.util.ResponseResult;
import com.xy.fileservice.util.ResultCode;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;

import static com.xy.fileservice.util.ResultCode.ACCESS_PARAMETER_INVALID;

@Slf4j
@Service
public class UploadServiceImpl implements UploadService {


    @Resource
    private MinioUtils fileService;

    @Resource
    private RedisRepo redisRepo;


    /**
     * 通过 md5 获取已上传的数据（断点续传）
     *
     * @param md5 String
     * @return Mono<Map < String, Object>>
     */
    @Override
    public ResponseResult<Object> getByFileMd5(String md5) {

        if (StringUtils.hasText(md5)) {
            log.error("查询文件是否存在、入参无效");
            return ResponseResult.error(ACCESS_PARAMETER_INVALID);
        }

        log.info("tip message: 通过 <{}> 查询数据是否存在", md5);

        // 获取文件名称和id
        String value = redisRepo.get(md5);

        FileUploadInfo fileUploadInfo = null;

        if (StringUtils.hasText(value)) {
            fileUploadInfo = JSONObject.parseObject(value, FileUploadInfo.class);
        }

        if (Objects.isNull(fileUploadInfo)) {
            // 返回数据不存在
            log.error("error message: 文件数据不存在");
            return ResponseResult.error(ResultCode.FOUND);
        }

        // 获取桶名称
        String bucketName = fileService.getBucketName(fileUploadInfo.getFileType());

        return fileService.getByFileMd5(fileUploadInfo.getFileName(), fileUploadInfo.getUploadId(), bucketName);
    }


    /**
     * 文件分片上传
     *
     * @param fileUploadInfo
     * @return Mono<Map < String, Object>>
     */
    @Override
    public ResponseResult<Object> initMultiPartUpload(FileUploadInfo fileUploadInfo) {

        log.info("tip message: 通过 <{}> 开始初始化<分片上传>任务", fileUploadInfo);

        // 获取文件桶名
        String bucketName = fileService.getBucketName(fileUploadInfo.getFileType());

        // 单文件上传可拆分，可直接上传完成
        if (fileUploadInfo.getPartCount() == 1) {

            log.info("tip message: 当前分片数量 <{}> 进行单文件上传", fileUploadInfo.getPartCount());

            // 获取文件分片上传的url
            return fileService.getUploadObjectUrl(fileUploadInfo.getFileName(), bucketName);

        } else {

            log.info("tip message: 当前分片数量 <{}> 进行分片上传", fileUploadInfo.getPartCount());

            // 获取文件分片上传的url
            return fileService.initMultiPartUpload(fileUploadInfo, fileUploadInfo.getFileName(), fileUploadInfo.getPartCount(), fileUploadInfo.getContentType(), bucketName);
        }

    }

    /**
     * 文件合并
     *
     * @param
     * @return boolean
     */
    @Override
    public ResponseResult mergeMultipartUpload(FileUploadInfo fileUploadInfo) {

        log.info("tip message: 通过 <{}> 开始合并<分片上传>任务", fileUploadInfo);

        // 获取桶名称
        String bucketName = fileService.getBucketName(fileUploadInfo.getFileType());

        // 获取合并结果
        boolean result = fileService.mergeMultipartUpload(fileUploadInfo.getFileName(), fileUploadInfo.getUploadId(), bucketName);

        //获取上传文件地址
        if (result) {
            String filePath = fileService.getFilePath(fileUploadInfo.getFileType().toLowerCase(), fileUploadInfo.getFileName());
            return ResponseResult.success(filePath);
        }

        log.error("error message: 文件合并异常");

        return ResponseResult.error();
    }


    @Override
    public String getFilePath(String bucketName, String fileName) {
        return fileService.getFilePath(bucketName, fileName);
    }


    @Override
    public String upload(MultipartFile file, String bucketName) {
        fileService.upload(file, bucketName);
        return getFilePath(bucketName, file.getName());
    }


}
