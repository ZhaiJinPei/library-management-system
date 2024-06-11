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
  <div>
    <!-- header -->
    <div
        ref="theme6" v-model="themec"
        style="position:fixed;z-index:99;top:0;color: black;height: 6vh; line-height: 6vh; background: white; width: 100vw; margin-bottom: 1vh; display: flex;border-bottom: 0.1vh solid;border-bottom-color: black">
      <!-- logo and title -->
      <div ref="theme1" v-model="themec" style="width: 50vw;background: #fff9f9">
        <img ref="theme2" v-model="themec" alt="" src="@/assets/logo.png"
             style="background: #fff9f9;width: 2vw; height: 4vh; position: relative; top: 0.7vh; left: 0.5vw">
        <span ref="theme3" v-model="themec"
              style="background-color: #fff9f9; margin-left: 1vw; font-size: 3vh; font-family: 'Microsoft YaHei Light',sans-serif">&nbsp;&nbsp;图书管理系统&nbsp;&nbsp;&nbsp;&nbsp;Library Management System</span>
      </div>

      <!-- admins' info -->
      <div ref="theme5" v-model="themec"
           style="color: black; flex: 1; text-align: right; margin-right: 1.5vw;background: #fff9f9">
        <i class="el-icon-full-screen" style="font-size: 1vw;margin-top: 1vh" @click="changeScreen"></i>
        <div style="display: inline;margin-left: 0.5vw;padding:2vh;">
          <el-switch
              v-model="theme"
              active-color="#409eff"
              active-icon-class="el-icon-monn"
              inactive-color="#c0ccda"
              inactive-icon-class="el-icon-sunny"
              inline-prompt
              name="theme"
              style="padding-bottom:0.5vh;"
              width="50"
              @change='changeTheme'
          />
        </div>
        <el-dropdown style="cursor: pointer;">
          <span ref="theme7" v-model="themec"
                class="el-dropdown-link" style="color: #001a1c;font-family: 'roboto mono', monospace;font-size: 20px ">
            Welcome {{ admin.username }}<i class="el-icon-arrow-down el-icon--right"></i>
          </span>
          <!-- dropdown -->
          <el-dropdown-menu slot="dropdown" style="margin-top: -15px; width: 150px; text-align: left">
            <el-dropdown-item><div @click="dialogFormVisible = true">change password</div></el-dropdown-item>
            <el-dropdown-item><div @click="logout">logout</div></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <!-- change password -->
        <el-dialog style="text-align: center" :visible.sync="dialogFormVisible">
          <div style="font-size: 30px; font-family: Arial; font-weight: bold">Change Password</div>
          <el-form :model="form" :rules="rules" ref="ruleForm" style="margin-top: 2px; width: 80vh;">
            <el-form-item label="Original Password: " :label-width="formLabelWidth" prop="password">
              <el-input v-model="form.password" show-password autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="New Password: " :label-width="formLabelWidth" prop="newPassword">
              <el-input v-model="form.newPassword" show-password autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="Comfirm New Password: " :label-width="formLabelWidth" prop="confirmPassword">
              <el-input v-model="form.confirmPassword" show-password autocomplete="off"></el-input>
            </el-form-item>
          </el-form>
          <!-- buttons -->
          <div slot="footer" class="dialog-footer" style="text-align: center; margin-top: -60px">
            <el-button type="primary" @click="changePass">Confirm</el-button>
            <el-button type="warning" @click="cancelChange">Cancel</el-button>
          </div>
        </el-dialog>
      </div>
    </div>


    <!-- side and main -->
    <div style="display: flex">
      <!-- side -->
      <div ref="theme4" v-model="themec"
           style="z-index: 99;margin-top: 6vh;min-width: 65px; max-width: 65px;min-height: calc(100vh - 82px); height: 200px; overflow: hidden;background-color: white;">
        <el-menu
            :default-active="$route.path"
            :default-opens="['user']"
            :unique-opened="true"
            router
            style="font-family: 'roboto mono', monospace;background: #cfd7dc"
        >
          <el-menu-item index="/home">
            <i class="el-icon-s-data"></i>
            <span style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Homepage 系统主页</span>
          </el-menu-item>
          <!-- users -->
          <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-user"></i>
              <span style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Users 用户</span>
            </template>
            <el-menu-item index="/addUser">
              <i class="el-icon-add-location" style="margin-left:-20px"></i>
              &emsp;&emsp;&emsp;&emsp;New User 新增用户
            </el-menu-item>
            <el-menu-item index="/userList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;User List 用户详情
            </el-menu-item>
          </el-submenu>
          <!-- admins -->
          <el-submenu index="admin">
            <template slot="title">
              <i class="el-icon-user-solid"></i>
              <span
                  style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Administrators 管理员</span>
            </template>
            <el-menu-item index="/addAdmin">
              <i class="el-icon-add-location" style="margin-left:-20px"></i>
              &emsp;&emsp;&emsp;&emsp;New Admin 新增管理员
            </el-menu-item>
            <el-menu-item index="/adminList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Admin List 管理员详情
            </el-menu-item>
          </el-submenu>
          <!-- category -->
          <el-submenu index="category">
            <template slot="title">
              <i class="el-icon-s-fold"></i>
              <span
                  style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Categories 图书类型</span>
            </template>
            <el-menu-item index="/addCategory">
              <i class="el-icon-add-location" style="margin-left:-20px"></i>
              &emsp;&emsp;&emsp;&emsp;New Parent Category 新增类型
            </el-menu-item>
            <el-menu-item index="/categoryList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Category List 类型详情
            </el-menu-item>
          </el-submenu>
          <!-- book -->
          <el-submenu index="book">
            <template slot="title">
              <i class="el-icon-collection"></i>
              <span style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Books 图书</span>
            </template>
            <el-menu-item index="/addBook">
              <i class="el-icon-add-location" style="margin-left:-20px"></i>
              &emsp;&emsp;&emsp;&emsp;Add New Book 新增图书
            </el-menu-item>
            <el-menu-item index="/BookList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Book List 图书详情
            </el-menu-item>
            <el-menu-item index="/addBuy">
              <i class="el-icon-add-location" style="margin-left:-20px"></i>
              &emsp;&emsp;&emsp;&emsp;New Buy Record 新增购买记录
            </el-menu-item>
            <el-menu-item index="/BuyList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Buy Records 购买记录
            </el-menu-item>
          </el-submenu>
          <!-- borrow -->
          <el-submenu index="borrow">
            <template slot="title">
              <i class="el-icon-download"></i>
              <span
                  style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Book Borrow 图书借阅</span>
          </template>
            <el-menu-item index="/addBorrow">
              <i class="el-icon-add-location" style="margin-left:-20px"></i>
              &emsp;&emsp;&emsp;&emsp;New Record 新增借阅记录
            </el-menu-item>
            <el-menu-item index="/BorrowList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Borrow Records 借阅记录
            </el-menu-item>
          </el-submenu>
          <!-- return -->
          <el-submenu index="retern">
            <template slot="title">
              <i class="el-icon-upload2"></i>
              <span
                  style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Book Return 图书归还</span>
            </template>
            <el-menu-item index="/ReternList">
              <i class="el-icon-s-operation" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Return Records 归还记录
            </el-menu-item>
          </el-submenu>
          <!-- api-doc -->
          <el-submenu index="swagger">
            <template slot="title">
              <i class="el-icon-folder-opened"></i>
              <span style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Swagger2 接口 API</span>
            </template>
            <el-menu-item index="/swagger">
              <i class="el-icon-notebook-1" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Knife4j 接口文档
            </el-menu-item>
          </el-submenu>
          <!-- zipkin -->
          <el-submenu index="trace">
            <template slot="title">
              <i class="el-icon-aim"></i>
              <span style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;Trace 链路追踪</span>
            </template>
            <el-menu-item index="/zipkin">
              <i class="el-icon-monitor" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Zipkin
            </el-menu-item>
            <el-menu-item index="/skywalking">
              <i class="el-icon-data-analysis" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Apache SkyWalking
            </el-menu-item>
          </el-submenu>
          <!-- minio -->
          <el-submenu index="minio">
            <template slot="title">
              <i class="el-icon-coin"></i>
              <span style="font-family: 'roboto mono', monospace; font-size: 15px;">&emsp;&emsp;OSS 文件上传</span>
            </template>
            <el-menu-item index="/minio">
              <i class="el-icon-upload" style="margin-left: -20px"></i>
              &emsp;&emsp;&emsp;&emsp;Minio 文件上传
            </el-menu-item>
          </el-submenu>
        </el-menu>
        <i ref="col"
           :collapse="isCollapse"
           class="el-icon-s-fold"
           id="i-fold"
           style="font-size: 32px;margin-left: 15px;margin-top: 10px" @click="onCollapse"></i>
      </div>
      <!-- main -->
      <div ref="vantaRef"
           style="flex: 1;margin:0 ;background: url('http://10.20.245.160:9000/pp0alm-img/waves.gif') no-repeat;background-size: 100vw 100vh;background-attachment: fixed;">
        <router-view v-if="isRouterAlive"/>
      </div>
    </div>
    <Footer></Footer>
  </div>

</template>

<style>
#i-fold:hover {
  opacity: 0.6;
}
</style>

<script>
import Cookies from "js-cookie";
import request from "@/utils/request";
import Footer from "@/views/Footer";
import ScreenFull from 'screenfull'

export default {
  components: {Footer},
  name: "Layout",
  provide() {
    return {
      reload: this.reload,
      sinp: ''
    }
  },
  data() {
    const checkConfirm = (rule, value, callback) => {
      if(!value) {
        callback(new Error("Please enter new password again"))
      }
      if (value !== this.form.newPassword) {
        callback(new Error("Please enter the correct new password"))
      }
      callback()
    }

    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')): {},
      dialogFormVisible: false,
      formLabelWidth: '200px',
      form: {},
      fullImg: false,
      isRouterAlive: true,
      theme: false,
      themec: false,
      sinp: '',
      isCollapse: true,
      rules: {
        password: [{ required: true, message: "Original password cannot be empty", trigger: 'blur' }],
        newPassword: [
          { required: true, message: "New password cannot be empty", trigger: 'blur' },
          { min: 6, max: 30, message: "Password length must be 6-30" }
        ],
        confirmPassword: [
          { required: true, validator: checkConfirm, trigger: 'blur' },
          { min: 6, max: 30, message: "Password length must be 6-30" }
        ]
      }
    }
  },
  methods: {
    logout() {
      // data removal is required
      Cookies.remove('admin')
      this.$router.push('/login')
    },

    cancelChange() {
      this.dialogFormVisible = false
      this.$refs['ruleForm'].resetFields()
    },

    changePass() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          this.form.email = this.admin.email // get email
          request.put('admin/changePass', this.form).then(res => {
            if(res.code === '200') {
              this.$notify.success("Updated")
              this.$refs['ruleForm'].resetFields()
              this.dialogFormVisible = false
              // Cookies.remove('admin')
              // this.$router.push('/login')
            } else {
              this.$notify(res.msg)
            }
          })
        }
      })
    },
    reload() {
      this.isRouterAlive = false;
      this.$nextTick(function () {
        this.isRouterAlive = true;
      })
    },
    //   改变全屏
    changeScreen() {
      if (!ScreenFull.isEnabled) {
        // 此时全屏不可用
        this.$message.warning('此时全屏组件不可用')
        return
      }
      ScreenFull.toggle()
    },
    changeTheme() {
      var current1 = this.$refs["theme1"]
      var current2 = this.$refs["theme2"]
      var current3 = this.$refs["theme3"]
      var current4 = this.$refs["theme4"]
      var current5 = this.$refs["theme5"]
      var current6 = this.$refs["theme6"]
      var current7 = this.$refs["theme7"]
      if (this.themec === false) {
        this.themec = true
        current1.style.background = "#56575c"
        current2.style.background = "#56575c"
        current3.style.background = "#56575c"
        current4.style.background = "#56575c"
        current5.style.background = "#56575c"
        current5.style.color = "#ffffff"
        current6.style.background = "#56575c"
        current6.style.color = "#fff9f9"
        current6.style.borderBottomColor = "#1861fd"
        current7.style.color = "#fff9f9"
      } else {
        this.themec = false
        current1.style.background = "#fff9f9"
        current2.style.background = "#fff9f9"
        current3.style.background = "#fff9f9"
        current4.style.background = "#fff9f9"
        current5.style.background = "#fff9f9"
        current5.style.color = "#1b0e15"
        current6.style.background = "#fff9f9"
        current6.style.color = "#1b0e15"
        current6.style.borderBottomColor = "#1b0e15"
        current7.style.color = "#13ceda"
      }
    },
    onCollapse() {
      var c = this.$refs['theme4']
      var col = this.$refs['col']
      var menub = this.$refs['menub']
      if (this.isCollapse === false) {
        this.isCollapse = true;
        c.style.minWidth = '65px'
        c.style.maxWidth = '65px'
        col.className = 'el-icon-s-unfold'
        menub.style.minWidth = '50px'
        menub.style.maxWidth = '50px'
      } else {
        this.isCollapse = false;
        c.style.minWidth = '300px'
        c.style.maxWidth = '500px'
        col.className = 'el-icon-s-fold'
        menub.style.minwidth = '254px;'
        menub.style.maxWidth = '254px;'
      }
    },
  },
}
</script>

<style scoped>

</style>
