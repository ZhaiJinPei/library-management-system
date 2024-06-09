package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Api("基本分页请求对象封装类")
@Data
public class BaseRequest {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
}
