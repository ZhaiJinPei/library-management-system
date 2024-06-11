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
  <div style="height: 100vh;padding: 10px;margin-top: 82px;">
    <div class="breadcrumb">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Administrators 管理员</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Admin List 管理员详情</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- search area -->
    <div style="margin-bottom: 5px; margin-top: 5px">
      <el-input v-model="params.email" placeholder="Enter admin email" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.username" placeholder="Enter username" style="width: 200px; margin-left: 2px"></el-input>
      <el-button type="primary" style="margin-left: 2px; height: 40px" icon="el-icon-search" @click="load">Search</el-button>
      <el-button icon="el-icon-refresh-right" style="margin-left: 3px; height: 40px" type="warning" @click="reset">
        Reset
      </el-button>
    </div>
    <!-- table area -->
    <el-table :data="tableData" border="true" stripe
              style="margin-left:3px;width: 95vw;font-size: 24px;font-family: 'roboto mono', monospace">
      <!-- status switch -->
      <el-table-column label="Status" width="100">
        <template v-slot="scope2">
          <el-switch
              width="50"
              v-model="scope2.row.status"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="changeStatus(scope2.row)">
          </el-switch>
        </template>
      </el-table-column>
      <!-- main data -->
      <el-table-column prop="username" label="Username" width="130"></el-table-column>
      <el-table-column label="First Name" prop="fname" width="160"></el-table-column>
      <el-table-column label="Last Name" prop="lname" width="150"></el-table-column>
      <el-table-column label="Email" prop="email" width="300"></el-table-column>
      <el-table-column label="Province/State" prop="province" width="210"></el-table-column>
      <el-table-column label="City" prop="city" width="250"></el-table-column>
      <el-table-column label="Street" prop="street" width="250"></el-table-column>
      <el-table-column label="Phone" prop="phone" with="180"></el-table-column>
      <!-- operations -->
      <el-table-column label="Operations">
        <template v-slot="scope">
          <el-button type="primary" @click="$router.push('/editAdmin?email=' + scope.row.email)">Edit</el-button>
          <!-- delete -->
          <el-popconfirm
              confirm-button-text='Yes'
              cancel-button-text='No'
              title="Are you sure you want to delete this row of data？"
              @confirm="del(scope.row.email)"
          >
            <el-button slot="reference" style="margin-left: 5px;" type="danger">Delete</el-button>
          </el-popconfirm>
          <!-- reset password -->
          <el-popconfirm
              confirm-button-text='Yes'
              cancel-button-text='No'
              title="Are you sure you want to reset this admin's password？"
              @confirm="resetPass(scope.row)"
          >
            <el-button slot="reference" style="margin-left: 5px;" type="warning">Reset</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
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
import Cookies from "js-cookie";

export default {
  name: "List",

  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')): {},
      tableData: [],
      total: 0,
      form: {},
      params: {
        pageNum: 1,
        pageSize: 15,
        email: '',
        username: '',
      },
    }
  },

  created() {
    this.load()
  },

  methods: {
    load() {
      request.get('admin/page', {
        params: this.params
      }).then(res => {
        if(res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },

    reset() {
      this.params = {
        pageNum: 1,
        pageSize: 10,
        email: '',
        username: '',
      }
      this.load()
    },

    del(email) {
      request.delete('admin/delete/' + email).then(res => {
        if(res.code === '200') {
          this.$notify.success('Deleted')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },

    resetPass(row) {
      this.form = JSON.parse(JSON.stringify(row))
      // console.log(this.form)
      request.put('admin/resetPass', this.form).then(res => {
        if(res.code === '200') {
          this.$notify.success('Password reset')
          if(this.form.email === this.admin.email) {
            Cookies.remove('admin')
            this.$router.push('/login')
          }
        } else {
          this.$notify.error(res.msg)
        }
      })
    },

    changeStatus(row) {
      if(this.admin.email === row.email && !row.status) {
        this.$notify.warning("Illegal Operation")
        row.status = true
      } else {
        // console.log(row)
        request.put('admin/update', row).then(res => {
          if(res.code === '200') {
            this.$notify.success('Status updated')
            this.load()
          } else {
            this.$notify.error(res.msg)
          }
        })
      }
    },

    changePageNum(pageNum) {
      this.params.pageNum = pageNum
      this.load()
    }
  }
}
</script>

<style scoped>

</style>
