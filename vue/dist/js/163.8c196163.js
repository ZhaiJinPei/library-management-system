"use strict";(self["webpackChunkvue"]=self["webpackChunkvue"]||[]).push([[163],{3163:function(t,e,a){a.r(e),a.d(e,{default:function(){return m}});var r=function(){var t=this,e=t._self._c;return e("div",{staticStyle:{padding:"10px"}},[e("div",{staticStyle:{width:"98%","margin-left":"3px","padding-top":"5px",height:"20px","font-family":"'roboto mono', monospace",background:"#ffffff","border-radius":"5px"}},[e("el-breadcrumb",{attrs:{"separator-class":"el-icon-arrow-right"}},[e("el-breadcrumb-item",[t._v(" "),e("em",[e("strong",[t._v("Book Borrow 图书借阅")])])]),e("el-breadcrumb-item",[t._v(" "),e("em",[e("strong",[t._v("Borrow Records 借阅记录")])])])],1)],1),e("div",{staticStyle:{"margin-bottom":"10px","margin-top":"10px"}},[e("el-input",{staticStyle:{width:"200px","margin-left":"2px"},attrs:{placeholder:"Enter username"},model:{value:t.params.username,callback:function(e){t.$set(t.params,"username",e)},expression:"params.username"}}),e("el-input",{staticStyle:{width:"200px","margin-left":"2px"},attrs:{placeholder:"Enter book's name"},model:{value:t.params.name,callback:function(e){t.$set(t.params,"name",e)},expression:"params.name"}}),e("el-input",{staticStyle:{width:"200px","margin-left":"2px"},attrs:{placeholder:"Enter book's isbn"},model:{value:t.params.isbn,callback:function(e){t.$set(t.params,"isbn",e)},expression:"params.isbn"}}),e("el-button",{staticStyle:{"margin-left":"3px",height:"40px"},attrs:{icon:"el-icon-search",type:"primary"},on:{click:t.load}},[t._v("Search ")]),e("el-button",{staticStyle:{"margin-left":"3px",height:"40px"},attrs:{icon:"el-icon-refresh-right",type:"warning"},on:{click:t.reset}},[t._v(" Reset ")])],1),e("div",{staticStyle:{"margin-left":"3px",width:"98%"}},[e("el-table",{staticStyle:{width:"100%","font-size":"20px","font-family":"'roboto mono', monospace"},attrs:{data:t.tableData,stripe:""}},[e("el-table-column",{attrs:{label:"User ID",prop:"uid","show-overflow-tooltip":"",width:"250"}}),e("el-table-column",{attrs:{label:"Username",prop:"username","show-overflow-tooltip":"",width:"200"}}),e("el-table-column",{attrs:{label:"Phone",prop:"phone",width:"200"}}),e("el-table-column",{attrs:{label:"Book Name",prop:"name","show-overflow-tooltip":"",width:"400"}}),e("el-table-column",{attrs:{label:"ISBN",prop:"isbn",width:"200"}}),e("el-table-column",{attrs:{label:"Status",prop:"bstatus",width:"190"}}),e("el-table-column",{attrs:{formatter:t.createDateFormat,label:"Borrow Date",prop:"cdate",width:"200"}}),e("el-table-column",{attrs:{label:"Days",prop:"duration",width:"70"}}),e("el-table-column",{attrs:{formatter:t.dueDateFormat,label:"Due Date",prop:"rdate",width:"200"}}),e("el-table-column",{attrs:{label:"Notification",prop:"notification",width:"160"},scopedSlots:t._u([{key:"default",fn:function(a){return["past due"===a.row.notification?e("el-tag",{attrs:{type:"danger"}},[t._v(" "+t._s(a.row.notification)+" ")]):t._e(),"almost due"===a.row.notification?e("el-tag",{attrs:{type:"primary"}},[t._v(" "+t._s(a.row.notification)+" ")]):t._e(),"at the due date"===a.row.notification?e("el-tag",{attrs:{type:"warning"}},[t._v(" "+t._s(a.row.notification)+" ")]):t._e(),"before due"===a.row.notification?e("el-tag",{attrs:{type:"success"}},[t._v(" "+t._s(a.row.notification)+" ")]):t._e()]}}])}),e("el-table-column",{attrs:{fixed:"right",label:"Management",width:"130"},scopedSlots:t._u([{key:"default",fn:function(a){return["Borrowed"===a.row.bstatus?e("el-button",{staticStyle:{"margin-left":"2px"},attrs:{type:"primary"},on:{click:function(e){return t.bookReturn(a.row)}}},[t._v(" Return ")]):t._e()]}}])}),e("el-table-column",{attrs:{fixed:"right",label:"Operation",width:"150"},scopedSlots:t._u([{key:"default",fn:function(a){return[e("el-popconfirm",{attrs:{"confirm-button-text":"Yes","cancel-button-text":"No",title:"Are you sure you want to delete this row of data？"},on:{confirm:function(e){return t.del(a.row)}}},[e("el-button",{staticStyle:{"margin-left":"2px"},attrs:{slot:"reference",type:"danger"},slot:"reference"},[t._v("Delete")])],1)]}}])})],1),e("el-pagination",{staticStyle:{"margin-top":"5px"},attrs:{background:"","current-page":t.params.pageNum,"page-size":t.params.pageSize,layout:"prev, pager, next",total:t.total},on:{"current-change":t.changePageNum}})],1)])},o=[],n=a(4471),l=a(6797),i=a.n(l),s={name:"List",data(){return{tableData:[],total:0,params:{pageNum:1,pageSize:10,username:"",isbn:"",name:""}}},created(){this.load()},methods:{load(){n.Z.get("borrow/page",{params:this.params}).then((t=>{"200"===t.code&&(this.tableData=t.data.list,this.total=t.data.total)}))},del(t){const e=t.email,a=t.isbn,r=t.id;n.Z.delete("borrow/delete/"+e+"&"+a+"&"+r).then((t=>{"200"===t.code?(this.$notify.success("Deleted"),this.load()):this.$notify.error(t.msg)}))},reset(){this.params={pageNum:1,pageSize:10,email:"",isbn:""},this.value="",this.load()},changePageNum(t){this.params.pageNum=t,this.load()},bookReturn(t){n.Z.post("/retern/save",t).then((t=>{"200"===t.code?(this.$notify.success("Book returned"),location.reload()):this.$notify.error(t.msg)}))},createDateFormat(t){return i()(t.cdate).format("YYYY-MM-DD")},dueDateFormat(t){return i()(t.rdate).format("YYYY-MM-DD")}}},p=s,c=a(1001),u=(0,c.Z)(p,r,o,!1,null,"1bfc2ef1",null),m=u.exports}}]);
//# sourceMappingURL=163.8c196163.js.map