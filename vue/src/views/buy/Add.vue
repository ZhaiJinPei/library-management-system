<template>
  <div style="padding: 10px;">
    <div style="font-size: 40px; font-family: Arial; margin-bottom: 5px">Add New Buy Record</div>
    <div style=" width: 80%">
      <!-- form area -->
      <el-form :inline="true" :model="form" :rules="rules" ref="ruleForm">
        <el-form-item label="ISBN: " style="margin-left: 2px" prop="isbn">
          <el-select v-model="form.isbn" clearable filterable placeholder="Please select ISBN" @change="selectBook">
            <el-option
                v-for="item in books"
                :key="item.isbn"
                :label="item.isbn"
                :value="item.isbn">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="Book Name: " style="margin-left: 2px"  prop="name">
          <el-input v-model="form.name" placeholder="Enter book's name" disabled></el-input>
        </el-form-item>


        <el-form-item label="User ID: " style="margin-left: 2px" prop="uid">
          <el-select v-model="form.email" clearable filterable placeholder="Please select an user ID" @change="selectUser">
            <el-option
                v-for="item in users"
                :key="item.email"
                :label="item.uid"
                :value="item.email">
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="Username: " style="margin-left: 2px" prop="username">
          <el-input v-model="form.username" placeholder="Enter username" disabled></el-input>
        </el-form-item>

        <el-form-item label="Buy Number: " style="margin-left: 2px" prop="duration">
          <template>
            <el-input-number v-model="form.count" @change="handleChange" :min="1" :max="10000"></el-input-number>
          </template>
        </el-form-item>

        <el-form-item label="Unit Price: " style="margin-left: 2px" prop="duration">
          <template>
            <el-input-number v-model="form.price" @change="handleChange" :min="1" :max="10000"></el-input-number>
          </template>
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
    const checkISBN = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the book\'s ISBN'))
      }
      if (!/^[0-9]{10}$/.test(value)) {
        callback(new Error('Illegal ISBN'));
      }
      callback()
    }

    const checkEmail = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the email address'))
      }
      if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(value)) {
        callback(new Error('Illegal email address'))
      }
      callback()
    };

    const checkPhone = (rule, value, callback) => {
      if(!value) {
        callback(new Error('Please enter the phone number'))
      }
      if (!/^[1,2,3,4,5,6,7,8,9][0-9]{9}$/.test(value)) {
        callback(new Error('Illegal phone number'));
      }
      callback()
    }

    return {
      form: {
        count: 1,
        price: 1,
      },
      books: [],
      users: [],
      // rules to check the input values
      rules: {
        username: [{ required: true, message: 'Please enter the username', trigger: 'blur' }],
        name: [{ required: true, message: "Please enter the book's name", trigger: 'blur' }],
        isbn: [{ required: true,  validator: checkISBN, trigger: 'blur' }],
      }
    }
  },

  created() {
    // get book list
    request.get('/book/list').then(res => {
      this.books = res.data
    })
    // get user list
    request.get('/user/list').then(res => {
      this.users = res.data.filter(v => v.status)
    })
  },

  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          request.post('buy/save', this.form).then(res => {
            if(res.code === '200') {
              this.$notify.success('Submitted')
              this.$refs['ruleForm'].resetFields()
              location.reload()
            } else {
              this.$notify.error(res.msg)
            }
          })
        }
      })
    },
    // get data from book
    selectBook() {
      // console.log(this.form.isbn)
      const book = this.books.find(v => v.isbn === this.form.isbn)
      request.get("/book/" + book.isbn).then( res => {
        this.form.name = res.data.name
        this.form.credit = res.data.credit
        this.form.number = res.data.number
        this.unitCredit = res.data.credit
        this.$forceUpdate()
      })
    },
    // get data from user
    selectUser() {
      const user = this.users.find(v => v.email === this.form.email)
      request.get("/user/" + user.email).then(res => {
        this.form.phone = res.data.phone
        this.form.username = res.data.username
        this.form.acredit = res.data.acredit
        this.$forceUpdate()
      })
    },

    handleChange() {
      this.form.credit = this.form.duration * this.unitCredit
    }
  }
}
</script>

<style scoped>

</style>