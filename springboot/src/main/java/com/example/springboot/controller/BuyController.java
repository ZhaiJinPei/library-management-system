package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.BuyPageRequest;
import com.example.springboot.entity.Buy;
import com.example.springboot.service.IBuyService;
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
@Api(tags = "BuyController: 购书相关接口")
@CrossOrigin
@RestController
@RequestMapping("/buy")
public class BuyController {
    @Autowired
    IBuyService service;

    @PostMapping("/save")
    public Result save(@RequestBody Buy buy) {
        buy.setTotal(buy.getPrice()*buy.getCount());
        service.save(buy);
        return Result.success();
    }


    @GetMapping("/page")
    public Result page(BuyPageRequest request) {
        return Result.success(service.page(request));
    }

}
