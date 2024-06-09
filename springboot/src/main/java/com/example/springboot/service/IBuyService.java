package com.example.springboot.service;

import com.example.springboot.controller.request.BuyPageRequest;
import com.example.springboot.entity.Buy;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
public interface IBuyService {

    Object page(BuyPageRequest request);

    void save(Buy buy);


}
