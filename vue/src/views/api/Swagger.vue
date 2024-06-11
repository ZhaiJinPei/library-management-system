<!--
  ~ Licensed to the Apache Software Foundation (ASF) under one or more
  ~ contributor license agreements.  See the NOTICE file distributed with
  ~ this work for additional information regarding copyright ownership.
  ~ The ASF licenses this file to You under the Apache License, Version 2.0
  ~ (the "License"); you may not use this file except in compliance with
  ~ the License.  You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  ~
  ~ This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
  ~ Copyright (c) 2024-present, Zhai JinPei
  -->
<script>

export default {
  name: "Swagger",
}
</script>

<template>
  <div style="height: 100vh;padding: 10px;margin-top: 82px;">
    <div class="breadcrumb">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Swagger 接口 API</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Knife4j 接口文档</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <iframe src="http://10.20.245.160:9090/doc.html"
            style="width: 95vw; height: 96vh;margin-top: 0.5vh;border-radius: 10px"></iframe>
  </div>
</template>


