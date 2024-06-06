package com.example.springboot.controller.request;

import io.swagger.annotations.Api;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Api("图书分页查询请求数据封装类")
@EqualsAndHashCode(callSuper = true)
@Data
public class BookPageRequest extends BaseRequest {
    private String isbn;
    private String name;
}
