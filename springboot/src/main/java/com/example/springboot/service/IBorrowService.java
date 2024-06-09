package com.example.springboot.service;

import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.entity.Borrow;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
public interface IBorrowService {
    List<Borrow> list();

    Object page(BorrowPageRequest request);

    void save(Borrow borrow);

    Borrow getByEmailAndISBN(String email, String isbn, Integer id);

    void updateByEmailAndISBN(Borrow borrow);

    void deleteByEmailAndISBN(String email, String isbn, Integer id);

}
