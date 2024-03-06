import './assets/main.css'

import {createApp} from 'vue'
import {createPinia} from 'pinia'
import antd from 'ant-design-vue'
import 'ant-design-vue/dist/reset.css'
// @ts-ignore
import App from './App.vue'
import router from './router'

createApp(App)
  .use(router)
  .use(createPinia())
  .use(antd)
  .mount('#app')

