package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;

@Api("基本分页请求对象封装类")
@Data
public class BaseRequest {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
}
