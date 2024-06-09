// [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
//
// This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
//
// Copyright (c) 2024-present, Zhai JinPei
import {createApp} from 'vue'
import './style.css'
import App from './App.vue'
import * as ElIcons from '@element-plus/icons'
import VueParticles from 'vue-particles'
//使用ElementPlus
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css'

const app = createApp(App)


// 引入粒子特效

app.use(VueParticles)
for (const name in ElIcons) {
    app.component(name, ElIcons)
}


app.use(ElementPlus)

app.mount('#app')
