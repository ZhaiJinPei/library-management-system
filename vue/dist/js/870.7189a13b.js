"use strict";(self["webpackChunkvue"]=self["webpackChunkvue"]||[]).push([[870],{6870:function(e,t,r){r.r(t),r.d(t,{default:function(){return f}});var a=function(){var e=this,t=e._self._c;return t("div",{staticStyle:{padding:"10px"}},[t("div",{staticStyle:{width:"99%","margin-left":"3px","padding-top":"5px",height:"20px","font-family":"'roboto mono', monospace",background:"#ffffff","border-radius":"5px"}},[t("el-breadcrumb",{attrs:{"separator-class":"el-icon-arrow-right"}},[t("el-breadcrumb-item",[e._v(" "),t("em",[t("strong",[e._v("Categories 图书类型")])])]),t("el-breadcrumb-item",[e._v(" "),t("em",[t("strong",[e._v("New Parent Category 新增类型")])])])],1)],1),e._m(0),t("div",{staticStyle:{width:"30%",transform:"scale(2,2)","margin-top":"200px","margin-left":"500px"}},[t("el-form",{ref:"ruleForm",attrs:{inline:!0,model:e.form,rules:e.rules}},[t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Category Name: ",prop:"name"}},[t("el-input",{attrs:{placeholder:"Enter name"},model:{value:e.form.name,callback:function(t){e.$set(e.form,"name",t)},expression:"form.name"}})],1),t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Remark 标识: ",prop:"remark"}},[t("el-input",{attrs:{placeholder:"Enter remark"},model:{value:e.form.remark,callback:function(t){e.$set(e.form,"remark",t)},expression:"form.remark"}})],1)],1),t("div",{staticStyle:{"text-align":"center"}},[t("el-button",{staticStyle:{height:"40px","min-width":"100px",transform:"scale(1.2,1.2)"},attrs:{type:"primary"},on:{click:e.save}},[e._v(" Submit ")])],1)],1)])},o=[function(){var e=this,t=e._self._c;return t("div",[t("div",{staticStyle:{"font-size":"50px","font-family":"'roboto mono', monospace","margin-left":"50px","margin-bottom":"50px","margin-top":"50px"}},[e._v(" Add Parent Category 新增类型 ")])])}],i=r(4471),m={name:"Add",data(){return{form:{},rules:{name:[{required:!0,message:"Category name must not be empty",trigger:"blur"}],remark:[{required:!0,message:"Remark must not be empty",trigger:"blur"}]}}},methods:{save(){this.$refs["ruleForm"].validate((e=>{e&&i.Z.post("category/save",this.form).then((e=>{"200"===e.code?(this.$notify.success("Submitted"),this.$refs["ruleForm"].resetFields()):this.$notify.error(e.msg)}))}))}}},s=m,n=r(1001),l=(0,n.Z)(s,a,o,!1,null,"362862f6",null),f=l.exports}}]);
//# sourceMappingURL=870.7189a13b.js.map