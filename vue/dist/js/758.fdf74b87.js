"use strict";(self["webpackChunkvue"]=self["webpackChunkvue"]||[]).push([[758],{6726:function(e,t,r){r.r(t),r.d(t,{default:function(){return u}});var a=function(){var e=this,t=e._self._c;return t("div",{staticStyle:{padding:"10px"}},[t("div",{staticStyle:{width:"99%","margin-left":"5px","padding-top":"5px",height:"20px","font-family":"'roboto mono', monospace",background:"#ffffff","border-radius":"5px"}},[t("el-breadcrumb",{attrs:{"separator-class":"el-icon-arrow-right"}},[t("el-breadcrumb-item",[e._v(" "),t("em",[t("strong",[e._v("Books 图书")])])]),t("el-breadcrumb-item",[e._v(" "),t("em",[t("strong",[e._v("New Buy Record 新增购买记录")])])])],1)],1),t("div",{staticStyle:{"font-size":"50px","font-family":"'roboto mono', monospace","margin-top":"50px","margin-bottom":"50px","margin-left":"50px"}},[e._v(" Add New Buy Record 新增购买记录 ")]),t("div",{staticStyle:{width:"30%",transform:"scale(2,2)","margin-left":"500px","margin-top":"250px"}},[t("el-form",{ref:"ruleForm",attrs:{inline:!0,model:e.form,rules:e.rules}},[t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"ISBN 国际标准书号: ",prop:"isbn"}},[t("el-select",{attrs:{clearable:"",filterable:"",placeholder:"Please select ISBN"},on:{change:e.selectBook},model:{value:e.form.isbn,callback:function(t){e.$set(e.form,"isbn",t)},expression:"form.isbn"}},e._l(e.books,(function(e){return t("el-option",{key:e.isbn,attrs:{label:e.isbn,value:e.isbn}})})),1)],1),t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Book Name 书名: ",prop:"name"}},[t("el-input",{attrs:{placeholder:"Enter book's name",disabled:""},model:{value:e.form.name,callback:function(t){e.$set(e.form,"name",t)},expression:"form.name"}})],1),t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"User ID: ",prop:"uid"}},[t("el-select",{attrs:{clearable:"",filterable:"",placeholder:"Please select an user ID"},on:{change:e.selectUser},model:{value:e.form.email,callback:function(t){e.$set(e.form,"email",t)},expression:"form.email"}},e._l(e.users,(function(e){return t("el-option",{key:e.email,attrs:{label:e.uid,value:e.email}})})),1)],1),t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Username 用户名: ",prop:"username"}},[t("el-input",{attrs:{placeholder:"Enter username",disabled:""},model:{value:e.form.username,callback:function(t){e.$set(e.form,"username",t)},expression:"form.username"}})],1),t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Buy Number 购买数量: ",prop:"duration"}},[[t("el-input-number",{attrs:{min:1,max:1e4},on:{change:e.handleChange},model:{value:e.form.count,callback:function(t){e.$set(e.form,"count",t)},expression:"form.count"}})]],2),t("el-form-item",{staticStyle:{"margin-left":"2px"},attrs:{label:"Unit Price 单件价格: ",prop:"duration"}},[[t("el-input-number",{attrs:{min:1,max:1e4},on:{change:e.handleChange},model:{value:e.form.price,callback:function(t){e.$set(e.form,"price",t)},expression:"form.price"}})]],2)],1),t("div",{staticStyle:{"text-align":"center"}},[t("el-button",{staticStyle:{"margin-left":"2px",height:"40px","min-width":"100px"},attrs:{type:"primary"},on:{click:e.save}},[e._v("Submit")])],1)],1)])},s=[],i=r(4471),o={name:"Add",data(){const e=(e,t,r)=>{t||r(new Error("Please enter the book's ISBN")),/^[0-9]{10}$/.test(t)||r(new Error("Illegal ISBN")),r()};return{form:{count:1,price:1},books:[],users:[],rules:{username:[{required:!0,message:"Please enter the username",trigger:"blur"}],name:[{required:!0,message:"Please enter the book's name",trigger:"blur"}],isbn:[{required:!0,validator:e,trigger:"blur"}]}}},created(){i.Z.get("/book/list").then((e=>{this.books=e.data})),i.Z.get("/user/list").then((e=>{this.users=e.data.filter((e=>e.status))}))},methods:{save(){this.$refs["ruleForm"].validate((e=>{e&&i.Z.post("buy/save",this.form).then((e=>{"200"===e.code?(this.$notify.success("Submitted"),this.$refs["ruleForm"].resetFields(),location.reload()):this.$notify.error(e.msg)}))}))},selectBook(){const e=this.books.find((e=>e.isbn===this.form.isbn));i.Z.get("/book/"+e.isbn).then((e=>{this.form.name=e.data.name,this.form.credit=e.data.credit,this.form.number=e.data.number,this.unitCredit=e.data.credit,this.$forceUpdate()}))},selectUser(){const e=this.users.find((e=>e.email===this.form.email));i.Z.get("/user/"+e.email).then((e=>{this.form.uid=e.data.uid,this.form.phone=e.data.phone,this.form.username=e.data.username,this.form.acredit=e.data.acredit,this.$forceUpdate()}))},handleChange(){this.form.credit=this.form.duration*this.unitCredit}}},l=o,n=r(1001),m=(0,n.Z)(l,a,s,!1,null,"0b397a6e",null),u=m.exports}}]);
//# sourceMappingURL=758.fdf74b87.js.map