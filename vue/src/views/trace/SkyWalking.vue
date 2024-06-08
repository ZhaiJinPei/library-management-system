<script>
export default {
  name: "SkyWalking"
}
</script>

<template>

  <div style="margin:0;padding:10px;:100%; height: 98%">
    　　
    <div
        style="width:99%;margin-left: 3px;margin-bottom:5px;padding-top:5px;height: 20px;font-family: 'roboto mono', monospace;background: #ffffff;border-radius:5px">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>&ensp;<em><strong>Trace 链路追踪</strong></em></el-breadcrumb-item>
        <el-breadcrumb-item>&ensp;<em><strong>Apache SkyWalking</strong></em></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <iframe src="http://10.20.245.160:8088/" style="width: 100%; height: 100%"></iframe>
  </div>
</template>

