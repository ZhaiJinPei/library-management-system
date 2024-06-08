<template>
  <div style="padding: 10px;">
    <div
        style="width:99%;margin-left: 3px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Categories 图书类型</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Edit Category 编辑类型信息</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div>
      <div style="font-size: 40px; font-family: 'roboto mono', monospace; margin-bottom: 10px;margin-top: 10px">Edit
        Edit Category 编辑类型信息
      </div>
    </div>

    <div style="width: 60%; margin-top: 10px">
      <el-form ref="ruleForm" :inline="true" :model="form" :rules="rules" size="30px">
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
  name: "Edit",

  data() {
    return {
      form: {},
      rules: {
        name: [{ required: true, message: "Category name must not be empty", trigger: 'blur' }],
        remark: [{ required: true, message: "Remark must not be empty", trigger: 'blur' }],
      }
    }
  },

  created() {
    const name = this.$route.query.name
    request.get('/category/' + name).then(res => {
      console.log(res.data)
      this.form = res.data
    })
  },

  methods: {
    save() {
      this.$refs['ruleForm'].validate((valid) => {
        if(valid) {
          request.put('category/update', this.form).then(res => {
            if(res.code === '200') {
              this.$notify.success('Updated')
              this.$router.push("/categoryList")
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
