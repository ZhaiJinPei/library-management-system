"use strict";(self["webpackChunkvue"]=self["webpackChunkvue"]||[]).push([[677],{5677:function(e,r,t){t.r(r),t.d(r,{default:function(){return p}});var a=function(){var e=this,r=e._self._c;return r("div",{staticStyle:{padding:"10px"}},[r("div",{staticStyle:{"padding-top":"5px",height:"20px","font-family":"'roboto mono', monospace",background:"#ffffff","border-radius":"5px"}},[r("el-breadcrumb",{attrs:{"separator-class":"el-icon-arrow-right"}},[r("el-breadcrumb-item",[e._v(" "),r("em",[r("strong",[e._v("User 用户")])])]),r("el-breadcrumb-item",[e._v(" "),r("em",[r("strong",[e._v("New User 新增用户")])])])],1)],1),r("div",{staticStyle:{"font-size":"50px",color:"#000000","font-family":"'roboto mono', monospace","margin-top":"90px","margin-left":"95px","margin-bottom":"10px"}},[e._v(" Add New User 新增用户 ")]),r("div",{staticStyle:{width:"40%","margin-left":"500px","margin-top":"300px",transform:"scale(2,2)"}},[r("el-form",{ref:"ruleForm",attrs:{inline:!0,model:e.form,rules:e.rules,size:"30px"}},[r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"First Name 本名: ",prop:"fname"}},[r("el-input",{attrs:{placeholder:"Enter first name"},model:{value:e.form.fname,callback:function(r){e.$set(e.form,"fname",r)},expression:"form.fname"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Middle(Western) 教名: ",prop:"minit"}},[r("el-input",{attrs:{placeholder:"Enter middle"},model:{value:e.form.minit,callback:function(r){e.$set(e.form,"minit",r)},expression:"form.minit"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Last Name 姓氏: ",prop:"lname"}},[r("el-input",{attrs:{placeholder:"Enter last name"},model:{value:e.form.lname,callback:function(r){e.$set(e.form,"lname",r)},expression:"form.lname"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Email 邮箱账号: ",prop:"email"}},[r("el-input",{attrs:{placeholder:"Enter email"},model:{value:e.form.email,callback:function(r){e.$set(e.form,"email",r)},expression:"form.email"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"User ID 自动生成: "}},[r("el-input",{attrs:{placeholder:"--Generate after submission--",disabled:!0},model:{value:e.form.uid,callback:function(r){e.$set(e.form,"uid",r)},expression:"form.uid"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Username 用户名: ",prop:"username"}},[r("el-input",{attrs:{placeholder:"Enter username"},model:{value:e.form.username,callback:function(r){e.$set(e.form,"username",r)},expression:"form.username"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Phone 电话号: ",prop:"phone"}},[r("el-input",{attrs:{placeholder:"Enter phone number"},model:{value:e.form.phone,callback:function(r){e.$set(e.form,"phone",r)},expression:"form.phone"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Age 年龄: ",prop:"age"}},[r("el-input",{attrs:{placeholder:"Enter age"},model:{value:e.form.age,callback:function(r){e.$set(e.form,"age",r)},expression:"form.age"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Gender 性别: ",prop:"gender"}},[r("el-select",{attrs:{placeholder:"Please select a gender"},model:{value:e.form.gender,callback:function(r){e.$set(e.form,"gender",r)},expression:"form.gender"}},e._l(e.options,(function(e){return r("el-option",{key:e.value,attrs:{label:e.label,value:e.value}})})),1)],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Province/State 省份/州名: ",prop:"province"}},[r("el-input",{attrs:{placeholder:"Enter province or state"},model:{value:e.form.province,callback:function(r){e.$set(e.form,"province",r)},expression:"form.province"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"City 城市名: ",prop:"city"}},[r("el-input",{attrs:{placeholder:"Enter city"},model:{value:e.form.city,callback:function(r){e.$set(e.form,"city",r)},expression:"form.city"}})],1),r("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Street/Road 街道名/路名: ",prop:"street"}},[r("el-input",{attrs:{placeholder:"Enter street or road"},model:{value:e.form.street,callback:function(r){e.$set(e.form,"street",r)},expression:"form.street"}})],1)],1),r("div",{staticStyle:{"text-align":"center"}},[r("el-button",{staticStyle:{"margin-left":"2px",height:"40px","min-width":"100px"},attrs:{type:"primary"},on:{click:e.save}},[e._v("Submit ")])],1)],1)])},l=[],n=t(4471),o={name:"Add",data(){const e=(e,r,t)=>{r||t(new Error("Please enter the age")),/^[0-9]*$/.test(r)||t(new Error("Please enter a numerical value")),(parseInt(r)>130||parseInt(r)<=0)&&t(new Error("Please enter a reasonable value")),t()},r=(e,r,t)=>{r||t(new Error("Please enter the email address")),/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(r)||t(new Error("Illegal email address")),t()},t=(e,r,t)=>{r||t(new Error("Please enter the phone number")),/^[1,2,3,4,5,6,7,8,9][0-9]{9,10}$/.test(r)||t(new Error("Illegal phone number")),t()};return{form:{gender:"Unknown"},options:[{value:"Male",label:"Male 男"},{value:"Female",label:"Female 女"},{value:"Other",label:"Other 其他"},{value:"Unknown",label:"Prefer not disclose 未知"}],rules:{minit:[{required:!1}],fname:[{required:!0,message:"Please enter the first name",trigger:"blur"}],lname:[{required:!0,message:"Please enter the last name",trigger:"blur"}],username:[{required:!0,message:"Please enter the username",trigger:"blur"}],province:[{required:!0,message:"Please enter the province/state",trigger:"blur"}],city:[{required:!0,message:"Please enter the city",trigger:"blur"}],street:[{required:!0,message:"Please enter the street address",trigger:"blur"}],age:[{required:!0,validator:e,trigger:"blur"}],email:[{required:!0,validator:r,trigger:"blur"}],phone:[{required:!0,validator:t,trigger:"blur"}]}}},methods:{save(){this.$refs["ruleForm"].validate((e=>{e&&n.Z.post("user/save",this.form).then((e=>{"200"===e.code?(this.$notify.success("Submitted"),this.$refs["ruleForm"].resetFields()):this.$notify.error(e.msg)}))}))}}},i=o,s=t(1001),m=(0,s.Z)(i,a,l,!1,null,"95c29888",null),p=m.exports}}]);
//# sourceMappingURL=677.572d82a6.js.map