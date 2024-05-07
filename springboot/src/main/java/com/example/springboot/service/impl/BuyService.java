package com.example.springboot.service.impl;

import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.controller.request.BuyPageRequest;
import com.example.springboot.entity.Book;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Buy;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.BookMapper;
import com.example.springboot.mapper.BorrowMapper;
import com.example.springboot.mapper.BuyMapper;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.IBorrowService;
import com.example.springboot.service.IBuyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
public class BuyService implements IBuyService {
    @Autowired
    BuyMapper mapper;
    @Autowired
    BookMapper bookMapper;

    @Autowired
    UserMapper userMapper;



    @Override
    public Object page(BuyPageRequest request) {
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Buy> borrows = mapper.listByCondition(request);
        LocalDateTime now = LocalDateTime.now();
        return new PageInfo<>(borrows);
    }

    @Override
    @Transactional
    public void save(Buy buy) {
        buy.setCDate(LocalDateTime.now());
        String isbn = buy.getIsbn();
        String email = buy.getEmail();
        Book book = bookMapper.getByISBN(isbn);
        User user = userMapper.getByEmail(email);
        if(Objects.isNull(book)) {
            throw new ServiceException("Book does not exist");
        }
        if(Objects.isNull(user)) {
            throw new ServiceException("User does not exist");
        }
        mapper.save(buy);
    }


}
