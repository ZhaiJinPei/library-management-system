package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.controller.request.BuyPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Buy;
import com.example.springboot.service.IBorrowService;
import com.example.springboot.service.IBuyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
