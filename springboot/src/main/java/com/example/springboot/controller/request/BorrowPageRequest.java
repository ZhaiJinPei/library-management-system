package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Api("用户借阅记录分页查询请求数据封装类")
@EqualsAndHashCode(callSuper = true)
@Data
public class BorrowPageRequest extends BaseRequest{
    private String email;
    private String isbn;
    private String name; // book_name
    private String username;
}
