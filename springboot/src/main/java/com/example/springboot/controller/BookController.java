package com.example.springboot.controller;

import com.example.springboot.common.Result;
import com.example.springboot.controller.request.BookPageRequest;
import com.example.springboot.entity.Book;
import com.example.springboot.service.IBookService;
import io.swagger.annotations.Api;
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
@Api(tags = "BookController: 图书相关接口")
@CrossOrigin
@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    IBookService service;

    @PostMapping("/save")
    public Result save(@RequestBody Book book) {
        service.save(book);
        return Result.success();
    }

    @PutMapping("/update")
    public Result updateByISBN(@RequestBody Book book) {
        service.updateByISBN(book);
        return Result.success();
    }

    @DeleteMapping("/delete/{isbn}")
    public Result deleteByISBN(@PathVariable String isbn) {
        service.deleteByISBN(isbn);
        return Result.success();
    }

    @GetMapping("/{isbn}")
    public Result getByISBN(@PathVariable String isbn) {
        Book book = service.getByISBN(isbn);
        return Result.success(book);
    }

    @GetMapping("/list")
    public Result list() {
        List<Book> book = service.list();
        return Result.success(book);
    }

    @GetMapping("/page")
    public Result page(BookPageRequest request) {
        return Result.success(service.page(request));
    }
}
