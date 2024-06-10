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
<!--<style>-->
<!--.form-wrapper::before {-->
<!--  background: rgba(128, 150, 161, 0.87);-->
<!--  box-shadow: 3px 3px #242424;-->
<!--  border-radius: 10px;-->
<!--  width:88%;-->
<!--  height:80%;-->
<!--  content: "";-->
<!--  position: absolute;-->
<!--  filter: opacity(0.6);-->
<!--  -webkit-filter: opacity(0.6);-->
<!--  left: 11%;-->
<!--  top: 8%;-->
<!--}-->
<!--</style>-->
<template>
  <div style="padding: 10px;">
    <div
        style="width:99%;margin-left: 3px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Books 图书</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Add New Book 新增图书 </strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div
        style="font-size: 50px;font-family: 'roboto mono', monospace; margin-left: 50px;margin-bottom: 50px;margin-top: 50px">
      Add New
      Book 新增图书
    </div>

    <div style="width: 30%;transform: scale(2,2);margin-left: 500px;margin-top: 300px">
      <!-- form area -->
      <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm">
        <el-form-item label="ISBN 国际标准书号: " prop="isbn" style="margin-left: 2px">
          <el-input v-model="form.isbn" placeholder="Enter isbn"></el-input>
        </el-form-item>
        <el-form-item label="Description 描述: " prop="description" style="margin-left: 2px;">
          <el-input style="width: 500px" type="textarea" v-model="form.description" placeholder="Enter description"></el-input>
        </el-form-item>
        <el-form-item label="Name 书名: " prop="name" style="margin-left: 2px">
          <el-input v-model="form.name" placeholder="Enter name"></el-input>
        </el-form-item>
        <el-form-item label="Category 类型: " style="margin-left: 2px">
          <el-cascader
              :props="{value: 'name', label: 'name'}"
              v-model="form.categories"
              :options="categories"></el-cascader>
        </el-form-item>
        <el-form-item label="Author 著者: " prop="author" style="margin-left: 2px">
          <el-input v-model="form.author" placeholder="Enter last name"></el-input>
        </el-form-item>
        <el-form-item label="Publisher 出版商: " prop="publisher" style="margin-left: 2px">
          <el-input v-model="form.publisher" placeholder="Enter publisher name"></el-input>
        </el-form-item>
        <el-form-item label="Publish Date 出版日期: " prop="publish_date" style="margin-left: 2px">
          <el-date-picker
              v-model="form.publish_date"
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="Select a date">
          </el-date-picker>
        </el-form-item>
        <el-form-item id="credit" label="Score 积分点: " prop="credit" style="margin-left: 2px;">
          <el-input v-model="form.credit" placeholder="Enter score value"></el-input>
        </el-form-item>
        <el-form-item id="cover" label="Cover url 封面链接: " prop="cover" style="margin-left: 2px;">
          <el-input v-model="form.cover" placeholder="Enter cover url"></el-input>
        </el-form-item>
        <el-form-item id="number" label="Number 存量: " prop="number" style="margin-left: 2px;">
          <el-input v-model="form.number" placeholder="Enter number"></el-input>
        </el-form-item>
      </el-form>
      <!-- button area -->
      <div style="text-align: center">
        <el-button type="primary" style="margin-left: 2px; height: 40px; min-width: 100px" @click="save">Submit</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Add",
  data() {
    const checkNumeric = (rule, value, callback) => {
      if(!value) {
        callback(new Error('This blank cannot be empty'));
      }
      if(!/^[0-9]*$/.test(value)) {
        callback(new Error('Please enter a numerical value'))
      }
      if(parseInt(value) < 0) {
        callback(new Error('Please enter a number larger than 0'))
      }
      callback()
    }

    const checkISBN = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the book\'s ISBN'))
      }
      if (!/^[0-9]{10}$/.test(value)) {
        callback(new Error('Illegal ISBN'));
      }
      callback()
    }

    return {
      form: {},
      categories: [],
      rules: {
        // cannot be empty
        name: [{ required: true, message: "Please enter the book's name", trigger: 'blur' }],
        category: [{ required: true, message: "Please select the book's category", trigger: 'blur' }],
        author: [{ required: true, message: "Please enter the book's author", trigger: 'blur' }],
        publisher: [{ required: true, message: "Please enter the book's publisher", trigger: 'blur' }],
        publish_date: [{ required: true, message: "Please select a date", trigger: 'blur' }],
        //more restrictions
        isbn: [{ required: true,  validator: checkISBN, trigger: 'blur' }],
        number: [{ required: true,  validator: checkNumeric, trigger: 'blur' }],
        credit: [{ required: true,  validator: checkNumeric, trigger: 'blur' }],
      }
    }
  },

  created() {
    request.get('category/tree').then(res => {
      this.categories = res.data
    })
  },

  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          request.post('book/save', this.form).then(res => {
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
