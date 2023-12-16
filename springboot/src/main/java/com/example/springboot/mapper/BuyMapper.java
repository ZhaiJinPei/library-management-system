package com.example.springboot.mapper;

import com.example.springboot.controller.request.BorrowPageRequest;
import com.example.springboot.controller.request.BuyPageRequest;
import com.example.springboot.entity.Borrow;
import com.example.springboot.entity.Buy;
import com.example.springboot.mapper.po.BorrowReternCountPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuyMapper {


    List<Buy> listByCondition(BuyPageRequest request);

    void save(Buy buy);

}
