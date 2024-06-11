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
        <el-breadcrumb-item>&ensp;<em><strong>Book List 图书详情</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- search area -->
    <div style="margin-bottom: 10px; margin-top: 10px">
      <el-input v-model="params.name" placeholder="Enter book's name" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.isbn" placeholder="Enter ISBN" style="width: 200px; margin-left: 3px"></el-input>
      <el-button icon="el-icon-search" style="margin-left: 3px; height: 40px" type="primary" @click="load">Search
      </el-button>
      <el-button icon="el-icon-refresh-right" style="margin-left: 3px; height: 40px" type="warning" @click="reset">
        Reset
      </el-button>
    </div>
    <!-- table area -->
    <div>
      <el-table :data="tableData" border="true" fit="true" stripe
                style="margin-left: 3px;width: 95vw;font-family: 'roboto mono', monospace;font-size: 20px;overflow: scroll">
        <el-table-column label="ISBN" prop="isbn" width="100"></el-table-column>
        <el-table-column label="Name" prop="name" resizable="false" show-overflow-tooltip width="150"></el-table-column>
        <el-table-column label="Category" prop="category" width="200"></el-table-column>
        <el-table-column label="Author" prop="author" width="200"></el-table-column>
        <el-table-column label="Publisher" prop="publisher" show-overflow-tooltip width="200"></el-table-column>
        <el-table-column label="Publish Date" prop="publish_date" width="160"></el-table-column>
        <el-table-column label="Description" prop="description" resizable="false" show-overflow-tooltip
                         width="400"></el-table-column>
        <el-table-column label="Create Date" prop="cDate" width="210"></el-table-column>
        <el-table-column label="Update Date" prop="uDate" width="210"></el-table-column>
        <el-table-column label="Cover" prop="cover" width="110">
          <template v-slot="scope1">
            <div v-viewer.static="{movable:false,title:false}" class="cover-viewer">
              <el-image :src="scope1.row.cover" style="width: 50%; height: 50%;"></el-image>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="credit" label="Score" width="85"></el-table-column>
        <el-table-column label="Number" prop="number" width="95"></el-table-column>
        <el-table-column fixed="right" label="Operation" width="200">
          <template v-slot="scope">
            <el-button type="primary" @click="$router.push('/editBook?isbn=' + scope.row.isbn)">Edit</el-button>
            <el-popconfirm
                confirm-button-text='Yes'
                cancel-button-text='No'
                title="Are you sure you want to delete this row of data？"
                @confirm="del(scope.row.isbn)"
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
<style>
.cover-viewer {
  opacity: 0.5;
}

.cover-viewer::after {
  content: "点击查看图片,可调整";
  position: relative;
  display: none;
  top: 100%;
  padding: 5px;
  left: 0;
  color: #060615;
}

.cover-viewer:hover::after {
  display: block;
}
</style>
<script>
import request from "@/utils/request";

export default {
  name: "List",

  data() {
    return {
      tableData: [],
      total: 0,
      params: {
        pageNum: 1,
        pageSize: 10,
        email: '',
        uid: '',
      },
    }
  },

  created() {
    this.load()
  },

  methods: {
    load() {
      request.get('book/page', {
        params: this.params
      }).then(res => {
        if(res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },

    del(isbn) {
      request.delete('book/delete/' + isbn).then(res => {
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
        name: '',
        isbn: '',
      }
      this.value = ''
      this.load()
    },

    changePageNum(pageNum) {
      this.params.pageNum = pageNum
      this.load()
    }
  }
}
</script>

<style>
.el-tooltip__popper {
  max-width: 400px; /* modify the width of the popper */
}
</style>
