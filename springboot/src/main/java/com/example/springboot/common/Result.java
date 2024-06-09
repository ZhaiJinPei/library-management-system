package com.example.springboot.common;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * [Apache License 2.0](<a href="https://www.apache.org/licenses/LICENSE-2.0">...</a>)
 * <p>
 * This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
 * <p>
 * Copyright (c) 2024-present, Zhai JinPei
 */
@ApiModel(value = "Result:响应结果封装类", description = "统一返回数据格式和处理结果")
@Data
public class Result {
    private static final String SUCCESS_CODE = "200";
    private static final String ERROR_CODE = "-1";

    @ApiModelProperty(value = "提示信息", notes = "对接口调用结果进行描述", example = "System failure")
    private String msg;
    @ApiModelProperty(value = "状态码", notes = "表示接口调用的执行情况", example = "200")
    private String code;
    @ApiModelProperty(value = "数据体", notes = "表示接口调用返回的数据集")
    private Object data;

    public static Result success() {
        Result result = new Result();
        result.setCode(SUCCESS_CODE);
        return result;
    }

    public static Result success(Object data) {
        Result result = new Result();
        result.setCode(SUCCESS_CODE);
        result.setData(data);
        return result;
    }

    public static Result error(String msg) {
        Result result = new Result();
        result.setCode(ERROR_CODE);
        result.setMsg(msg);
        return result;
    }
}
