package com.example.springboot.mapper;

import com.example.springboot.controller.request.ReternPageRequest;
import com.example.springboot.entity.Retern;
import com.example.springboot.mapper.po.BorrowReternCountPO;
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
public interface ReternMapper {
    List<Retern> list();

    List<Retern> listByCondition(ReternPageRequest request);

    void deleteByEmailAndISBN(String email, String isbn);

    void save(Retern retern);

    List<Retern> selectByEmailAndISBN(String email, String isbn);

    List<BorrowReternCountPO> countByADate(String range);
}
