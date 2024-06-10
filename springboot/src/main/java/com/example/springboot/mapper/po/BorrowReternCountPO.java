package com.example.springboot.mapper.po;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@ApiModel("BorrowReturnCountPO: 借还计数持久层对象封装")
@Data
public class BorrowReternCountPO {
    private String date;
    private Integer count;
}
