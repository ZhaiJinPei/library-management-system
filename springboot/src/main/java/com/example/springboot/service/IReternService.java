package com.example.springboot.service;

import com.example.springboot.controller.request.ReternPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Retern;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
public interface IReternService {
    List<Retern> list();

    Object page(ReternPageRequest request);

    void deleteByEmailAndISBN(String email, String isbn);

    void save(Borrow borrow);
}
