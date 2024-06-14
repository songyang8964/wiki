<template>
  <div class="home">
    <!-- Main layout container -->
    <a-layout>
      <!-- Sidebar layout for navigation menu -->
      <a-layout-sider width="200" style="background: #fff">
        <a-menu
            v-model:selectedKeys="selectedKeys2"
            v-model:openKeys="openKeys"
            mode="inline"
            style="height: 100%"
        >
          <!-- First submenu -->
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
          <!-- Second submenu -->
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
          <!-- Third submenu -->
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
      <!-- Content layout for displaying list items -->
      <a-layout-content :style="{ padding: '0 24px', minHeight: '280px' }">
        <!-- Ant Design Vue list component -->
        <a-list item-layout="vertical" size="large" :grid="{ gutter: 20, column: 3 }" :data-source="ebooks">
          <!-- Footer slot of the list -->
          <template #footer>
            <div>
              <b>ant design vue</b>
              footer part
            </div>
          </template>
          <!-- List item rendering template -->
          <template #renderItem="{ item }">
            <a-list-item :key="item.name">
              <!-- Actions slot for list item actions -->
              <template #actions>
                <span v-for="{ icon, text } in actions" :key="icon">
                  <component :is="icon" style="margin-right: 8px"/>
                  {{ text }}
                </span>
              </template>
              <!-- Metadata slot for list item meta information -->
              <a-list-item-meta :description="item.description">
                <template #title>
                  <a :href="item.href">{{ item.name }}</a>
                </template>
                <template #avatar>
                  <a-avatar :src="item.avatar"/>
                </template>
              </a-list-item-meta>
              {{ item.content }}
            </a-list-item>
          </template>
        </a-list>
      </a-layout-content>
    </a-layout>
  </div>
</template>

<script lang="ts">
import {ref, onMounted} from 'vue';
import {
  UserOutlined,
  LaptopOutlined,
  NotificationOutlined,
  StarOutlined,
  LikeOutlined,
  MessageOutlined
} from '@ant-design/icons-vue';
import axios from 'axios';

export default {
  name: 'Home',
  setup() {
    // Define reactive variables
    const ebooks = ref([]);
    const selectedKeys2 = ref([]);
    const openKeys = ref([]);

    // Fetch data from the backend when the component is mounted
    onMounted(() => {
      // console.log('Fetching ebook list...8964');
      axios.get('/ebook/list', {params: {page: 1, pageSize: 1000}})
          .then(response => {
            const data = response.data;
            ebooks.value = data.content.list;
          });
    });

    // Define pagination configuration
    const pagination = {
      onChange: (page: number) => {
        console.log(page);
      },
      pageSize: 3,
    };

    // Define actions for list items
    const actions = [
      {icon: StarOutlined, text: '156'},
      {icon: LikeOutlined, text: '156'},
      {icon: MessageOutlined, text: '2'},
    ];

    // Return reactive variables and imported icons
    return {
      ebooks,
      selectedKeys2,
      openKeys,
      pagination,
      actions,
      UserOutlined,
      LaptopOutlined,
      NotificationOutlined,
    }
  }
};
</script>

<style scoped>
/* Custom styles for the Home component, scoped means these styles will only apply to this component */
.ant-avatar {
  width: 50px; /* Sets the width of the avatar to 50 pixels */
  height: 50px; /* Sets the height of the avatar to 50 pixels */
  line-height: 50px; /* Sets the line height to center the text vertically within the avatar */
  border-radius: 8%; /* Rounds the corners of the avatar, making it slightly rounded (8% of its width/height) */
  margin: 5px 0; /* Adds 5 pixels of margin above and below the avatar */
}
</style>

```
