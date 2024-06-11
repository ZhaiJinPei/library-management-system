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
  <div style="width:90vw;height: 100vh;padding: 0.8vh;margin-top: 6vh;">
    <div class="breadcrumb">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Homepage 系统主页</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div style="padding: 10px;width: 95vw">
      <!-- date range selector -->
      <div>
        <el-select v-model="form.dateRange" placeholder="Select date range" @change="load">
          <el-option
              v-for="item in range"
              :key="item.value"
              :label="item.label"
              :value="item.value">
          </el-option>
        </el-select>
      </div>
      <!-- line chart area -->
      <div style="margin-top: 1vh;width: 95vw">
        <el-card>
          <div id="lineChart" style="width: 93vw; height: 55vh"></div>
        </el-card>
      </div>
      <div class="block"
           style="font-family: 'roboto mono', monospace;background: rgba(97,92,92,0.8);margin-top: 20px;border-radius: 5px">
        <span class="demonstration" style="margin-left: 1px"></span>
        <el-carousel height="150px">
          <el-carousel-item v-for="item in png1" :key="item">
            <img :src="item" style="opacity: 0.8;width: 95vw;height: 11vh;"/>
          </el-carousel-item>
        </el-carousel>
        <span class="demonstration" style="margin-left: 1px"></span>
      </div>
      <div class="block"
           style="font-family: 'roboto mono', monospace;background: rgba(0,0,0,0.25);margin-top: 20px;border-radius: 5px">
        <span class="demonstration" style="margin-left: 1px"></span>
        <el-carousel height="150px">
          <el-carousel-item v-for="item in png2" :key="item">
            <img :src="item" style="opacity: 0.8;width: 95vw;height: 11vh"/>
          </el-carousel-item>
        </el-carousel>
        <span class="demonstration" style="margin-left: 1px"></span>
      </div>
    </div>
  </div>

</template>
<style>
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}
</style>
<script>
import Cookies from "js-cookie";
import Request from "@/utils/request";
import * as echarts from 'echarts';

const option = {
  title: {
    text: 'Line Chart of Borrows and Returns 借还记录折线图'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['Borrow', 'Return']
  },
  grid: {
    left: '3vw',
    right: '4vw',
    bottom: '3vh',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: [] // get date form backend
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: 'Borrow',
      type: 'line',
      data: [] // get number of borrow records of a day form backend
    },
    {
      name: 'Return',
      type: 'line',
      data: [] // get number of record records of a day form backend
    },
  ]
};

export default {
  data() {
    return {
      admin: Cookies.get('admin') ? JSON.parse(Cookies.get('admin')): {},
      form: { dateRange: 'week' },
      lineBox: null, // echarts container
      range: [{
        value: 'week',
        label: 'Recent week 最近一星期'
      }, {
        value: 'month',
        label: 'Recent 30 days 最近30天'
      }, {
        value: 'month2',
        label: 'Recent 60 days 最近60天'
      }, {
        value: 'month3',
        label: 'Recent 90 days 最近90天'
      }],
      png1: [
        "http://10.20.245.160:9000/png/knife4j.png",
        "http://10.20.245.160:9000/png/spring.png",
        "http://10.20.245.160:9000/png/node.png",
        "http://10.20.245.160:9000/png/skywalking.png"
      ],
      png2: [
        "http://10.20.245.160:9000/png/swagger.png",
        "http://10.20.245.160:9000/png/vanta.png",
        "http://10.20.245.160:9000/png/npmjs.png",
        "http://10.20.245.160:9000/png/minio.png"
      ]
    }
  },

  created() {
    Request.get('/admin/' + this.admin.email).then(res => {
      if(res.data !== null) {
        this.admin = res.data
      } else {
        this.$router.push('/login') // jump to /login if res.data == null
      }
    })
  },

  mounted() {
    this.load()
  },

  methods: {
    load() {
      if(!this.lineBox) {
        this.lineBox = echarts.init(document.getElementById('lineChart')) // init lineBox
      }
      Request.get('/lineChart/getLineChart/' + this.form.dateRange).then(res => {
        option.xAxis.data = res.data.date // get date range
        option.series[0].data = res.data.borrows // get borrow data
        option.series[1].data = res.data.reterns // get return data
        this.lineBox.setOption(option) // generate line chart
      })
    },


  }
}
</script>

<style>

</style>
