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
        <el-breadcrumb-item>&ensp;<em><strong>Book Borrow 图书借阅</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Borrow Records 借阅记录</strong></em></el-breadcrumb-item>
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
    <div style="margin-left: 3px;width: 98%">
      <el-table :data="tableData" border="true" stripe
                style="width: 100%;font-size: 20px;font-family: 'roboto mono', monospace">
        <el-table-column label="User ID" prop="uid" show-overflow-tooltip width="250"></el-table-column>
        <el-table-column label="Username" prop="username" show-overflow-tooltip width="200"></el-table-column>
        <el-table-column label="Phone" prop="phone" width="200"></el-table-column>
        <el-table-column label="Book Name" prop="name" show-overflow-tooltip width="400"></el-table-column>
        <el-table-column label="ISBN" prop="isbn" width="200"></el-table-column>
        <el-table-column label="Status" prop="bstatus" width="190"></el-table-column>
        <el-table-column :formatter="createDateFormat" label="Borrow Date" prop="cdate" width="200"></el-table-column>
        <el-table-column label="Days" prop="duration" width="70"></el-table-column>
        <el-table-column :formatter="dueDateFormat" label="Due Date" prop="rdate" width="200"></el-table-column>
        <el-table-column label="Notification" prop="notification" width="160">
          <template v-slot="scope1">
            <el-tag type="danger" v-if="scope1.row.notification === 'past due'">
              {{ scope1.row.notification }}
            </el-tag>
            <el-tag type="primary" v-if="scope1.row.notification === 'almost due'">
              {{ scope1.row.notification }}
            </el-tag>
            <el-tag type="warning" v-if="scope1.row.notification === 'at the due date'">
              {{ scope1.row.notification }}
            </el-tag>
            <el-tag type="success" v-if="scope1.row.notification === 'before due'">
              {{ scope1.row.notification }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column fixed="right" label="Management" width="130">
          <template v-slot="scope2">
            <el-button type="primary" style="margin-left: 2px;" @click="bookReturn(scope2.row)" v-if="scope2.row.bstatus === 'Borrowed'">
              Return
            </el-button>
          </template>
        </el-table-column>
        <el-table-column fixed="right" label="Operation" width="150">
          <template v-slot="scope">
            <el-popconfirm
                confirm-button-text='Yes'
                cancel-button-text='No'
                title="Are you sure you want to delete this row of data？"
                @confirm="del(scope.row)"
            >
              <el-button style="margin-left: 2px;" slot="reference" type="danger">Delete</el-button>
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
        pageSize: 10,
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
      request.get('borrow/page', {
        params: this.params
      }).then(res => {
        if(res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },

    del(row) {
      const email = row.email
      const isbn = row.isbn
      const id = row.id

      request.delete('borrow/delete/' + email + '&' + isbn + '&' + id).then(res => {
        if(res.code === '200') {
          this.$notify.success('Deleted')
          this.load()
        } else {
          this.$notify.error(res.msg)
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

    bookReturn(row) {
      // console.log(row)
      request.post('/retern/save', row).then(res => {
        if(res.code === '200') {
          this.$notify.success('Book returned')
          location.reload()
        } else {
          this.$notify.error(res.msg)
        }
      })
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
