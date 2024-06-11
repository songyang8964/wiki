<template>
  <div class="home">
    <a-layout>
      <a-layout-sider width="200" style="background: #fff">
        <a-menu
            v-model:selectedKeys="selectedKeys2"
            v-model:openKeys="openKeys"
            mode="inline"
            style="height: 100%"
        >
          <a-sub-menu key="sub1">
            <template #title>
              <span>
                <user-outlined/>
                subnav 1
              </span>
            </template>
            <a-menu-item key="1">option11111</a-menu-item>
            <a-menu-item key="2">option2</a-menu-item>
            <a-menu-item key="3">option3</a-menu-item>
            <a-menu-item key="4">option4</a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="sub2">
            <template #title>
              <span>
                <laptop-outlined/>
                subnav 2
              </span>
            </template>
            <a-menu-item key="5">option5</a-menu-item>
            <a-menu-item key="6">option6</a-menu-item>
            <a-menu-item key="7">option7</a-menu-item>
            <a-menu-item key="8">option8</a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="sub3">
            <template #title>
              <span>
                <notification-outlined/>
                subnav 1111111111
              </span>
            </template>
            <a-menu-item key="9">option9</a-menu-item>
            <a-menu-item key="10">option10</a-menu-item>
            <a-menu-item key="11">option11</a-menu-item>
            <a-menu-item key="12">option12</a-menu-item>
          </a-sub-menu>
        </a-menu>
      </a-layout-sider>
      <a-layout-content :style="{ padding: '0 24px', minHeight: '280px' }">
        <pre>
          {{ ebooks }}
        </pre>
      </a-layout-content>
    </a-layout>
  </div>
</template>

<script lang="ts" setup>
import {ref} from 'vue';
import {UserOutlined, LaptopOutlined, NotificationOutlined} from '@ant-design/icons-vue';
import {defineComponent} from 'vue';
import axios from 'axios';


//后端的电子书列表不断更新的,这里前端需要用响应式的数据(ref)
// ref对应的赋值是.value


export default defineComponent({
  name: 'Home',
  serup() {
    console.log('setup');
    const ebooks = ref();
    onMounted(() => {
      console.log('onMounted');
      axios.get("GET http://localhost:8080/ebook/list?name=Spring").then((response) => {
        const data = response.data;
        ebboks.value = data.content;
        console.log(response);
      });
    });
    return {
      ebooks,
    };
  },
});

</script>
