package com.example.springboot.controller.dto;

import io.swagger.annotations.Api;
import lombok.Data;

@Api("LoginDTO:管理员登录数据封装类")
@Data
public class LoginDTO {
    private String email;
    private String username;
    private String phone;
}
