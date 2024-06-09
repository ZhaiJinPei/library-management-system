// [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
//
// This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
//
// Copyright (c) 2024-present, Zhai JinPei
const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    historyApiFallback: true,
    allowedHosts: "all"
  }
})
