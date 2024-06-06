package com.example.springboot.controller.request;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class UserPageRequest extends BaseRequest {
    private String email;
    private String uid;
}
