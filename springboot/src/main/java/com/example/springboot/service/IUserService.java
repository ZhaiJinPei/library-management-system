package com.example.springboot.service;

import com.example.springboot.controller.request.UserPageRequest;
import com.example.springboot.entity.User;

import java.util.List;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
public interface IUserService {
    List<User> list();

    Object page(UserPageRequest userPageRequest);

    void save(User user);

    User getByEmail(String email);

    void updateByEmail(User user);

    void deleteByEmail(String email);

    void chargeUser(User user);
}
