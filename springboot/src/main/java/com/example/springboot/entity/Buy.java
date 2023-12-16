package com.example.springboot.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class Buy {

    // 主键id
    private Integer bid;


    private String isbn;

    private String email;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime cDate;

    private Integer  count;

    private Integer price;

    private Integer  total;



    private String username;

    private String uid;

    private String name; // book's name
















}
