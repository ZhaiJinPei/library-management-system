// [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
//
// This project is licensed under the Apache-2.0 license - see the LICENSE file for details.
//
// Copyright (c) 2024-present, Zhai JinPei
import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import router from './router'
import '@/assets/global.css'
import locale from '../node_modules/element-ui/lib/locale/lang/en'
import VueViewer, {directive as viewerDirective} from "v-viewer";
import 'viewerjs/dist/viewer.css'
import FileViewer from "@flyfish-group/file-viewer";


Vue.use(FileViewer)

Vue.config.productionTip = false
Vue.use(ElementUI, { locale });
Vue.use(VueViewer)

Vue.directive('viewer', viewerDirective({
  debug: true
}));

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
