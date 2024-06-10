package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@ApiModel(value = "User: 非管理员用户实体类")
@EqualsAndHashCode(callSuper = true)
@Data
public class User extends Person {
    private String gender;
    private String uid;
    private Integer age;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT-5")
    private Date cTime;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT-5")
    private Date uTime;
    private Integer aCredit; // credit in the user account
    private Integer charge; // users charge up their account
}
