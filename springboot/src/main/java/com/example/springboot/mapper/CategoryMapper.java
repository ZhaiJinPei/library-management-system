package com.example.springboot.mapper;

import com.example.springboot.controller.request.CategoryPageRequest;
import com.example.springboot.entity.Category;
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
public interface CategoryMapper {
    List<Category> tree();

    List<Category> listByCondition(CategoryPageRequest request);

    void save(Category category);

    void updateByName(Category category);

    Category getByName(String name);

    void deleteByName(String name);
}
