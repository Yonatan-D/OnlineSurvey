<template>
  <div class="overview">
    <PanelGroup></PanelGroup>
    <DataSource></DataSource>
    <RecycleList></RecycleList>
  </div>
</template>

<script>
import PanelGroup from "./components/PanelGroup.vue";
import DataSource from "./components/DataSource.vue";
import RecycleList from "./components/RecycleList.vue";
export default {
  data() {
    return {};
  },

  components: { PanelGroup, DataSource, RecycleList }
};
</script>

<style scoped>
.overview {
  width: 800px;
  margin: 0 auto;
}
</style>