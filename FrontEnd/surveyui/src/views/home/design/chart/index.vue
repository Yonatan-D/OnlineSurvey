<template>
  <div class="chart">
    <div class="menu">
      <el-menu router :default-active="this.$route.path">
        <el-menu-item index="/home/design/chart/overview" @click="toOverviewPage()">
          <i class="el-icon-menu"></i>
          <span slot="title">回收概况</span>
        </el-menu-item>
        <el-menu-item index="/home/design/chart/recycle" @click="toRecyclePage()">
          <i class="el-icon-document"></i>
          <span slot="title">数据分析</span>
        </el-menu-item>
        <el-menu-item index="/home/design/chart/cross" @click="toCrossPage()">
          <i class="el-icon-data-line"></i>
          <span slot="title">交叉分析</span>
        </el-menu-item>
      </el-menu>
    </div>
    <div class="contain" ref="contain">
      <div class="show">
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      surveyId: '',
    };
  },

  methods: {
    toOverviewPage() {
      this.$router.push('/home/design/chart/overview?surveyId=' + this.surveyId);
      this.$refs.contain.scrollTop = 0;
    },

    toRecyclePage() {
      this.$router.push('/home/design/chart/recycle?surveyId=' + this.surveyId);
      this.$refs.contain.scrollTop = 0;
    },

    toCrossPage() {
      this.$router.push('/home/design/chart/cross?surveyId=' + this.surveyId);
      this.$refs.contain.scrollTop = 0;
    }
  },

  mounted() {
    this.surveyId = this.$route.query.surveyId;
    if(this.$route.query.scrollTo == 'bottom') {
      this.$nextTick(() => {
        this.$refs.contain.scrollTop = this.$refs.contain.scrollHeight
      })
    }
  }
};
</script>

<style scoped>
.chart {
  position: fixed;
  top: 122px;
  left: 0;
  right: 0;
  bottom: 0;
  overflow-x: hidden;
  background-color: #f4f6f9;
  width: 100%;
  height: 100%;
}
.menu {
  position: fixed;
  width: 130px;
  height: 100%;
}
.el-menu {
  width: 100%;
  height: 100%;
}
.contain {
  position: fixed;
  top: 122px;
  left: 130px;
  bottom: 0;
  width: calc(100% - 130px);
  z-index: 10;
  overflow-x: auto;
  overflow-y: scroll;
}
.show {
  width: 1000px;
  height: 100%;
  margin: 20px auto;
}
.contain::-webkit-scrollbar {
  width: 10px;
}
.contain::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.contain::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
</style>
