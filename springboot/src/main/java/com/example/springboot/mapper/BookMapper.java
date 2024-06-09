package com.example.springboot.mapper;

import com.example.springboot.controller.request.BookPageRequest;
import com.example.springboot.entity.Book;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@Mapper
public interface BookMapper {

    List<Book> list();

    List<Book> listByCondition(BookPageRequest request);

    Book getByISBN(String isbn);

    void save(Book book);

    void updateByISBN(Book book);

    void deleteByISBN(String isbn);
}
