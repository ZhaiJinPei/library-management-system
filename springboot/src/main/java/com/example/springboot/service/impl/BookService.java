package com.example.springboot.service.impl;

import com.example.springboot.controller.request.BookPageRequest;
import com.example.springboot.entity.Book;
import com.example.springboot.mapper.BookMapper;
import com.example.springboot.service.IBookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Service
public class BookService implements IBookService {
    @Autowired
    BookMapper mapper;

    @Override
    public List<Book> list() {
        return mapper.list();
    }

    @Override
    public Object page(BookPageRequest request) {
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Book> books = mapper.listByCondition(request);
        return new PageInfo<>(books);
    }

    @Override
    public Book getByISBN(String isbn) {
        return mapper.getByISBN(isbn);
    }

    @Override
    public void save(Book book) {
        book.setCDate(new Date());
        book.setCategory(listToString(book.getCategories()));
        mapper.save(book);
    }

    @Override
    public void updateByISBN(Book book) {
        book.setUDate(new Date());
        book.setCategory(listToString(book.getCategories()));
        mapper.updateByISBN(book);
    }

    @Override
    public void deleteByISBN(String isbn) {
        mapper.deleteByISBN(isbn);
    }

    private String listToString(List<String> list) {
        String str = "";

        for(String s: list) {
            str += s + " > ";
        }
        // substring returns a string value
        str = str.substring(0, str.lastIndexOf(" > "));

        return str;
    }
}
