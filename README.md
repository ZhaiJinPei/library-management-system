Copyright 2024-present Zhai JinPei

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# 图书管理系统 Library Management System

![Static Badge](https://img.shields.io/badge/vue-v2.6.14_&_v3.3.4-green)
![Static Badge](https://img.shields.io/badge/vue_router-v3.5.1-green)
![Static Badge](https://img.shields.io/badge/npm-v10.2.3-purple)
![Static Badge](https://img.shields.io/badge/openapi-swagger_2_&_knife4j-purple)
![Static Badge](https://img.shields.io/badge/redis-v5.0.10-yellow)
![Static Badge](https://img.shields.io/badge/spring_boot-v2.7.7_&_v3.0.2-green)
![Static Badge](https://img.shields.io/badge/mysql-v8.0_+-blue)
![Static Badge](https://img.shields.io/badge/license-apache_2.0-%2356c606)
![Static Badge](https://img.shields.io/badge/maven-v3.9.4-red)
![Static Badge](https://img.shields.io/badge/minio-vRELEASE.2024_06_04T19_20_08Z(go1.22.3_windows/amd64)-gold)
![Static Badge](https://img.shields.io/badge/zipkin-v3.4.0-red)
![Static Badge](https://img.shields.io/badge/element_ui-v2.15.12-green)
![Static Badge](https://img.shields.io/badge/badge-https://shields.io/badges-%235387c6)
![Static Badge](https://img.shields.io/badge/author-Zhai_JinPei-%2300a2c6)

## 简介

这是一个集成了多服务的Spring Boot + Vue 微服务项目。

## 安装

要运行此项目，你需要保证本地已安装了如下环境:

- Node.js 20 +
- Jdk 17 +
- Maven 3.9 +
- Docker Desktop latest
- Zipkin 3.4
- MySQL 8.0+
- Redis 5.0.10
- Skywalking-ui
- Skywalking-oap-server
- Skywalking-client-java

安装

1. 将项目直接克隆到IDEA, 或

```shell
git clone git@github.com:ZhaiJinPei/library-management-system.git
``` 

到本地用IDEA打开

2. 开启Docker服务，运行skywalking-ui和skywalking-oap容器
3. 进入zipkin-jar文件夹,以管理员运行CMD

```shell
java -jar  zipkin-server-3.4.0-exec.jar
```

启动zipkin

4. 进入minio文件夹,以管理员运行

```shell
.\minio.exe server D:\Net_Program\Net_MinIO\Data
```

启动minio

5. 启动Minio项目服务,参考链接：

> https://github.com/ZhaiJinPei/minio

6. 链接MySQL,进入项目sql文件夹,运行最新的转储文件创建成功库
7. 在SpringbootApplication运行配置中添加VM_OPTIONS选项,

> `-javaagent:F:\skywalking-agent\skywalking-agent.jar=agent.service_name=skywalking-demo,collector.backend_service=127.0.0.1:11800 `

8. 启动Spring Boot项目
9. 进入vue根目录

```shell
cd ./vue
```

10. 运行

```shell
npm i
```

11. 等待依赖加载完后,运行,或直接进入dist目录

```shell
npm run serve
```

启动vue项目

## 界面概览

### 主页

<img src="images/views/homen.png" alt="home view">

<img src="images/views/HomeView.png" alt="home view">

<img src="images/darkth.png" alt="home view">

### 列表展示

<img src="images/views/bookList.png" alt="book list">

<img src="images/views/categoryList.png" alt="book list">

### Swagger2 knife4j API 文档

<img src="images/views/apidocs.png" alt="api doc">

<img src="images/apitest.png" alt="api doc">

### Zipkin 链路追踪

<img src="images/zipkin.png" alt="zipkin">

<img src="images/zipkin2.png" alt="zipkin">

<img src="images/views/zipkintrace.png" alt="zipkin">

### Apache Skywalking

<img src="images/views/skywalkingtrace.png" alt="skywalking trace">

<img src="images/apdex.png" alt="skywalking trace">

<img src="images/strace.png" alt="skywalking trace">

<img src="images/mysqltrace.png" alt="skywalking trace">

<img src="images/table.png" alt="skywalking trace">

<img src="images/topo.png" alt="skywalking trace">

<img src="images/trace3.png" alt="skywalking trace">

<img src="images/tree.png" alt="skywalking trace">

<img src="images/jvm.png" alt="skywalking trace">

### Minio 对象存储

<img src="images/views/files.png" alt="minio">

<img src="images/views/minio buckets.png" alt="minio">

## 功能点

- [ ] 图书管理
- [ ] 借还购书管理
- [ ] 页脚许可、链接、联系方式
- [ ] 用户管理
- [ ] 管理员登录登出
- [ ] 修改密码
- [ ] 主页报表
- [ ] Swagger API 文档
- [ ] Zipkin 链路追踪
- [ ] SkyWalking 应用程序性能监视
- [ ] 文件上传 Minio OSS
- [ ] 封面大图查看
- [ ] 主题简单一键切换
- [ ] 一键全屏显示模式切换
- [ ] 图书类型管理
- [ ] 可伸缩侧边栏

## Sponsors

LMS is an Apache-licensed open source project.

## License

[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)

This project is licensed under the Apache-2.0 license - see the LICENSE file for details.

Copyright (c) 2024-present, Zhai JinPei 
