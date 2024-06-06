package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;

@Api("管理员登录请求数据封装类")
@Data
public class LoginRequest {
    private String email;
    private String password;
}
