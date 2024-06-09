package com.example.springboot.entity;

import lombok.Data;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Data
public class Person {
    private String email;
    private String fname;
    private String minit;
    private String lname;
    private String username;
    private String province;
    private String city;
    private String street;
    private String phone;
    private boolean status;
}
