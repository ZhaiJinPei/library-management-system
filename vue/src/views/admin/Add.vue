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
  <div style="padding: 10px;">
    <div
        style="width:99%;margin-left: 10px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>New Admin 新增管理员</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Admin List 管理员详情</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div
        style="font-size: 50px; font-family: 'roboto mono', monospace;margin-left: 50px;margin-top: 50px; margin-bottom: 50px">
      Add New Admin 新增管理员
    </div>

    <div style="width: 50%;transform: scale(2,2);">
      <el-form ref="ruleForm" :inline="true" :model="form" :rules="rules" size="30px"
               style="margin-left: 350px;margin-top: 300px">
        <el-form-item label="First Name 本名: " prop="fname" style="margin-left: 2px">
          <el-input v-model="form.fname" placeholder="Enter first name"></el-input>
        </el-form-item>
        <el-form-item label="Middle 教名: " prop="minit" style="margin-left: 2px">
          <el-input v-model="form.minit" placeholder="Enter middle"></el-input>
        </el-form-item>
        <el-form-item label="Last Name 姓氏: " prop="lname" style="margin-left: 2px">
          <el-input v-model="form.lname" placeholder="Enter last name"></el-input>
        </el-form-item>
        <el-form-item label="Email 邮箱账号: " prop="email" style="margin-left: 2px">
          <el-input v-model="form.email" placeholder="Enter email"></el-input>
        </el-form-item>
        <el-form-item label="Phone 电话号: " prop="phone" style="margin-left: 2px">
          <el-input v-model="form.phone" placeholder="Enter phone number"></el-input>
        </el-form-item>
        <el-form-item label="Username 用户名: " prop="username" style="margin-left: 2px">
          <el-input v-model="form.username" placeholder="Enter username"></el-input>
        </el-form-item>
        <el-form-item label="Province/State 省份/州名: " prop="province" style="margin-left: 2px">
          <el-input v-model="form.province" placeholder="Enter province/state"></el-input>
        </el-form-item>
        <el-form-item label="City 城市名: " prop="city" style="margin-left: 2px">
          <el-input v-model="form.city" placeholder="Enter city"></el-input>
        </el-form-item>
        <el-form-item label="Street/Road 街道名/路名: " prop="street" style="margin-left: 2px">
          <el-input v-model="form.street" placeholder="Enter street"></el-input>
        </el-form-item>
      </el-form>

      <div style="text-align: center">
        <el-button style="margin-left: 200px;margin-top: 50px; height: 40px; min-width: 100px" type="primary"
                   @click="save">Submit
        </el-button>
      </div>
    </div>
  </div>

</template>

<script>
import request from "@/utils/request";

export default {
  name: "Add",
  data() {
    const checkEmail = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the email address'))
      }
      if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(value)) {
        callback(new Error('Illegal email address'))
      }
      callback()
    };

    const checkPhone = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the phone number'))
      }
      if (!/^[1,2,3,4,5,6,7,8,9][0-9]{9,10}$/.test(value)) {
        callback(new Error('Illegal phone number'));
      }
      callback()
    }

    return {
      form: {},

      rules: {
        minit: [{ required: false}],
        // cannot be empty
        fname: [{ required: true, message: 'Please enter the first name', trigger: 'blur' }],
        lname: [{ required: true, message: 'Please enter the last name', trigger: 'blur' }],
        username: [{ required: true, message: 'Please enter the username', trigger: 'blur' }],
        province: [{ required: true, message: 'Please enter the province/state', trigger: 'blur' }],
        city: [{ required: true, message: 'Please enter the city', trigger: 'blur' }],
        street: [{ required: true, message: 'Please enter the street address', trigger: 'blur' }],
        // more restrictions
        email:[{ required: true, validator: checkEmail, trigger: 'blur' }],
        phone:[{ required: true, validator: checkPhone, trigger: 'blur' }]
      }
    }
  },

  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          request.post('admin/save', this.form).then(res => {
            if(res.code === '200') {
              this.$notify.success('Submitted')
              this.$refs['ruleForm'].resetFields()
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    },

  }
}
</script>

<style scoped>

</style>
