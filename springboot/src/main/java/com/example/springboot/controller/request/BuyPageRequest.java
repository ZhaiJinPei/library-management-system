package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Api("用户购书记录分页查询请求数据封装类")
@EqualsAndHashCode(callSuper = true)
@Data
public class BuyPageRequest extends BaseRequest{
    private String email;
    private String isbn;
    private String name; // book_name
    private String username;
}
