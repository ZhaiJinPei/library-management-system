package com.example.springboot.entity;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.util.Map;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@ApiModel(value = "")
@Data
public class LineChart {
    private Map<String, Object> lineChartMap;
}
