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
        style="width:92%;margin-left: 3px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>User 用户</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>User List 用户详情</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- search area -->
    <div style="margin-bottom: 5px; margin-top: 10px">
      <el-input v-model="params.email" placeholder="Enter user email" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.uid" placeholder="Enter user id" style="width: 200px; margin-left: 2px"></el-input>
      <el-button type="primary" style="margin-left: 2px; height: 40px" icon="el-icon-search" @click="load">Search</el-button>
      <el-button type="warning" style="margin-left: 2px; height: 40px" icon="el-icon-refresh-right" @click="reset">Reset</el-button>
    </div>
    <!-- table area -->
    <div style="margin-top:10px;margin-right: 10px;width: 92%">
      <el-table :data="tableData" border="true" stripe
                style="width: 100%;margin-left: 3px;font-size: 24px;font-family: 'roboto mono', monospace">
        <el-table-column label="Status" prop="status" width="100">
          <template v-slot="scope2">
            <el-switch
                v-model="scope2.row.status"
                active-color="#13ce66"
                inactive-color="#ff4949"
                width="50"
                @change="changeStatus(scope2.row)">
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="User ID" prop="uid" show-overflow-tooltip width="200"></el-table-column>
        <el-table-column label="Username" prop="username" show-overflow-tooltip width="140"></el-table-column>
        <el-table-column label="First Name" prop="fname" width="160"></el-table-column>
        <el-table-column label="Last Name" prop="lname" width="140"></el-table-column>
        <el-table-column label="Age" prop="age" width="60"></el-table-column>
        <el-table-column label="Email" prop="email" show-overflow-tooltip width="280"></el-table-column>
        <el-table-column label="Phone" prop="phone" width="180"></el-table-column>
        <el-table-column label="Province/State" prop="province" width="220"></el-table-column>
        <el-table-column label="City" prop="city" show-overflow-tooltip width="100"></el-table-column>
        <el-table-column label="Street" prop="street" show-overflow-tooltip width="200"></el-table-column>
        <el-table-column label="Create Date" prop="ctime" width="200"></el-table-column>
        <el-table-column label="Update Date" prop="utime" width="200"></el-table-column>
        <el-table-column label="Score" prop="acredit" width=90></el-table-column>
        <el-table-column fixed="right" label="Operations" width="300">
          <template v-slot="scope">
            <el-button type="success" @click="chargeOpen(scope.row)">Recharge</el-button>
            <el-button style="margin-left: 5px;margin-right: 5px" type="primary"
                       @click="$router.push('/editUser?email=' + scope.row.email)">Edit
            </el-button>
            <el-popconfirm
                confirm-button-text='Yes'
                cancel-button-text='No'
                title="Are you sure you want to delete this row of data？"
                @confirm="del(scope.row.email)"
            >
              <el-button slot="reference" style="margin-left: 0;margin-top: 5px" type="danger">Delete</el-button>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <!-- charge up user account -->
      <el-dialog style="text-align: center" :visible.sync="dialogFormVisible">
        <div style="font-size: 30px; font-family: 'roboto mono', monospace;">Charge Up User's Account<br>充值账户积分
        </div>
        <el-form :model="form" :rules="rules" ref="ruleForm" style="margin-top: 15px; width: 80vh;">
          <el-form-item label="User email: " :label-width="formLabelWidth" prop="name">
            <el-input v-model="form.email" disabled autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Current credit: " :label-width="formLabelWidth" prop="name">
            <el-input v-model="form.acredit" disabled autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="Charge amount: " :label-width="formLabelWidth" prop="charge">
            <el-input v-model="form.charge" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <!-- buttons -->
        <div slot="footer" class="dialog-footer" style="text-align: center; margin-top: -40px">
          <el-button type="primary" @click="chargeUser">Confirm</el-button>
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
  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "List",

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

    return {
      tableData: [],
      total: 0,
      form: {},
      dialogFormVisible: false,
      formLabelWidth: '200px',
      params: {
        pageNum: 1,
        pageSize: 10,
        email: '',
        uid: '',
      },
      rules: {
        charge: [{ required: true,  validator: checkNumeric, trigger: 'blur' }],
      }
    }
  },

  created() {
    this.load()
  },

  methods: {
    load() {
      //let url = this.encapsule()
      // console.log(url)
      // fetch(url).then(res => res.json()).then(res => {
      //   // console.log(res.data)
      //   if(res.code === '200') {
      //     this.tableData = res.data.list
      //     this.total = res.data.total
      //   }
      // })

      request.get('user/page', {
        params: this.params
      }).then(res => {
        if(res.code === '200') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },

    del(email) {
      request.delete('user/delete/' + email).then(res => {
            if(res.code === '200') {
              this.$notify.success('Deleted')
              this.load()
            } else {
              this.$notify.error(res.msg)
            }
      })
    },

    //encapsule() {
    //  let url = 'http://10.20.245.160:9090/user/page'
    //  let params = this.params
//
    //  url = url + '?pageNum=' + params.pageNum
    //  url = url + '&pageSize=' + params.pageSize
    //  url = url + '&email=' + params.email
    //  url = url + '&uid=' + params.uid
//
    //  // console.log(url)
    //  return url
    //},

    reset() {
      this.params = {
        pageNum: 1,
        pageSize: 10,
        email: '',
        uid: '',
      }
      this.value = ''
      this.load()
    },

    changePageNum(pageNum) {
      this.params.pageNum = pageNum
      this.load()
    },

    chargeOpen(row) {
      this.dialogFormVisible = true
      this.form = row
    },

    cancel() {
      this.dialogFormVisible = false
      this.$refs['ruleForm'].resetFields()
    },

    chargeUser() {
      request.post("/user/charge", this.form).then(res => {
        if(res.code === '200') {
          this.$notify.success('Success')
          this.$refs['ruleForm'].resetFields()
          this.dialogFormVisible = false
          location.reload() // refresh page
        } else {
          this.$notify.error(res.msg)
        }
      })
    },

    changeStatus(row) {
      // console.log(row)
      request.put('user/update', row).then(res => {
        if(res.code === '200') {
          this.$notify.success('Status updated')
          this.load()
        } else {
          this.$notify.error(res.msg)
        }
      })
    },
  }
}
</script>

<style scoped>

</style>
