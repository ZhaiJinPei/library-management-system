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
        <el-breadcrumb-item>&ensp;<em><strong>Books 图书</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Buy Records 购买记录</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- search area -->
    <div style="margin-bottom: 10px; margin-top: 10px">
      <el-input v-model="params.username" placeholder="Enter username" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.name" placeholder="Enter book's name" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.isbn" placeholder="Enter book's isbn" style="width: 200px; margin-left: 2px"></el-input>
      <el-button icon="el-icon-search" style="margin-left: 3px; height: 40px" type="primary" @click="load">Search
      </el-button>
      <el-button icon="el-icon-refresh-right" style="margin-left: 3px; height: 40px" type="warning" @click="reset">
        Reset
      </el-button>
    </div>
    <!-- table area -->
    <div>
      <el-table :data="tableData" border="true" stripe
                style="margin-left: 3px;width: 95vw;font-size: 20px;font-family: 'roboto mono', monospace">
        <el-table-column label="User ID" prop="uid" show-overflow-tooltip width="500"></el-table-column>
        <el-table-column label="Username" prop="username" show-overflow-tooltip width="200"></el-table-column>
        <el-table-column prop="name" label="Book Name" show-overflow-tooltip width="500"></el-table-column>
        <el-table-column prop="isbn" label="ISBN" width="150"></el-table-column>
        <el-table-column :formatter="createDateFormat" label="Buying Time" prop="cdate" width="200"></el-table-column>
        <el-table-column label="Unit Price" prop="price" width="200"></el-table-column>
        <el-table-column label="Buy Quantity" prop="count" width="200"></el-table-column>
        <el-table-column label="Total Price" prop="total" width="200"></el-table-column>
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
  </div>
</template>

<script>
import request from "@/utils/request";
import moment from "moment";

export default {
  name: "List",

  data() {
    return {
      tableData: [],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 15,
        username: '',
        isbn: '',
        name: ''
      },
    }
  },

  created() {
    this.load()
    // console.log(moment("2023-01-05 23:12:22").format("YYYY-MM-DD"))
  },

  methods: {
    load() {
      request.get('buy/page', {
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
        isbn: '',
      }
      this.value = ''
      this.load()
    },

    changePageNum(pageNum) {
      this.params.pageNum = pageNum
      this.load()
    },


    createDateFormat(row) {
      return moment(row.cdate).format("YYYY-MM-DD") // a useful tool to format datetime
    },
    dueDateFormat(row) {
      return moment(row.rdate).format("YYYY-MM-DD")
    },
  }
}
</script>

<style scoped>

</style>
