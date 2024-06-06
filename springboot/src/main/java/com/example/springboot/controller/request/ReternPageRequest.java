package com.example.springboot.controller.request;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class ReternPageRequest extends BaseRequest {
    private String email;
    private String isbn;
    private String name; // book_name
    private String username;
}
