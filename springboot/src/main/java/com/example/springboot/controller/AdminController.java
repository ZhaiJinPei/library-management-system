package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.AdminPageRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.controller.request.PasswordRequest;
import com.example.springboot.entity.Admin;
import com.example.springboot.service.IAdminService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Api(tags = "AdminController: 系统管理员相关接口")
@CrossOrigin
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    IAdminService adminService;

    @PostMapping("/login")
    @ApiImplicitParam(name = "request", value = "登录请求")
    @ApiOperation(value = "/login 管理员登录", notes = "管理员登录")
    public Result login(@RequestBody LoginRequest request) {
        return Result.success(adminService.login(request));
    }

    @PostMapping("/save")
    @ApiImplicitParam(name = "admin", value = "管理员修改的密码")
    public Result save(@RequestBody Admin admin) {
        adminService.save(admin);
        return Result.success();
    }

    @PutMapping("/update")
    public Result updateByEmail(@RequestBody Admin admin) {
        adminService.updateByEmail(admin);
        return Result.success();
    }

    @PutMapping("/resetPass")
    public Result resetPass(@RequestBody PasswordRequest request) {
        adminService.resetPass(request);
        return Result.success();
    }

    @PutMapping("/changePass")
    public Result changePass(@RequestBody PasswordRequest request) {
        adminService.changePass(request);
        return Result.success();
    }

    @GetMapping("/{email}")
    public Result getByEmail(@PathVariable String email) {
        Admin admin = adminService.getByEmail(email);
        return  Result.success(admin);
    }

    @DeleteMapping("/delete/{email}")
    public Result deleteByEmail(@PathVariable String email) {
        adminService.deleteByEmail(email);
        return Result.success();
    }

    @GetMapping("/list")
    public Result list() {
        List<Admin> admin = adminService.list();
        return Result.success(admin);
    }

    @GetMapping("/page")
    public Result page(AdminPageRequest adminPageRequest) {
        return Result.success(adminService.page(adminPageRequest));
    }
}
