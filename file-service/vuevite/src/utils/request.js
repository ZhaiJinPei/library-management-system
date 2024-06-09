// [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
//
// This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
//
// Copyright (c) 2024-present, Zhai JinPei
import axios from 'axios'

// 创建 axios 实例
const service = axios.create({
    baseURL: "/api", // 环境的不同，对应不同的baseURL
    // transformRequest: [function(data) {
    //   return Qs.stringify(data)
    // }],
    //timeout: 5000 // 请求超时时间
})


//request请求拦截
service.interceptors.request.use(
    config => {
        // var token=getToken()
        // if (token) {
        //     config.headers.token = token // 让每个请求携带自定义token 请根据实际情况自行修改
        //   }
        return config;
    },
    error => {
        // do something with request error
        return Promise.reject(error)
    }
)


//响应拦截
service.interceptors.response.use(
    response => {
        const res = response
        return res
    },
    error => {

        //这里还可以根据实际情况增加一些功能
        return Promise.reject(error)
    }
)

export default service
