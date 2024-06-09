package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Data
public class Category {
    private Integer id;
    private String name;
    private String remark;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT-5")
    private Date cDate;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT-5")
    private Date uDate;
    private Integer pid;
    // sub-categories
    private List<Category> children;
}
