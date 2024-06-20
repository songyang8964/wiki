<template>
  <a-layout-header class="header">
    <div class="logo">
      <img alt="song Wiki" src="../assets/song-wiki.png">
    </div>
    <a-menu
        theme="dark"
        mode="horizontal"
        :style="{ lineHeight: '64px' }"
    >
      <a-menu-item key="/">
        <router-link to="/">Home</router-link>
      </a-menu-item>
      <a-menu-item key="/admin/user" :style="currUser.id? {} : {display:'none'}">
        <router-link to="/admin/user">User </router-link>
      </a-menu-item>
      <a-menu-item key="/admin/ebook" :style="currUser.id? {} : {display:'none'}">
        <router-link to="/admin/ebook">Ebook</router-link>
      </a-menu-item>
      <a-menu-item key="/admin/category" :style="currUser.id? {} : {display:'none'}">
        <router-link to="/admin/category">Category</router-link>
      </a-menu-item>
      <a-menu-item key="/about">
        <router-link to="/about">About me</router-link>
      </a-menu-item>
      <a-popconfirm
          title="Are you sure to logout?"
          ok-text="Yes"
          cancel-text="No"
          @confirm="logout()"
      >
        <a class="login-menu" v-show="currUser.id">
          <span>Logout</span>
        </a>
      </a-popconfirm>
      <a class="login-menu" v-show="currUser.name">
        <span>Hello，{{currUser.name}}</span>
      </a>
      <a class="login-menu" v-show="!currUser.name" @click="showLoginModal">
        <span>Login</span>
      </a>
    </a-menu>

    <a-modal
        title="Login"
        v-model:visible="loginModalVisible"
        :confirm-loading="loginModalLoading"
        @ok="login"
    >
      <a-form :model="loginUser" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
        <a-form-item label="loginName">
          <a-input v-model:value="loginUser.loginName" />
        </a-form-item>
        <a-form-item label="password">
          <a-input v-model:value="loginUser.password" type="password" />
        </a-form-item>
      </a-form>
    </a-modal>
  </a-layout-header>
</template>

<script lang="ts">
import {computed, defineComponent, ref} from "vue";
import axios from 'axios';
import { message } from 'ant-design-vue';
import store from "@/store";

declare let hexMd5: any;
declare let KEY: any;

export default defineComponent({
  name: 'the-header',
  setup () {
    // 登录后保存
    const currUser = computed(() => store.state.localUser);

    // 用来登录
    const loginUser = ref({
      loginName: "test",
      password: "test"
    });
    const loginModalVisible = ref(false);
    const loginModalLoading = ref(false);
    const showLoginModal = () => {
      loginModalVisible.value = true;
    };

    // 登录
    const login = () => {
      console.log("Start logging in");
      loginModalLoading.value = true;
      loginUser.value.password = hexMd5(loginUser.value.password + KEY);
      axios.post('/user/login', loginUser.value).then((response) => {
        loginModalLoading.value = false;
        const respData = response.data;
        if (respData.code === 0) {
          loginModalVisible.value = false;
          store.commit("setLocalUser", respData.data);
          message.success(" Login successful！");
        } else {
          message.error(respData.msg);
        }
      });
    };

    // 退出登录
    const logout = () => {
      console.log("Start logging out");
      axios.get('/user/logout/' + currUser.value.token).then((response) => {
        const respData = response.data;
        if (respData.code === 0) {
          message.success("Logout successful！");
          store.commit("setLocalUser", {});
        } else {
          message.error(respData.msg);
        }
      });
    };

    return {
      loginModalVisible,
      loginModalLoading,
      showLoginModal,
      loginUser,
      login,
      logout,

      currUser,
    }
  }
})

</script>

<style>
.logo {
  width: 120px;
  height: 31px;
  /*background: rgba(255, 255, 255, 0.2);*/
  /*margin: 16px 28px 16px 0;*/
  float: left;
  color: white;
  font-size: 18px;
}

.login-menu {
  float: right;
  color: white;
  padding-left: 10px;
}
</style>
