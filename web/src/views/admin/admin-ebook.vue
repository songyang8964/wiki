<template>
  <a-layout>
    <a-layout-content
        :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }"
    >
      <a-table
          :columns="columns"
          :data-source="ebooks"
          :pagination="pagination"
          :row-key="record => record.id"
          :loading="loading"
          @change="handleTableChange"
          >
<!--          :row-key="record => record.id"-->
<!--          :loading="loading"-->
<!--          @change="handleTableChange"-->
        <template #cover="{ text: cover }">
          <img v-if="cover" :src="cover" alt="avatar"/>
        </template>
        <template #action="">
          <a-space size="small">
            <a-button type="primary">
              edit
            </a-button>
            <!-- 删除按钮，暂时没有启用确认弹窗 -->
            <a-button type="danger">
              delete
            </a-button>
          </a-space>
        </template>
      </a-table>

      <div>
        <h1>This is ebook management page</h1>
      </div>
    </a-layout-content>
  </a-layout>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue';
import axios from 'axios';

export default defineComponent({
  name: 'AdminEbook',
  setup() {
    const ebooks = ref([]);
    const pagination = ref({
      current: 1, // 当前页
      pageSize: 4, // 每页显示的条数
      total: 0 // 总条数
    });
    const loading = ref(false); // 加载状态

    // 定义表格列
    const columns = [
      { title: '封面', dataIndex: 'cover', slots: { customRender: 'cover' } },
      { title: '名称', dataIndex: 'name' },
      { title: '分类', dataIndex: 'category' },
      { title: '文档数', dataIndex: 'docCount' },
      { title: '阅读数', dataIndex: 'viewCount' },
      { title: '点赞数', dataIndex: 'voteCount' },
      { title: 'Action', dataIndex: 'action', slots: { customRender: 'action' } }
    ];

    // 查询电子书数据
    const handleQuery = (params: any) => {
      loading.value = true;
      axios.get('/ebook/list', { params }).then((response) => {
        loading.value = false; // 关闭加载状态
        const data = response.data;
        ebooks.value = data.content.list; // 更新电子书数据
        pagination.value.current = params.page; // 更新当前页
        pagination.value.total = data.content.total; // 更新总条数

      });
    };

    // 处理表格分页、排序、筛选等变化
    const handleTableChange = (pagination: any) => {
      console.log("pagination parameter", pagination);
      handleQuery({
        page: pagination.current,
        size: pagination.pageSize
      });
    };

    // 组件挂载后进行首次数据查询
    onMounted(() => {
      handleQuery({
        page: pagination.value.current,
        size: pagination.value.pageSize
      });
    });

    return {
      ebooks,
      columns,
      pagination,
      loading,
      handleTableChange
    };
  },
});
</script>
