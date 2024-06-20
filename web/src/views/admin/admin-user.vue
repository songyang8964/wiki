<template>
  <a-layout>
    <a-layout-content
      :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }"
    >
      <p>
        <a-form layout="inline" :model="param">
          <a-form-item>
            <a-input v-model:value="param.loginName" placeholder="login name">
            </a-input>
          </a-form-item>
          <a-form-item>
            <a-button type="primary" @click="handleQueryUser({pageNum: 1, pageSize: pagination.pageSize})">
              query
            </a-button>
          </a-form-item>
          <a-form-item>
            <a-button type="primary" @click="add()">
              add
            </a-button>
          </a-form-item>
        </a-form>
      </p>
      <a-table
        :columns="columns"
        :row-key="record => record.id"
        :data-source="users"
        :pagination="pagination"
        :loading="loading"
        @change="handleTableChange"
      >
        <template v-slot:action="{ text, record }">
          <a-space size="small">
            <a-button type="primary" @click="resetPwd(record)">
              reset password
            </a-button>
            <a-button type="primary" @click="edit(record)">
              edit
            </a-button>
            <a-popconfirm
              title="confirm deletion?"
              ok-text="Yes"
              cancel-text="No"
              @confirm="handleDeleteUser(record.id)"
            >
              <a-button type="danger">
                delete
              </a-button>
            </a-popconfirm>
          </a-space>
        </template>
      </a-table>
    </a-layout-content>
  </a-layout>

  <a-modal
    title="user form"
    v-model:visible="modalVisible"
    :confirm-loading="modalLoading"
    @ok="handleModalOk"
  >
    <a-form :model="user" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
      <a-form-item label="Login Name">
        <a-input v-model:value="user.loginName" :disabled="!!user.id"/>
      </a-form-item>
      <a-form-item label="NickName">
        <a-input v-model:value="user.name" />
      </a-form-item>
      <a-form-item label="password" v-show="!user.id">
        <a-input v-model:value="user.password" />
      </a-form-item>
    </a-form>
  </a-modal>

  <a-modal
      title="reset password"
      v-model:visible="resetModalVisible"
      :confirm-loading="resetModalLoading"
      @ok="handleResetModalOk"
  >
    <a-form :model="user" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
      <a-form-item label="new password">
        <a-input v-model:value="user.password"/>
      </a-form-item>
    </a-form>
  </a-modal>
</template>

<script lang="ts">
  import { defineComponent, onMounted, ref } from 'vue';
  import axios from 'axios';
  import { message } from 'ant-design-vue';
  import {Tool} from "@/util/tool";

  declare let hexMd5: any;
  declare let KEY: any;

  export default defineComponent({
    name: 'AdminUser',
    setup() {
      const param = ref();
      param.value = {};
      const users = ref();
      const pagination = ref({
        current: 1,
        pageSize: 10,
        total: 0
      });
      const loading = ref(false);

      const columns = [
        {
          title: 'loginName',
          dataIndex: 'loginName'
        },
        {
          title: 'name',
          dataIndex: 'name'
        },
        {
          title: 'password',
          dataIndex: 'password'
        },
        {
          title: 'Action',
          key: 'action',
          slots: { customRender: 'action' }
        }
      ];

      /**
       * 数据query
       **/
      const handleQueryUser = (queryParams: any) => {
        loading.value = true;
        // 如果不清空现有数据，则edit保存重新加载数据后，再点edit，则列表显示的还是edit前的数据
        users.value = [];
        axios.get("/user/list", {
          params: {
            pageNum: queryParams.pageNum,
            pageSize: queryParams.pageSize,
            loginName: param.value.loginName
          }
        }).then((response) => {
          loading.value = false;
          const respData = response.data;
          if (respData.code === 0) {
            users.value = respData.data.list;

            // 重置分页按钮
            pagination.value.current = queryParams.pageNum;
            pagination.value.total = respData.data.total;
          } else {
            message.error(respData.msg);
          }
        });
      };

      /**
       * 表格点击页码时触发
       */
      const handleTableChange = (pagination: any) => {
        console.log("看看自带的分页参数都有啥：" + pagination);
        handleQueryUser({
          pageNum: pagination.current,
          pageSize: pagination.pageSize
        });
      };

      // -------- 表单 ---------
      const user = ref();
      const modalVisible = ref(false);
      const modalLoading = ref(false);
      const handleModalOk = () => {
        user.value.password = hexMd5(user.value.password + KEY);  // 对密码进行 md5 哈希
        modalLoading.value = true;
        axios.post("/user/save", user.value).then((response) => {
          modalLoading.value = false;
          const respData = response.data; // data = commonResp
          if (respData.code === 0) {
            modalVisible.value = false;

            // 重新加载列表
            handleQueryUser({
              pageNum: pagination.value.current,
              pageSize: pagination.value.pageSize,
            });
          } else {
            message.error(respData.msg);
          }
        });
      };

      /**
       * edit
       */
      const edit = (record: any) => {
        modalVisible.value = true;
        user.value = Tool.copy(record);
      };

      /**
       * add
       */
      const add = () => {
        modalVisible.value = true;
        user.value = {};
      };

      const handleDeleteUser = (id: number) => {
        axios.delete("/user/delete/" + id).then((response) => {
          const respData = response.data; // data = commonResp
          if (respData.code === 0) {
            // 重新加载列表
            handleQueryUser({
              pageNum: pagination.value.current,
              pageSize: pagination.value.pageSize,
            });
          }
        });
      };

      // -------- 重置密码 ---------
      const resetModalVisible = ref(false);
      const resetModalLoading = ref(false);
      const handleResetModalOk = () => {
        resetModalLoading.value = true;

        user.value.password = hexMd5(user.value.password + KEY);  // 在前端进行哈希

        axios.post("/user/reset-pwd", user.value).then((response) => {
          resetModalLoading.value = false;
          const respData = response.data; // data = commonResp
          if (respData.code === 0) {
            resetModalVisible.value = false;

            // 重新加载列表
            handleQueryUser({
              pageNum: pagination.value.current,
              pageSize: pagination.value.pageSize,
            });
          } else {
            message.error(respData.msg);
          }
        });
      };

      /**
       * 重置密码
       */
      const resetPwd = (record: any) => {
        resetModalVisible.value = true;
        user.value = Tool.copy(record);
        user.value.password = null;
      };

      onMounted(() => {
        handleQueryUser({
          pageNum: 1,
          pageSize: pagination.value.pageSize,
        });
      });

      return {
        param,
        users,
        pagination,
        columns,
        loading,
        handleTableChange,
        handleQueryUser,

        edit,
        add,

        user,
        modalVisible,
        modalLoading,
        handleModalOk,

        handleDeleteUser,

        resetModalVisible,
        resetModalLoading,
        handleResetModalOk,
        resetPwd,
      }
    }
  });
</script>

<style scoped>
  img {
    width: 50px;
    height: 50px;
  }
</style>
