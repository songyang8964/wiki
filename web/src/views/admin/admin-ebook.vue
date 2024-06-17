<template>
  <a-layout>
    <a-layout-content
        :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }"
    >
      <p>
        <a-form layout="inline" :model="param">
          <a-form-item>
            <a-input v-model:value="param.name" placeholder="name">
            </a-input>
          </a-form-item>
          <a-form-item>
            <a-button type="primary" @click="handleQuery({page: 1, size: pagination.pageSize})">
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
          :data-source="ebooks"
          :pagination="pagination"
          :loading="loading"
          @change="handleTableChange"
      >
        <template #cover="{ text: cover }">
          <img v-if="cover" :src="cover" alt="avatar" class="icon-img"/>
        </template>
        <template v-slot:category="{record }">
          <span>{{ getCategoryName(record.category1Id) }} / {{getCategoryName (record.category2Id) }}</span>
        </template>
        <template v-slot:action="{ record }">
          <a-space size="small">
            <router-link :to="'/admin/doc?ebookId=' + record.id">
              <a-button type="primary" @click="edit">
                文档管理
              </a-button>
            </router-link>
            <a-button type="primary" @click="edit(record)">
              编辑
            </a-button>
            <a-popconfirm
                title="删除后不可恢复，确认删除?"
                ok-text="是"
                cancel-text="否"
                @confirm="handleDelete(record.id)"
            >
              <a-button type="danger" @click="handleDelete(record.id)">
                删除
              </a-button>
            </a-popconfirm>
          </a-space>
        </template>
      </a-table>
    </a-layout-content>
  </a-layout>
  <a-modal
      title="电子书表单"
      v-model:visible="modalVisible"
      :confirm-loading="modalLoading"
      @ok="handleModalOk"
  >
    <a-form :model="ebook" :label-col="{ span: 6 }">
      <a-form-item label="封面">
        <a-input v-model:value="ebook.cover"/>
      </a-form-item>
      <a-form-item label="名称">
        <a-input v-model:value="ebook.name"/>
      </a-form-item>
      <a-form-item label="分类">
        <a-cascader
            v-model:value="categoryIds"
            :field-names="{ label: 'name', value: 'id', children: 'children' }"
            :options="level1"
        />
      </a-form-item>
      <a-form-item label="描述">
        <a-input v-model:value="ebook.description" type="textarea"/>
      </a-form-item>
    </a-form>
  </a-modal>
</template>

<script lang="ts">
import {message} from "ant-design-vue";
import {defineComponent, ref, onMounted} from 'vue';
import axios from 'axios';
import {Tool} from "@/util/tool";

export default defineComponent({
  name: 'AdminEbook',
  setup() {
    const param = ref();
    // initialize param
    param.value = {};
    const ebooks = ref([]);
    const pagination = ref({
      current: 1, // 当前页
      pageSize: 4, // 每页显示的条数
      total: 0 // 总条数
    });
    const loading = ref(false); // 加载状态

    // 定义表格列
    const columns = [
      {title: '封面', dataIndex: 'cover', slots: {customRender: 'cover'}},
      {title: '名称', dataIndex: 'name'},
      // {title: '分类1', dataIndex: 'category1Id'},
      // {title: '分类2', dataIndex: 'category2Id'},
      {title: '分类', slots: {customRender: 'category'}},
      {title: '文档数', dataIndex: 'docCount'},
      {title: '阅读数', dataIndex: 'viewCount'},
      {title: '点赞数', dataIndex: 'voteCount'},
      {title: 'Action', dataIndex: 'action', slots: {customRender: 'action'}}
    ];

    // 查询电子书数据
    const handleQuery = (params: any) => {
      loading.value = true;
      axios.get('/ebook/list', {
        params: {
          page: params.page,
          size: params.size,
          name: param.value.name
        }
      }).then((response) => {
            loading.value = false; // 关闭加载状态
            const data = response.data;
            if (data.success) {
              ebooks.value = data.content.list; // 更新电子书数据
              pagination.value.current = params.page; // 更新当前页
              pagination.value.total = data.content.total; // 更新总条数
            } else {
              message.error(data.message);
            }
          }
      );
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
      handleQueryCategory();
      handleQuery({
        page: pagination.value.current,
        size: pagination.value.pageSize
      });
    });
    // form
    let categorys: any;
    const categoryIds = ref();
    const ebook = ref();
    const modalVisible = ref(false);
    const modalLoading = ref(false);
    const handleModalOk = () => {
      modalLoading.value = true;
      ebook.value.category1Id = categoryIds.value[0];
      ebook.value.category2Id = categoryIds.value[1];
      axios.post('/ebook/save', ebook.value).then((response) => {
        modalLoading.value = false;
        const data = response.data;
        if (data.success) {
          modalVisible.value = false;
          // reload data
          handleQuery({
            page: pagination.value.current,
            size: pagination.value.pageSize
          });
        } else {
          // 在else里弹出提示
          message.error(data.message);
        }
      });
    };


    /**
     * 编辑
     */
    const edit = (record: any) => {
      modalVisible.value = true; // 打开模态框
      ebook.value = Tool.copy(record); // 深拷贝
      // ebook.value = record;
      categoryIds.value = [ebook.value.category1Id, ebook.value.category2Id]
    };

    // add
    const add = () => {
      modalVisible.value = true;
      ebook.value = {};
    };

    const handleDelete = (id: number) => {
      axios.delete('/ebook/delete/' + id).then((response) => {
        const data = response.data;
        if (data.success) {
          handleQuery({
            page: pagination.value.current,
            size: pagination.value.pageSize
          });
        }
      });
    }

    const level1 = ref();
    const handleQueryCategory = () => {
      loading.value = true;
      axios.get('/category/all').then((response) => {
            loading.value = false; // 关闭加载状态
            const data = response.data;
            if (data.success) {
              categorys = data.content; // 更新电子书数据
              console.log("native arrays：", categorys);
              level1.value = [];
              level1.value = Tool.array2Tree(categorys, 0);
              console.log("tree structure：", level1.value);
              handleQuery({
                page: 1,
                size: pagination.value.pageSize
              });
            } else {
              message.error(data.message);
            }
          }
      );
    };

    const getCategoryName = (cid: number) => {
      let result = '';
      categorys.forEach((item: any) => {
        if (item.id === cid) {
          result = item.name;
        }
      })
      return result;
    };

    return {
      param,
      // table class
      ebooks,
      pagination,
      columns,
      loading,
      handleTableChange,
      categoryIds,
      level1,

      //data operation class
      edit,
      add,
      handleDelete,
      handleQuery,
      getCategoryName,


      // form class
      ebook,
      modalVisible,
      modalLoading,
      handleModalOk
    };
  },
});
</script>

<style scoped>
.icon-img {
  width: 50px;
  height: 50px;
  object-fit: cover; /* 确保图像按比例缩放 */
}
</style>