import {createApp} from 'vue'
import './style.css'
// @ts-ignore
import App from './App.vue'
import 'ant-design-vue/dist/antd.css'
import antdv from 'ant-design-vue'
import {createPinia} from 'pinia'
import {createRouter,createWebHashHistory} from "vue-router";

createApp(App).use(antdv).use(createPinia()).mount('#app')
