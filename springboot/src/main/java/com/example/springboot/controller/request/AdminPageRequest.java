package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Api("管理员分页查询请求数据封装类")
@EqualsAndHashCode(callSuper = true)
@Data
public class AdminPageRequest extends BaseRequest {
    private String email;
    private String username;
}
