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
<template>
  <!--  <div class="box" style="height: 100vh; overflow: hidden">-->
  <div ref="vantaRef" class="box" style=" height: 100vh ;">
    <div class="banner" rel="vantaRel" style="width: 600px; height: 500px;  border-radius: 10px; padding: 50px;">
      <!-- header -->
      <div
          style="margin-top: 50px; text-align: center; font-size: 80px;  font-family: '华文楷体',cursive; color: #fff9f9">
        图书管理系统<br>
        <div style="margin-top:5px ;font-size: 28px;font-family: 'roboto mono', monospace">Library Management System
        </div>
      </div>
      <!-- form -->
      <div style="margin-top: 50px">
        <el-form :model="admin" :rules="rules" ref="loginForm">
          <el-form-item prop="email">
            <el-input placeholder="Enter email" prefix-icon="el-icon-user" v-model="admin.email"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input v-model="admin.password" placeholder="Enter password 管理员默认密码 000000" prefix-icon="el-icon-lock"
                      show-password></el-input>
          </el-form-item>
        </el-form>
      </div>
      <!-- button -->
      <div>
        <el-button style="width: 100%;font-size: 25px;font-family: 'Microsoft YaHei UI Light',sans-serif" type="primary"
                   @click="login">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录
        </el-button>
      </div>
    </div>
  </div>
  <!--  </div>-->
</template>

<script>


import request from "@/utils/request";
import Cookies from "js-cookie"
import net from "vanta/src/vanta.net";
import * as THREE from "three";

export default {
  name: "login",

  data() {
    return {
      admin: {},
      rules: {
        email: [{required: true, message: 'Please enter the email address', trigger: 'blur'}],
        password: [{required: true, message: 'Please enter the password', trigger: 'blur'}]
      },
    }
  },

  methods: {
    login() {
      this.$refs['loginForm'].validate((valid) => {
        if(valid) {
          request.post('admin/login', this.admin).then(res => {
            if(res.code === '200') {
              this.$notify.success("sign in successful")
              if(res.data !== null) {
                Cookies.set('admin', JSON.stringify(res.data))
              }
              this.$router.push('/')
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    }
  },
  mounted() {
    this.vantaEffect = net({
      el: this.$refs.vantaRef,
      THREE: THREE,
      mouseControls: true,
      touchControls: true,
      gyroControls: false,
      minHeight: 200.0,
      minWidth: 200.0,
      scale: 1.0,
      scaleMobile: 1.00,
      color: 0xa40a4,
      backgroundColor: 0xf0f1e,
      points: 11.00,
      maxDistance: 25.00
    });
  },
  beforeDestroy() {
    if (this.vantaEffect) {
      this.vantaEffect.destroy();
    }
  }
}
</script>

<style lang="less" scoped>
.box {
  position: relative;
  opacity: 1;
}

.banner {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -350px;
  margin-left: -350px;
  opacity: 1;
}

h1 {
  font-size: 66px;
}

p {
  margin-top: 60px;
  font-size: 18px;
}
</style>
