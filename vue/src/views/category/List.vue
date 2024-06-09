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
  <div style="padding: 10px">
    <div
        style="width:99%;margin-left: 3px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Categories 图书类型</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Category List 类型详情</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- search area -->
    <div style="margin-bottom: 2px; margin-top: 2px">
      <el-input v-model="params.name" placeholder="Enter category" style="width: 200px; margin-left: 2px"></el-input>
      <el-button type="primary" style="margin-left: 2px; height: 40px" icon="el-icon-search" @click="load">Search</el-button>
      <el-button type="warning" style="margin-left: 2px; height: 40px" icon="el-icon-refresh-right" @click="reset">Reset</el-button>
    </div>
    <!-- table area -->
    <el-table :data="tableData" :tree-props="{children: 'children', hasChildren: 'hasChildren'}" row-key="id"
              stripe style="margin-left: 3px;width: 99%">
      <el-table-column prop="id" label="ID" width="100"></el-table-column>
      <el-table-column prop="name" label="Category Name" width="150"></el-table-column>
      <el-table-column prop="remark" label="Remark"></el-table-column>
      <el-table-column prop="cDate" label="Create Date"></el-table-column>
      <el-table-column prop="uDate" label="Update Date"></el-table-column>
      <el-table-column label="Operation">
        <template v-slot="scope">
          <el-button type="success" v-if="!scope.row.pid" @click="addChild(scope.row)">
            New Child Category
          </el-button>
          <el-button type="primary" style="margin-left: 2px;" @click="$router.push('/editCategory?name=' + scope.row.name)">
            Edit
          </el-button>
          <!-- delete -->
          <el-popconfirm
              confirm-button-text='Yes'
              cancel-button-text='No'
              title="Are you sure you want to delete this row of data？"
              @confirm="del(scope.row.name)"
          >
            <el-button style="margin-left: 2px;" slot="reference" type="danger">Delete</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <!-- add child category -->
    <el-dialog style="text-align: center" :visible.sync="dialogFormVisible">
      <div style="font-size: 30px; font-family: Arial; font-weight: bold">New Child Category</div>
      <el-form :model="form" :rules="rules" ref="ruleForm" style="margin-top: 5px; width: 80vh;">
        <el-form-item label="Category Name: " :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="Remark: " :label-width="formLabelWidth" prop="remark">
          <el-input v-model="form.remark" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <!-- buttons -->
      <div slot="footer" class="dialog-footer" style="text-align: center; margin-top: -40px">
        <el-button type="primary" @click="save">Confirm</el-button>
        <el-button type="warning" @click="cancel">Cancel</el-button>
      </div>
    </el-dialog>
    <!-- page -->
    <el-pagination
        style="margin-top: 5px;"
        background
        :current-page="params.pageNum"
        :page-size="params.pageSize"
        @current-change="changePageNum"
        layout="prev, pager, next"
        :total="total">
    </el-pagination>
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "List",

  data() {
    return {
      total: 0,
      dialogFormVisible: false,
      form: {},
      pid: null,
      rules: {
        name: [{ required: true, message: "Category name must not be empty", trigger: 'blur' }],
        remark: [{ required: true, message: "Remark must not be empty", trigger: 'blur' }],
      },
      formLabelWidth: '200px',
      tableData: [],
      params: {
        pageNum: 1,
        pageSize: 10,
        name: ''
      },
    }
  },

  created() {
    this.load()
  },

  methods: {
    del(email) {
      request.delete('category/delete/' + email).then(res => {
        if(res.code === '200') {
          this.$notify.success('Deleted')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },

    load() {
      request.get("category/page", {
        params: this.params
      }).then(res => {
        if(res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },

    addChild(row) {
      this.pid = row.id
      this.dialogFormVisible = true
    },

    reset() {
      this.params = {
        pageNum: 1,
        pageSize: 10,
        name: ''
      }
      this.load()
    },

    changePageNum(pageNum) {
      this.params.pageNum = pageNum
      this.load()
    },

    cancel() {
      this.dialogFormVisible = false
      this.$refs['ruleForm'].resetFields()
    },

    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          this.form.pid = this.pid
          request.post('category/save', this.form).then(res => {
            if(res.code === '200') {
              this.$notify.success('Submitted')
              this.$refs['ruleForm'].resetFields()
              this.dialogFormVisible = false
              location.reload()
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
