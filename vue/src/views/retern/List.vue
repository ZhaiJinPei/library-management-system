<template>
  <div style="padding: 10px">
    <div
        style="width:99%;margin-left: 3px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Book Return 图书归还</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Return Records 归还记录</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <!-- search area -->
    <div style="margin-bottom: 2px; margin-top: 2px">
      <el-input v-model="params.username" placeholder="Enter username" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.name" placeholder="Enter book's name" style="width: 200px; margin-left: 2px"></el-input>
      <el-input v-model="params.isbn" placeholder="Enter book's isbn" style="width: 200px; margin-left: 2px"></el-input>
      <el-button type="primary" style="margin-left: 2px; height: 40px" icon="el-icon-search" @click="load">Search</el-button>
      <el-button type="warning" style="margin-left: 2px; height: 40px" icon="el-icon-refresh-right" @click="reset">Reset</el-button>
    </div>
    <!-- table area -->
    <div>
      <el-table :data="tableData" stripe style="margin-left: 3px;width: 99%">
        <el-table-column prop="uid" label="User ID" show-overflow-tooltip width="150"></el-table-column>
        <el-table-column prop="username" label="Username" show-overflow-tooltip width="120"></el-table-column>
        <el-table-column prop="phone" label="Phone" width="100"></el-table-column>
        <el-table-column prop="name" label="Book Name" show-overflow-tooltip width="450"></el-table-column>
        <el-table-column prop="isbn" label="ISBN" width="100"></el-table-column>
        <el-table-column prop="bstatus" label="Status" width="100"></el-table-column>
        <el-table-column prop="cdate" label="Borrow Date" width="120" :formatter="createDateFormat"></el-table-column>
        <el-table-column prop="duration" label="Days" width="100"></el-table-column>
        <el-table-column prop="rdate" label="Due Date" width="100" :formatter="dueDateFormat"></el-table-column>
        <el-table-column prop="adate" label="Return Date" width="180" :formatter="returnDateFormat"></el-table-column>
        <el-table-column fixed="right" label="Operations">
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
import moment from "moment/moment";

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
  },

  methods: {
    load() {
      request.get('retern/page', {
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

      request.delete('retern/delete/' + email + '&' + isbn).then(res => {
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

    createDateFormat(row) {
      return moment(row.cdate).format("YYYY-MM-DD") // a useful tool to format datetime
    },
    dueDateFormat(row) {
      return moment(row.rdate).format("YYYY-MM-DD")
    },
    returnDateFormat(row) {
      return moment(row.adate).format("YYYY-MM-DD")
    },
  }
}
</script>

<style scoped>

</style>
