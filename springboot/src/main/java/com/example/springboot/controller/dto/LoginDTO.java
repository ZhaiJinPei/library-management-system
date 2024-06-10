package com.example.springboot.controller.dto;

import io.swagger.annotations.Api;
import lombok.Data;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Api(tags = "LoginDTO:管理员登录响应数据传输对象封装")
@Data
public class LoginDTO {
    private String email;
    private String username;
    private String phone;
}
