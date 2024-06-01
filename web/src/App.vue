<template>
  <a-layout>
    <the-header></the-header>
    <a-layout-content style="padding: 0 50px">
      <a-layout style="padding: 24px 0; background: #fff">
        <router-view/>
      </a-layout>
    </a-layout-content>
    <the-footer></the-footer>
  </a-layout>
</template>


<script lang="ts">
import {defineComponent} from 'vue';
import TheHeader from "@/components/the-header.vue";
import TheFooter from "@/components/the-footer.vue";

export default defineComponent({
  name: 'app',
  components: {
    TheHeader,
    TheFooter,
  },
});

</script>

<style scoped>
.header .logo {
  float: left;
  width: 120px;
  height: 31px;
  margin: 16px 24px 16px 0;
  background: rgba(255, 255, 255, 0.3);
}

.site-layout-background {
  background: #fff;
}
</style>
