<template>
  <a-layout-footer style="text-align: center">
    <p v-if="currUser.name">Welcome, {{currUser.name}}</p>
    --- song Wiki ---
  </a-layout-footer>
</template>

<script lang="ts">
import {computed, defineComponent, onMounted} from "vue";
import store from "@/store";
import { Tool } from "@/util/tool";
import { notification } from 'ant-design-vue';


export default defineComponent({
  name: 'the-footer',
  setup() {
    const currUser = computed(() => store.state.localUser);

    let websocket: any;
    let token: any;
    const onOpen = () => {
      console.log('WebSocket connection successful, status code：', websocket.readyState)
    };
    const onMessage = (event: any) => {
      console.log('WebSocket receives the message:', event.data);
      notification['info']({
        message: '收到消息',
        description: event.data,
      });
    };
    const onError = () => {
      console.log('WebSocket connection error, status code：', websocket.readyState)
    };
    const onClose = () => {
      console.log('WebSocket connection closed, status code:', websocket.readyState)
    };
    const initWebSocket = () => {
      // 连接成功
      websocket.onopen = onOpen;
      // 收到消息的回调
      websocket.onmessage = onMessage;
      // 连接错误
      websocket.onerror = onError;
      // 连接关闭的回调
      websocket.onclose = onClose;
    };

    onMounted(() => {
      // WebSocket
      if ('WebSocket' in window) {
        token = Tool.uuid(10);
        // 连接地址：ws://127.0.0.1:8880/ws/xxx
        websocket = new WebSocket(process.env.VUE_APP_WS_SERVER + '/ws/' + token);
        initWebSocket()

        // 关闭
        // websocket.close();
      } else {
        alert(' Your browser does not support WebSocket!')
      }
    });

    return {
      currUser
    }
  }
})

</script>

<style scoped>

</style>