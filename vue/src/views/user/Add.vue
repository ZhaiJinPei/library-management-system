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
<style>

</style>
<template>
  <div style="height: 100vh;padding: 10px;margin-top: 6vh;">
    <div class="breadcrumb">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>User 用户</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>New User 新增用户</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="form-wrapper"/>
    <div
        style="
        transform: scale(1,1);
        font-size: 50px; color: #000000;font-family: 'roboto mono', monospace; margin-top: 90px; margin-left: 50px;margin-bottom: 10px">
      Add New
      User 新增用户
    </div>
    <div style=" width: 40vw; margin-left:600px;margin-top:300px;transform: scale(2,2)">
      <!-- form area -->
      <el-form ref="ruleForm" :inline="true" :model="form" :rules="rules" size="30px">
        <el-form-item label="First Name 本名: " prop="fname" style="margin-left: 2px">
          <el-input v-model="form.fname" placeholder="Enter first name"></el-input>
        </el-form-item>
        <el-form-item label="Middle(Western) 教名: " prop="minit" style="margin-left: 2px">
          <el-input v-model="form.minit" placeholder="Enter middle"></el-input>
        </el-form-item>
        <el-form-item label="Last Name 姓氏: " prop="lname" style="margin-left: 2px">
          <el-input v-model="form.lname" placeholder="Enter last name"></el-input>
        </el-form-item>
        <el-form-item label="Email 邮箱账号: " prop="email" style="margin-left: 2px">
          <el-input v-model="form.email" placeholder="Enter email"></el-input>
        </el-form-item>
        <el-form-item label="User ID 自动生成: " style="margin-left: 2px">
          <el-input v-model="form.uid" placeholder="--Generate after submission--" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="Username 用户名: " prop="username" style="margin-left: 2px">
          <el-input v-model="form.username" placeholder="Enter username"></el-input>
        </el-form-item>
        <el-form-item label="Phone 电话号: " prop="phone" style="margin-left: 2px">
          <el-input v-model="form.phone" placeholder="Enter phone number"></el-input>
        </el-form-item>
        <el-form-item label="Age 年龄: " prop="age" style="margin-left: 2px">
          <el-input v-model="form.age" placeholder="Enter age"></el-input>
        </el-form-item>
        <el-form-item label="Gender 性别: " prop="gender" style="margin-left: 2px">
          <el-select v-model="form.gender" placeholder="Please select a gender">
            <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="Province/State 省份/州名: " prop="province" style="margin-left: 2px">
          <el-input v-model="form.province" placeholder="Enter province or state"></el-input>
        </el-form-item>
        <el-form-item label="City 城市名: " prop="city" style="margin-left: 2px">
          <el-input v-model="form.city" placeholder="Enter city"></el-input>
        </el-form-item>
        <el-form-item label="Street/Road 街道名/路名: " prop="street" style="margin-left: 2px">
          <el-input v-model="form.street" placeholder="Enter street or road"></el-input>
        </el-form-item>
      </el-form>
      <!-- button area -->
      <div style="text-align: center">
        <el-button style="margin-left: 2px; height: 40px; min-width: 100px" type="primary" @click="save">Submit
        </el-button>
      </div>
    </div>
  </div>

  <!--  </div>-->
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Add",
  data() {
    const checkAge = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the age'));
      }
      if(!/^[0-9]*$/.test(value)) {
        callback(new Error('Please enter a numerical value'))
      }
      if(parseInt(value) > 130 || parseInt(value) <= 0) {
        callback(new Error('Please enter a reasonable value'))
      }
      callback()
    };

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
      form: {
        gender: 'Unknown',
      },

      options: [{
        value: 'Male',
        label: 'Male 男'
      }, {
        value: 'Female',
        label: 'Female 女'
      }, {
        value: 'Other',
        label: 'Other 其他'
      }, {
        value: 'Unknown',
        label: 'Prefer not disclose 未知'
      }],

      // rules to check the input values
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
        age:[{ required: true, validator: checkAge, trigger: 'blur' }],
        email:[{ required: true, validator: checkEmail, trigger: 'blur' }],
        phone:[{ required: true, validator: checkPhone, trigger: 'blur' }]
      }
    }
  },

  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          request.post('user/save', this.form).then(res => {
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
