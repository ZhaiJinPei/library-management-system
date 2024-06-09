package com.example.springboot.mapper;

import com.example.springboot.controller.request.AdminPageRequest;
import com.example.springboot.controller.request.LoginRequest;
import com.example.springboot.controller.request.PasswordRequest;
import com.example.springboot.entity.Admin;
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
public interface AdminMapper {
    List<Admin> list();

    List<Admin> listByCondition(AdminPageRequest adminPageRequest);

    void save(Admin admin);

    Admin getByEmail(String email);

    void updateByEmail(Admin admin);

    void deleteByEmail(String email);

    Admin getByEmailAndPassword(LoginRequest request);

    void changePass(PasswordRequest request);

    void resetPass(PasswordRequest request);
}
