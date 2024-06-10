package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.service.ILineChartService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Api(tags = "LineChartController: 折线图相关接口")
@CrossOrigin
@RestController
@RequestMapping("/lineChart")
public class LineChartController {
    @Autowired
    ILineChartService service;

    @GetMapping("getLineChart/{range}")
    public Result getLineChart(@PathVariable String range) {
        return Result.success(service.getLineChart(range));
    }
}
