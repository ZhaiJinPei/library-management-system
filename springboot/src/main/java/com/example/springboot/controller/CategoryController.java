package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.CategoryPageRequest;
import com.example.springboot.entity.Category;
import com.example.springboot.service.ICategoryService;
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
@CrossOrigin
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    ICategoryService categoryService;

    @PutMapping("/update")
    public Result updateByName(@RequestBody Category category) {
        categoryService.updateByName(category);
        return  Result.success();
    }

    @PostMapping("/save")
    public Result save(@RequestBody Category category) {
        categoryService.save(category);
        return Result.success();
    }

    @DeleteMapping("/delete/{name}")
    public Result deleteByName(@PathVariable String name) {
        categoryService.deleteByName(name);
        return Result.success();
    }

    @GetMapping("/{name}")
    public Result getByName(@PathVariable String name) {
        Category category = categoryService.getByName(name);
        return Result.success(category);
    }

    @GetMapping("/tree")
    public Result tree() {
        List<Category> category = categoryService.tree();
        return Result.success(category);
    }

    @GetMapping("/page")
    public Result page(CategoryPageRequest request) {
        return Result.success(categoryService.page(request));
    }
}
