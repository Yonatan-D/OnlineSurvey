<template>
  <div class="home">
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card>
          <div class="card-left">
            <h1>系统用户人数</h1>
          </div>
          <div class="card-right">
            <h1>
              <countTo :startVal="0" :endVal="counts.totalUser" :duration="3000"></countTo>
            </h1>
          </div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card>
          <div class="card-left">
            <h1>系统问卷份数</h1>
          </div>
          <div class="card-right">
            <h1>
              <countTo :startVal="0" :endVal="counts.totalSurvey" :duration="3000"></countTo>
            </h1>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="20" style="margin-top:20px">
      <el-col :span="12">
        <el-card>
          <div class="card-left">
            <h1>今日新增用户</h1>
          </div>
          <div class="card-right">
            <h1>
              <countTo :startVal="0" :endVal="counts.curDayUser" :duration="3000"></countTo>
            </h1>
          </div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card>
          <div class="card-left">
            <h1>今日新增问卷</h1>
          </div>
          <div class="card-right">
            <h1>
              <countTo :startVal="0" :endVal="counts.curDaySurvey" :duration="3000"></countTo>
            </h1>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import countTo from "vue-count-to";
export default {
  data() {
    return {
      counts: {
        totalUser: 0,
        totalSurvey: 0,
        curDayUser: 0,
        curDaySurvey: 0
      }
    };
  },

  components: { countTo },

  methods: {
    getSystemCounts() {
      this.$http.post("sys/counts").then(res => {
        this.counts = res.data;
      });
    }
  },

  mounted() {
    this.getSystemCounts();
  }
};
</script>
<style scoped>
.home {
  width: 850px;
  max-width: 100%;
  margin: 20px auto;
  font-family: "PingFang SC", tahoma, arial, "helvetica neue",
    "hiragino sans gb", "microsoft yahei", sans-serif;
}
.card-left {
  display: inline-block;
  width: 50%;
  text-align: right;
}
.card-left h1 {
  color: #409eff;
  font-size: 25px;
}
.card-right {
  display: inline-block;
  width: 50%;
  text-align: center;
}
.card-right h1 {
  color: #4c4c4c;
  font-size: 45px;
  font-weight: normal;
  margin: auto 0;
}
</style>