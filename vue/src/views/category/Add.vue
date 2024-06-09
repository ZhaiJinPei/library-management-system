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
        style="padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Categories 图书类型</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>New Parent Category 新增类型</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div>
      <div style="font-size: 40px; font-family: 'roboto mono', monospace; margin-bottom: 10px;margin-top: 10px">Add
        Parent Category 新增类型
      </div>
    </div>

    <div style="width: 60%; margin-top: 2px">
      <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm">
        <el-form-item label="Category Name: " style="margin-left: 2px" prop="name">
          <el-input v-model="form.name" placeholder="Enter name"></el-input>
        </el-form-item>
        <el-form-item label="Remark 标识: " prop="remark" style="margin-left: 2px">
          <el-input v-model="form.remark" placeholder="Enter remark"></el-input>
        </el-form-item>
      </el-form>

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
    return {
      form: {},
      rules: {
        name: [{ required: true, message: "Category name must not be empty", trigger: 'blur' }],
        remark: [{ required: true, message: "Remark must not be empty", trigger: 'blur' }],
      }
    }
  },

  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          request.post('category/save', this.form).then(res => {
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
