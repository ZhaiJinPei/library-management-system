// [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
//
// This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
//
// Copyright (c) 2024-present, Zhai JinPei
import axios from 'axios';

const request = axios.create({
    baseURL: 'http://10.20.245.160:9090',
    timeout: 5000
})

request.interceptors.request.use(
    config => {
    config.headers['Content-Type'] = 'application/json;charset=utf-8';
    return config
    },
    error => {
    return Promise.reject(error)
});

request.interceptors.response.use(
    // config => {
    //     config.headers['X-Frame-Options'] = 'SAMEORIGIN'
    //     return config
    // },
    response => {
        let res = response.data;
        if (typeof res === 'string') {
            res = res ? JSON.parse(res) : res
        }
        return res

    },
    error => {
        console.log('err' + error) // for debug
        return Promise.reject(error)
    }
)


export default request
