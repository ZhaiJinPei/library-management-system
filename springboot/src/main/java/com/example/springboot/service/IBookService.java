package com.example.springboot.service;

import com.example.springboot.controller.request.BookPageRequest;
import com.example.springboot.entity.Book;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
public interface IBookService {
    List<Book> list();

    Object page(BookPageRequest request);

    Book getByISBN(String isbn);

    void save(Book book);

    void updateByISBN(Book book);

    void deleteByISBN(String isbn);
}
