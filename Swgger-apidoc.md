# 图书管理系统接口文档

**简介**:图书管理系统接口文档

**HOST**:10.20.245.160:9090

**联系人**:ZhaiJinPei

**Version**:1.0.1

**接口路径**:/v2/api-docs?group=api

[TOC]

# AdminController: 系统管理员相关接口

## changePass

**接口地址**:`/admin/changePass`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "email"
:
    "",
        "newPassword"
:
    "",
        "password"
:
    ""
}
```

**请求参数**:

| 参数名称                    | 参数说明    | 请求类型 | 是否必须  | 数据类型            | schema          |
|-------------------------|---------|------|-------|-----------------|-----------------|
| request                 | request | body | true  | PasswordRequest | PasswordRequest |
| &emsp;&emsp;email       |         |      | false | string          |                 |
| &emsp;&emsp;newPassword |         |      | false | string          |                 |
| &emsp;&emsp;password    |         |      | false | string          |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## deleteByEmail

**接口地址**:`/admin/delete/{email}`

**请求方式**:`DELETE`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型   | schema |
|-------|-------|------|------|--------|--------|
| email | email | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 204 | No Content   |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## list

**接口地址**:`/admin/list`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## -login 管理员登录

**接口地址**:`/admin/login`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:<p>管理员登录</p>

**请求参数**:

| 参数名称    | 参数说明 | 请求类型 | 是否必须  | 数据类型   | schema |
|---------|------|------|-------|--------|--------|
| request | 登录请求 | body | false | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## page

**接口地址**:`/admin/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| email    |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |
| username |      | query | false | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## resetPass

**接口地址**:`/admin/resetPass`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "email"
:
    "",
        "newPassword"
:
    "",
        "password"
:
    ""
}
```

**请求参数**:

| 参数名称                    | 参数说明    | 请求类型 | 是否必须  | 数据类型            | schema          |
|-------------------------|---------|------|-------|-----------------|-----------------|
| request                 | request | body | true  | PasswordRequest | PasswordRequest |
| &emsp;&emsp;email       |         |      | false | string          |                 |
| &emsp;&emsp;newPassword |         |      | false | string          |                 |
| &emsp;&emsp;password    |         |      | false | string          |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/admin/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明     | 请求类型 | 是否必须  | 数据类型   | schema |
|-------|----------|------|-------|--------|--------|
| admin | 管理员修改的密码 | body | false | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## updateByEmail

**接口地址**:`/admin/update`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "city"
:
    "",
        "email"
:
    "",
        "fname"
:
    "",
        "lname"
:
    "",
        "minit"
:
    "",
        "passwrd"
:
    "",
        "phone"
:
    "",
        "province"
:
    "",
        "status"
:
    true,
        "street"
:
    "",
        "username"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明  | 请求类型 | 是否必须  | 数据类型          | schema        |
|----------------------|-------|------|-------|---------------|---------------|
| admin                | admin | body | true  | Admin: 管理员实体类 | Admin: 管理员实体类 |
| &emsp;&emsp;city     |       |      | false | string        |               |
| &emsp;&emsp;email    |       |      | false | string        |               |
| &emsp;&emsp;fname    |       |      | false | string        |               |
| &emsp;&emsp;lname    |       |      | false | string        |               |
| &emsp;&emsp;minit    |       |      | false | string        |               |
| &emsp;&emsp;passwrd  |       |      | false | string        |               |
| &emsp;&emsp;phone    |       |      | false | string        |               |
| &emsp;&emsp;province |       |      | false | string        |               |
| &emsp;&emsp;status   |       |      | false | boolean       |               |
| &emsp;&emsp;street   |       |      | false | string        |               |
| &emsp;&emsp;username |       |      | false | string        |               |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## getByEmail

**接口地址**:`/admin/{email}`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型   | schema |
|-------|-------|------|------|--------|--------|
| email | email | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# BookController: 图书相关接口

## deleteByISBN

**接口地址**:`/book/delete/{isbn}`

**请求方式**:`DELETE`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称 | 参数说明 | 请求类型 | 是否必须 | 数据类型   | schema |
|------|------|------|------|--------|--------|
| isbn | isbn | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 204 | No Content   |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## list

**接口地址**:`/book/list`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## page

**接口地址**:`/book/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| isbn     |      | query | false | string         |        |
| name     |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/book/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "author"
:
    "",
        "cDate"
:
    "",
        "categories"
:
    [],
        "category"
:
    "",
        "cdate"
:
    "",
        "cover"
:
    "",
        "credit"
:
    0,
        "description"
:
    "",
        "isbn"
:
    "",
        "name"
:
    "",
        "number"
:
    0,
        "publish_date"
:
    "",
        "publisher"
:
    "",
        "uDate"
:
    "",
        "udate"
:
    ""
}
```

**请求参数**:

| 参数名称                     | 参数说明 | 请求类型 | 是否必须  | 数据类型              | schema      |
|--------------------------|------|------|-------|-------------------|-------------|
| book                     | book | body | true  | Book: 图书实体类       | Book: 图书实体类 |
| &emsp;&emsp;author       |      |      | false | string            |             |
| &emsp;&emsp;cDate        |      |      | false | string(date-time) |             |
| &emsp;&emsp;categories   |      |      | false | array             | string      |
| &emsp;&emsp;category     |      |      | false | string            |             |
| &emsp;&emsp;cdate        |      |      | false | string(date-time) |             |
| &emsp;&emsp;cover        |      |      | false | string            |             |
| &emsp;&emsp;credit       |      |      | false | integer(int32)    |             |
| &emsp;&emsp;description  |      |      | false | string            |             |
| &emsp;&emsp;isbn         |      |      | false | string            |             |
| &emsp;&emsp;name         |      |      | false | string            |             |
| &emsp;&emsp;number       |      |      | false | integer(int32)    |             |
| &emsp;&emsp;publish_date |      |      | false | string            |             |
| &emsp;&emsp;publisher    |      |      | false | string            |             |
| &emsp;&emsp;uDate        |      |      | false | string(date-time) |             |
| &emsp;&emsp;udate        |      |      | false | string(date-time) |             |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## updateByISBN

**接口地址**:`/book/update`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "author"
:
    "",
        "cDate"
:
    "",
        "categories"
:
    [],
        "category"
:
    "",
        "cdate"
:
    "",
        "cover"
:
    "",
        "credit"
:
    0,
        "description"
:
    "",
        "isbn"
:
    "",
        "name"
:
    "",
        "number"
:
    0,
        "publish_date"
:
    "",
        "publisher"
:
    "",
        "uDate"
:
    "",
        "udate"
:
    ""
}
```

**请求参数**:

| 参数名称                     | 参数说明 | 请求类型 | 是否必须  | 数据类型              | schema      |
|--------------------------|------|------|-------|-------------------|-------------|
| book                     | book | body | true  | Book: 图书实体类       | Book: 图书实体类 |
| &emsp;&emsp;author       |      |      | false | string            |             |
| &emsp;&emsp;cDate        |      |      | false | string(date-time) |             |
| &emsp;&emsp;categories   |      |      | false | array             | string      |
| &emsp;&emsp;category     |      |      | false | string            |             |
| &emsp;&emsp;cdate        |      |      | false | string(date-time) |             |
| &emsp;&emsp;cover        |      |      | false | string            |             |
| &emsp;&emsp;credit       |      |      | false | integer(int32)    |             |
| &emsp;&emsp;description  |      |      | false | string            |             |
| &emsp;&emsp;isbn         |      |      | false | string            |             |
| &emsp;&emsp;name         |      |      | false | string            |             |
| &emsp;&emsp;number       |      |      | false | integer(int32)    |             |
| &emsp;&emsp;publish_date |      |      | false | string            |             |
| &emsp;&emsp;publisher    |      |      | false | string            |             |
| &emsp;&emsp;uDate        |      |      | false | string(date-time) |             |
| &emsp;&emsp;udate        |      |      | false | string(date-time) |             |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## getByISBN

**接口地址**:`/book/{isbn}`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称 | 参数说明 | 请求类型 | 是否必须 | 数据类型   | schema |
|------|------|------|------|--------|--------|
| isbn | isbn | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# BorrowController: 借书相关接口

## deleteByEmailAndISBN

**接口地址**:`/borrow/delete/{email}&{isbn}&{id}`

**请求方式**:`DELETE`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型           | schema |
|-------|-------|------|------|----------------|--------|
| email | email | path | true | string         |        |
| id    | id    | path | true | integer(int32) |        |
| isbn  | isbn  | path | true | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 204 | No Content   |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## list

**接口地址**:`/borrow/list`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## page

**接口地址**:`/borrow/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| email    |      | query | false | string         |        |
| isbn     |      | query | false | string         |        |
| name     |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |
| username |      | query | false | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/borrow/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "acredit"
:
    "",
        "bstatus"
:
    "",
        "cDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "cdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "credit"
:
    0,
        "duration"
:
    0,
        "email"
:
    "",
        "id"
:
    0,
        "isbn"
:
    "",
        "name"
:
    "",
        "notification"
:
    "",
        "phone"
:
    "",
        "rDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "rdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "uid"
:
    "",
        "username"
:
    ""
}
```

**请求参数**:

| 参数名称                     | 参数说明   | 请求类型 | 是否必须  | 数据类型            | schema          |
|--------------------------|--------|------|-------|-----------------|-----------------|
| borrow                   | borrow | body | true  | Borrow: 借阅记录实体类 | Borrow: 借阅记录实体类 |
| &emsp;&emsp;acredit      |        |      | false | string          |                 |
| &emsp;&emsp;bstatus      |        |      | false | string          |                 |
| &emsp;&emsp;cDate        |        |      | false | string          |                 |
| &emsp;&emsp;cdate        |        |      | false | string          |                 |
| &emsp;&emsp;credit       |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;duration     |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;email        |        |      | false | string          |                 |
| &emsp;&emsp;id           |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;isbn         |        |      | false | string          |                 |
| &emsp;&emsp;name         |        |      | false | string          |                 |
| &emsp;&emsp;notification |        |      | false | string          |                 |
| &emsp;&emsp;phone        |        |      | false | string          |                 |
| &emsp;&emsp;rDate        |        |      | false | string          |                 |
| &emsp;&emsp;rdate        |        |      | false | string          |                 |
| &emsp;&emsp;uid          |        |      | false | string          |                 |
| &emsp;&emsp;username     |        |      | false | string          |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## updateByEmailAndISBN

**接口地址**:`/borrow/update`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "acredit"
:
    "",
        "bstatus"
:
    "",
        "cDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "cdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "credit"
:
    0,
        "duration"
:
    0,
        "email"
:
    "",
        "id"
:
    0,
        "isbn"
:
    "",
        "name"
:
    "",
        "notification"
:
    "",
        "phone"
:
    "",
        "rDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "rdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "uid"
:
    "",
        "username"
:
    ""
}
```

**请求参数**:

| 参数名称                     | 参数说明   | 请求类型 | 是否必须  | 数据类型            | schema          |
|--------------------------|--------|------|-------|-----------------|-----------------|
| borrow                   | borrow | body | true  | Borrow: 借阅记录实体类 | Borrow: 借阅记录实体类 |
| &emsp;&emsp;acredit      |        |      | false | string          |                 |
| &emsp;&emsp;bstatus      |        |      | false | string          |                 |
| &emsp;&emsp;cDate        |        |      | false | string          |                 |
| &emsp;&emsp;cdate        |        |      | false | string          |                 |
| &emsp;&emsp;credit       |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;duration     |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;email        |        |      | false | string          |                 |
| &emsp;&emsp;id           |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;isbn         |        |      | false | string          |                 |
| &emsp;&emsp;name         |        |      | false | string          |                 |
| &emsp;&emsp;notification |        |      | false | string          |                 |
| &emsp;&emsp;phone        |        |      | false | string          |                 |
| &emsp;&emsp;rDate        |        |      | false | string          |                 |
| &emsp;&emsp;rdate        |        |      | false | string          |                 |
| &emsp;&emsp;uid          |        |      | false | string          |                 |
| &emsp;&emsp;username     |        |      | false | string          |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## getByEmail

**接口地址**:`/borrow/{email}&{isbn}&{id}`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型           | schema |
|-------|-------|------|------|----------------|--------|
| email | email | path | true | string         |        |
| id    | id    | path | true | integer(int32) |        |
| isbn  | isbn  | path | true | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# BuyController: 购书相关接口

## page

**接口地址**:`/buy/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| email    |      | query | false | string         |        |
| isbn     |      | query | false | string         |        |
| name     |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |
| username |      | query | false | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/buy/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "bid"
:
    0,
        "cDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "cdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "count"
:
    0,
        "email"
:
    "",
        "isbn"
:
    "",
        "name"
:
    "",
        "price"
:
    0,
        "total"
:
    0,
        "uid"
:
    "",
        "username"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明 | 请求类型 | 是否必须  | 数据类型           | schema       |
|----------------------|------|------|-------|----------------|--------------|
| buy                  | buy  | body | true  | Buy: 购书记录实体类   | Buy: 购书记录实体类 |
| &emsp;&emsp;bid      |      |      | false | integer(int32) |              |
| &emsp;&emsp;cDate    |      |      | false | string         |              |
| &emsp;&emsp;cdate    |      |      | false | string         |              |
| &emsp;&emsp;count    |      |      | false | integer(int32) |              |
| &emsp;&emsp;email    |      |      | false | string         |              |
| &emsp;&emsp;isbn     |      |      | false | string         |              |
| &emsp;&emsp;name     |      |      | false | string         |              |
| &emsp;&emsp;price    |      |      | false | integer(int32) |              |
| &emsp;&emsp;total    |      |      | false | integer(int32) |              |
| &emsp;&emsp;uid      |      |      | false | string         |              |
| &emsp;&emsp;username |      |      | false | string         |              |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# CategoryController: 图书类型相关接口

## deleteByName

**接口地址**:`/category/delete/{name}`

**请求方式**:`DELETE`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称 | 参数说明 | 请求类型 | 是否必须 | 数据类型   | schema |
|------|------|------|------|--------|--------|
| name | name | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 204 | No Content   |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## page

**接口地址**:`/category/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| name     |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/category/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "cDate"
:
    "",
        "cdate"
:
    "",
        "children"
:
    [
        {
            "cDate": "",
            "cdate": "",
            "children": [],
            "id": 0,
            "name": "",
            "pid": 0,
            "remark": "",
            "uDate": "",
            "udate": ""
        }
    ],
        "id"
:
    0,
        "name"
:
    "",
        "pid"
:
    0,
        "remark"
:
    "",
        "uDate"
:
    "",
        "udate"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明     | 请求类型 | 是否必须  | 数据类型              | schema            |
|----------------------|----------|------|-------|-------------------|-------------------|
| category             | category | body | true  | Category: 图书类型实体类 | Category: 图书类型实体类 |
| &emsp;&emsp;cDate    |          |      | false | string(date-time) |                   |
| &emsp;&emsp;cdate    |          |      | false | string(date-time) |                   |
| &emsp;&emsp;children |          |      | false | array             | Category: 图书类型实体类 |
| &emsp;&emsp;id       |          |      | false | integer(int32)    |                   |
| &emsp;&emsp;name     |          |      | false | string            |                   |
| &emsp;&emsp;pid      |          |      | false | integer(int32)    |                   |
| &emsp;&emsp;remark   |          |      | false | string            |                   |
| &emsp;&emsp;uDate    |          |      | false | string(date-time) |                   |
| &emsp;&emsp;udate    |          |      | false | string(date-time) |                   |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## tree

**接口地址**:`/category/tree`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## updateByName

**接口地址**:`/category/update`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "cDate"
:
    "",
        "cdate"
:
    "",
        "children"
:
    [
        {
            "cDate": "",
            "cdate": "",
            "children": [],
            "id": 0,
            "name": "",
            "pid": 0,
            "remark": "",
            "uDate": "",
            "udate": ""
        }
    ],
        "id"
:
    0,
        "name"
:
    "",
        "pid"
:
    0,
        "remark"
:
    "",
        "uDate"
:
    "",
        "udate"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明     | 请求类型 | 是否必须  | 数据类型              | schema            |
|----------------------|----------|------|-------|-------------------|-------------------|
| category             | category | body | true  | Category: 图书类型实体类 | Category: 图书类型实体类 |
| &emsp;&emsp;cDate    |          |      | false | string(date-time) |                   |
| &emsp;&emsp;cdate    |          |      | false | string(date-time) |                   |
| &emsp;&emsp;children |          |      | false | array             | Category: 图书类型实体类 |
| &emsp;&emsp;id       |          |      | false | integer(int32)    |                   |
| &emsp;&emsp;name     |          |      | false | string            |                   |
| &emsp;&emsp;pid      |          |      | false | integer(int32)    |                   |
| &emsp;&emsp;remark   |          |      | false | string            |                   |
| &emsp;&emsp;uDate    |          |      | false | string(date-time) |                   |
| &emsp;&emsp;udate    |          |      | false | string(date-time) |                   |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## getByName

**接口地址**:`/category/{name}`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称 | 参数说明 | 请求类型 | 是否必须 | 数据类型   | schema |
|------|------|------|------|--------|--------|
| name | name | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# LineChartController: 折线图相关接口

## getLineChart

**接口地址**:`/lineChart/getLineChart/{range}`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型   | schema |
|-------|-------|------|------|--------|--------|
| range | range | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# ReturnController: 还书相关接口

## deleteByEmailAndISBN

**接口地址**:`/retern/delete/{email}&{isbn}`

**请求方式**:`DELETE`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型   | schema |
|-------|-------|------|------|--------|--------|
| email | email | path | true | string |        |
| isbn  | isbn  | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 204 | No Content   |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## list

**接口地址**:`/retern/list`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## page

**接口地址**:`/retern/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| email    |      | query | false | string         |        |
| isbn     |      | query | false | string         |        |
| name     |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |
| username |      | query | false | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/retern/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "acredit"
:
    "",
        "bstatus"
:
    "",
        "cDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "cdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "credit"
:
    0,
        "duration"
:
    0,
        "email"
:
    "",
        "id"
:
    0,
        "isbn"
:
    "",
        "name"
:
    "",
        "notification"
:
    "",
        "phone"
:
    "",
        "rDate"
:
    "yyyy-MM-dd HH:mm:ss",
        "rdate"
:
    "yyyy-MM-dd HH:mm:ss",
        "uid"
:
    "",
        "username"
:
    ""
}
```

**请求参数**:

| 参数名称                     | 参数说明   | 请求类型 | 是否必须  | 数据类型            | schema          |
|--------------------------|--------|------|-------|-----------------|-----------------|
| borrow                   | borrow | body | true  | Borrow: 借阅记录实体类 | Borrow: 借阅记录实体类 |
| &emsp;&emsp;acredit      |        |      | false | string          |                 |
| &emsp;&emsp;bstatus      |        |      | false | string          |                 |
| &emsp;&emsp;cDate        |        |      | false | string          |                 |
| &emsp;&emsp;cdate        |        |      | false | string          |                 |
| &emsp;&emsp;credit       |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;duration     |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;email        |        |      | false | string          |                 |
| &emsp;&emsp;id           |        |      | false | integer(int32)  |                 |
| &emsp;&emsp;isbn         |        |      | false | string          |                 |
| &emsp;&emsp;name         |        |      | false | string          |                 |
| &emsp;&emsp;notification |        |      | false | string          |                 |
| &emsp;&emsp;phone        |        |      | false | string          |                 |
| &emsp;&emsp;rDate        |        |      | false | string          |                 |
| &emsp;&emsp;rdate        |        |      | false | string          |                 |
| &emsp;&emsp;uid          |        |      | false | string          |                 |
| &emsp;&emsp;username     |        |      | false | string          |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

# SpringBootApplication: 启动类

## healthCheck

**接口地址**:`/`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema |
|-----|--------------|--------|
| 200 | OK           |        |
| 401 | Unauthorized |        |
| 403 | Forbidden    |        |
| 404 | Not Found    |        |

**响应参数**:

暂无

**响应示例**:

```javascript

```

# UserController: 非管理员用户相关接口

## chargeUser

**接口地址**:`/user/charge`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "acredit"
:
    0,
        "age"
:
    0,
        "cTime"
:
    "",
        "charge"
:
    0,
        "city"
:
    "",
        "ctime"
:
    "",
        "email"
:
    "",
        "fname"
:
    "",
        "gender"
:
    "",
        "lname"
:
    "",
        "minit"
:
    "",
        "phone"
:
    "",
        "province"
:
    "",
        "status"
:
    true,
        "street"
:
    "",
        "uTime"
:
    "",
        "uid"
:
    "",
        "username"
:
    "",
        "utime"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明 | 请求类型 | 是否必须  | 数据类型              | schema          |
|----------------------|------|------|-------|-------------------|-----------------|
| user                 | user | body | true  | User: 非管理员用户实体类   | User: 非管理员用户实体类 |
| &emsp;&emsp;acredit  |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;age      |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;cTime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;charge   |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;city     |      |      | false | string            |                 |
| &emsp;&emsp;ctime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;email    |      |      | false | string            |                 |
| &emsp;&emsp;fname    |      |      | false | string            |                 |
| &emsp;&emsp;gender   |      |      | false | string            |                 |
| &emsp;&emsp;lname    |      |      | false | string            |                 |
| &emsp;&emsp;minit    |      |      | false | string            |                 |
| &emsp;&emsp;phone    |      |      | false | string            |                 |
| &emsp;&emsp;province |      |      | false | string            |                 |
| &emsp;&emsp;status   |      |      | false | boolean           |                 |
| &emsp;&emsp;street   |      |      | false | string            |                 |
| &emsp;&emsp;uTime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;uid      |      |      | false | string            |                 |
| &emsp;&emsp;username |      |      | false | string            |                 |
| &emsp;&emsp;utime    |      |      | false | string(date-time) |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## deleteByEmail

**接口地址**:`/user/delete/{email}`

**请求方式**:`DELETE`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型   | schema |
|-------|-------|------|------|--------|--------|
| email | email | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 204 | No Content   |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## list

**接口地址**:`/user/list`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

暂无

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## page

**接口地址**:`/user/page`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称     | 参数说明 | 请求类型  | 是否必须  | 数据类型           | schema |
|----------|------|-------|-------|----------------|--------|
| email    |      | query | false | string         |        |
| pageNum  |      | query | false | integer(int32) |        |
| pageSize |      | query | false | integer(int32) |        |
| uid      |      | query | false | string         |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## save

**接口地址**:`/user/save`

**请求方式**:`POST`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "acredit"
:
    0,
        "age"
:
    0,
        "cTime"
:
    "",
        "charge"
:
    0,
        "city"
:
    "",
        "ctime"
:
    "",
        "email"
:
    "",
        "fname"
:
    "",
        "gender"
:
    "",
        "lname"
:
    "",
        "minit"
:
    "",
        "phone"
:
    "",
        "province"
:
    "",
        "status"
:
    true,
        "street"
:
    "",
        "uTime"
:
    "",
        "uid"
:
    "",
        "username"
:
    "",
        "utime"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明 | 请求类型 | 是否必须  | 数据类型              | schema          |
|----------------------|------|------|-------|-------------------|-----------------|
| user                 | user | body | true  | User: 非管理员用户实体类   | User: 非管理员用户实体类 |
| &emsp;&emsp;acredit  |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;age      |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;cTime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;charge   |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;city     |      |      | false | string            |                 |
| &emsp;&emsp;ctime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;email    |      |      | false | string            |                 |
| &emsp;&emsp;fname    |      |      | false | string            |                 |
| &emsp;&emsp;gender   |      |      | false | string            |                 |
| &emsp;&emsp;lname    |      |      | false | string            |                 |
| &emsp;&emsp;minit    |      |      | false | string            |                 |
| &emsp;&emsp;phone    |      |      | false | string            |                 |
| &emsp;&emsp;province |      |      | false | string            |                 |
| &emsp;&emsp;status   |      |      | false | boolean           |                 |
| &emsp;&emsp;street   |      |      | false | string            |                 |
| &emsp;&emsp;uTime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;uid      |      |      | false | string            |                 |
| &emsp;&emsp;username |      |      | false | string            |                 |
| &emsp;&emsp;utime    |      |      | false | string(date-time) |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## updateByEmail

**接口地址**:`/user/update`

**请求方式**:`PUT`

**请求数据类型**:`application/json`

**响应数据类型**:`*/*`

**接口描述**:

**请求示例**:

```javascript
{
    "acredit"
:
    0,
        "age"
:
    0,
        "cTime"
:
    "",
        "charge"
:
    0,
        "city"
:
    "",
        "ctime"
:
    "",
        "email"
:
    "",
        "fname"
:
    "",
        "gender"
:
    "",
        "lname"
:
    "",
        "minit"
:
    "",
        "phone"
:
    "",
        "province"
:
    "",
        "status"
:
    true,
        "street"
:
    "",
        "uTime"
:
    "",
        "uid"
:
    "",
        "username"
:
    "",
        "utime"
:
    ""
}
```

**请求参数**:

| 参数名称                 | 参数说明 | 请求类型 | 是否必须  | 数据类型              | schema          |
|----------------------|------|------|-------|-------------------|-----------------|
| user                 | user | body | true  | User: 非管理员用户实体类   | User: 非管理员用户实体类 |
| &emsp;&emsp;acredit  |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;age      |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;cTime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;charge   |      |      | false | integer(int32)    |                 |
| &emsp;&emsp;city     |      |      | false | string            |                 |
| &emsp;&emsp;ctime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;email    |      |      | false | string            |                 |
| &emsp;&emsp;fname    |      |      | false | string            |                 |
| &emsp;&emsp;gender   |      |      | false | string            |                 |
| &emsp;&emsp;lname    |      |      | false | string            |                 |
| &emsp;&emsp;minit    |      |      | false | string            |                 |
| &emsp;&emsp;phone    |      |      | false | string            |                 |
| &emsp;&emsp;province |      |      | false | string            |                 |
| &emsp;&emsp;status   |      |      | false | boolean           |                 |
| &emsp;&emsp;street   |      |      | false | string            |                 |
| &emsp;&emsp;uTime    |      |      | false | string(date-time) |                 |
| &emsp;&emsp;uid      |      |      | false | string            |                 |
| &emsp;&emsp;username |      |      | false | string            |                 |
| &emsp;&emsp;utime    |      |      | false | string(date-time) |                 |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 201 | Created      |                |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```

## getByEmail

**接口地址**:`/user/{email}`

**请求方式**:`GET`

**请求数据类型**:`application/x-www-form-urlencoded`

**响应数据类型**:`*/*`

**接口描述**:

**请求参数**:

| 参数名称  | 参数说明  | 请求类型 | 是否必须 | 数据类型   | schema |
|-------|-------|------|------|--------|--------|
| email | email | path | true | string |        |

**响应状态**:

| 状态码 | 说明           | schema         |
|-----|--------------|----------------|
| 200 | OK           | Result:响应结果封装类 |
| 401 | Unauthorized |                |
| 403 | Forbidden    |                |
| 404 | Not Found    |                |

**响应参数**:

| 参数名称 | 参数说明 | 类型     | schema |
|------|------|--------|--------|
| code | 状态码  | string |        |
| data | 数据体  | object |        |
| msg  | 提示信息 | string |        |

**响应示例**:

```javascript
{
    "code"
:
    200,
        "data"
:
    {
    }
,
    "msg"
:
    "System failure"
}
```
