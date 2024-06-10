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
  name: "Personal",
  data() {
    return {
      urls: 'https://cn.bing.com/search?q=-' + this.$route.params.id
    }
  },

  methods: {}
}
</script>
<template>
  <div style="margin:0;padding:10px;:100%; height: 97%">
    <div
        style="width:99%;margin-left: 3px;margin-bottom:5px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Github 项目主页</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!--      <div style="-->
    <!--        background: #fff9f9;-->
    <!--        margin-left: 3px;-->
    <!--        margin-right: 5px;-->
    <!--        width: 30%;-->
    <!--        margin-top: 14px;-->
    <!--        padding: 5px;-->
    <!--        border-radius: 8px;-->
    <!--        font-family: 'roboto mono', monospace;-->
    <!--        font-size: 20px;-->
    <!--      ">-->
    <!--      <span>vue</span><br>-->
    <!--        <span>&emsp;&emsp;src</span><br>-->
    <!--      </div>-->
    <!--      <div style="-->
    <!--      padding: 15px;-->
    <!--      width: 800px;height:70%;position:fixed;right:20px;top:130px;border-radius:10px;background: #eeeeee;font-family: 'roboto mono', monospace;font-size: 20px;overflow: scroll">-->
    <!--        <file-viewer :url="url" />-->
    <!--      </div>-->
    <iframe :src="urls" style="width: 99%; height: 100%;overflow: scroll"></iframe>
  </div>
</template>

