package com.example.springboot.service;

import com.example.springboot.controller.request.CategoryPageRequest;
import com.example.springboot.entity.Category;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
public interface ICategoryService {
    List<Category> tree();

    Object page(CategoryPageRequest request);

    void save(Category category);

    void updateByName(Category category);

    Category getByName(String name);

    void deleteByName(String name);

}
