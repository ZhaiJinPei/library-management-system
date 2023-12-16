package com.example.springboot.service;

import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.controller.request.BuyPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Buy;

import java.util.List;

public interface IBuyService {

    Object page(BuyPageRequest request);

    void save(Buy buy);


}
