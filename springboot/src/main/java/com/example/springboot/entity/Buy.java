package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@ApiModel(value = "Buy: 购书记录实体类")
@Data
public class Buy {

    // 主键id
    private Integer bid;


    private String isbn;

    private String email;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime cDate;

    private Integer  count;

    private Integer price;

    private Integer  total;



    private String username;

    private String uid;

    private String name; // book's name
















}
