package com.example.springboot.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class Admin extends Person {
    private String passwrd;
}
