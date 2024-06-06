<template>
  <div>
    <!-- header -->
    <div
        style="height: 80px; line-height: 80px; background-color: white; width: 100%; margin-bottom: 2px; display: flex;border-bottom: 1px solid;border-radius: 3px;">
      <!-- logo and title -->
      <div style="width: 1000px;">
        <img alt="" src="@/assets/logo.png"
             style="width: 50px; height: 50px; position: relative; top: 10px; left: 25px">
        <span style="margin-left: 40px; font-size: 40px; font-family: 'Microsoft YaHei Light',sans-serif">&nbsp;&nbsp;图书管理系统&nbsp;&nbsp;&nbsp;&nbsp;Library Management System</span>
      </div>
      <!-- admins' info -->
      <div style="flex: 1; text-align: right; margin-right: 40px">
        <i class="el-icon-full-screen" style="margin-right: 10px" @click="changeScreen"></i>
        <el-dropdown style="cursor: pointer">
          <span class="el-dropdown-link">
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
      <div style="min-width: 230px; min-height: calc(100vh - 82px); height: 200px; overflow: hidden; margin-right: 2px;
      background-color: white;">
        <el-menu :unique-opened="true" :default-active="$route.path" :default-opens="['user']" router>
          <el-menu-item index="/home">
            <i class="el-icon-s-data"></i>
            <span style="font-family: Arial; font-size: 15px;">Homepage</span>
          </el-menu-item>
          <!-- users -->
          <el-submenu index="user">
            <template slot="title">
              <i class="el-icon-user"></i>
              <span style="font-family: Arial; font-size: 15px;">Users</span>
            </template>
            <el-menu-item index="/addUser">New User</el-menu-item>
            <el-menu-item index="/userList">User List</el-menu-item>
          </el-submenu>
          <!-- admins -->
          <el-submenu index="admin">
            <template slot="title">
              <i class="el-icon-user-solid"></i>
              <span style="font-family: Arial; font-size: 15px;">Administrators</span>
            </template>
            <el-menu-item index="/addAdmin">New Admin</el-menu-item>
            <el-menu-item index="/adminList">Admin List</el-menu-item>
          </el-submenu>
          <!-- category -->
          <el-submenu index="category">
            <template slot="title">
              <i class="el-icon-s-fold"></i>
              <span style="font-family: Arial; font-size: 15px;">Categories</span>
            </template>
            <el-menu-item index="/addCategory">New Parent Category</el-menu-item>
            <el-menu-item index="/categoryList">Category List</el-menu-item>
          </el-submenu>
          <!-- book -->
          <el-submenu index="book">
            <template slot="title">
              <i class="el-icon-collection"></i>
              <span style="font-family: Arial; font-size: 15px;">Books</span>
            </template>
            <el-menu-item index="/addBook">Add New Book</el-menu-item>
            <el-menu-item index="/BookList">Book List</el-menu-item>

            <el-menu-item index="/addBuy">New Buy Record</el-menu-item>
            <el-menu-item index="/BuyList">Buy Records</el-menu-item>


          </el-submenu>
          <!-- borrow -->
          <el-submenu index="borrow">
            <template slot="title">
              <i class="el-icon-download"></i>
            <span style="font-family: Arial; font-size: 15px;">Book Borrow</span>
          </template>
          <el-menu-item index="/addBorrow">New Borrow Record</el-menu-item>
          <el-menu-item index="/BorrowList">Borrow Records</el-menu-item>
          </el-submenu>
          <!-- return -->
          <el-submenu index="retern">
            <template slot="title">
              <i class="el-icon-upload2"></i>
              <span style="font-family: Arial; font-size: 15px;">Book Return</span>
            </template>
            <el-menu-item index="/ReternList">Return Records</el-menu-item>
          </el-submenu>
          <!-- api-doc -->
          <el-submenu index="swagger">
            <template slot="title">
              <i class="el-icon-folder-opened"></i>
              <span style="font-family: Arial,sans-serif; font-size: 15px;">Swagger API</span>
            </template>
            <el-menu-item index="/swagger">Knife4j 接口文档</el-menu-item>
          </el-submenu>
          <!-- zipkin -->
          <el-submenu index="trace">
            <template slot="title">
              <i class="el-icon-aim"></i>
              <span style="font-family: Arial,sans-serif; font-size: 15px;">链路追踪</span>
            </template>
            <el-menu-item index="/zipkin">Zipkin</el-menu-item>
            <el-menu-item index="/skywalking">SkyWalking</el-menu-item>
          </el-submenu>
          <!-- minio -->
          <el-submenu index="minio">
            <template slot="title">
              <i class="el-icon-coin"></i>
              <span style="font-family: Arial,sans-serif; font-size: 15px;">OSS 对象存储</span>
            </template>
            <el-menu-item index="/minio">Minio 文件上传</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>
      <!-- main -->
      <div ref="vantaRef"
           style="flex: 1;margin:0 ;background: url('http://localhost:9000/pp0alm-img/waves.gif') no-repeat;background-size: 100% 100%;background-attachment: fixed;">
        <router-view v-if="isRouterAlive"/>
      </div>
    </div>
    <Footer></Footer>
  </div>

</template>

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
      reload: this.reload
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
  // three渲染钩子
  // mounted() {
  //   this.vantaEffect = waves({
  //     el: this.$refs.vantaRef,
  //     THREE: THREE,
  //     mouseControls: true,
  //     touchControls: true,
  //     gyroControls: false,
  //     minHeight: 200.0,
  //     minWidth: 200.0,
  //     scale: 1.0,
  //     color: 0x79797d
  //   });
  // },
  // beforeDestroy() {
  //   if (this.vantaEffect) {
  //     this.vantaEffect.destroy();
  //   }
  // },
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
      // document.documentElement.requestFullscreen()  原生js调用
      //   如果可用 就可以全屏
      ScreenFull.toggle()
    }
  },
}
</script>

<style scoped>

</style>
