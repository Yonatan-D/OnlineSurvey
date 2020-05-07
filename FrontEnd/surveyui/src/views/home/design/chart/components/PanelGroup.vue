<template>
  <div style="margin-top: 20px;">
    <el-row :gutter="10">
      <el-col :span="6">
        <div class="grid-content">
          <div class="card-panel-iconf-div">
            <i class="el-icon-document-checked panel-icon"></i>
          </div>
          <div>
            <div class="card-panel-desc">
              <div class="title">回收量</div>
              <countTo :startVal="0" :endVal="panelNum.recycles" :duration="3000"></countTo>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">
          <div class="card-panel-iconf-div">
            <i class="el-icon-view panel-icon"></i>
          </div>
          <div>
            <div class="card-panel-desc">
              <div class="title">浏览量</div>
              <countTo :startVal="0" :endVal="panelNum.visits" :duration="3000"></countTo>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">
          <div class="card-panel-iconf-div">
            <i class="el-icon-pie-chart panel-icon"></i>
          </div>
          <div>
            <div class="card-panel-desc">
              <div class="title">回收率</div>
              <countTo :startVal="0" :endVal="panelNum.recycleRate" :duration="3000"></countTo>
              <span class="text">%</span>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content">
          <div class="card-panel-iconf-div">
            <i class="el-icon-time panel-icon"></i>
          </div>
          <div>
            <div class="card-panel-desc" style="margin-right: 14px;">
              <div class="title">平均用时</div>
              <countTo :startVal="0" :endVal="parseInt(panelNum.totalTimeAvg/60)" :duration="3000"></countTo>
              <span class="text">分</span>
              <countTo :startVal="0" :endVal="panelNum.totalTimeAvg%60" :duration="3000"></countTo>
              <span class="text">秒</span>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import countTo from "vue-count-to";
export default {
  data() {
    return {
      panelNum: {
        recycles: 0,
        visits: 0,
        recycleRate: 0,
        totalTimeAvg: 0
      }
    }
  },
  components: { countTo },
  created() {
    let surveyId = this.$route.query.surveyId;
    this.$http
    .get('/recycle/panel/'+surveyId)
    .then(res => {
      this.panelNum = res.data;
    })
  }
};
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
}

.el-col {
  border-radius: 4px;
}

.grid-content {
  border-radius: 4px;
  height: 110px;
  background: #fff;
  position: relative;
  overflow: hidden;
  cursor: pointer;
  box-shadow: 4px 4px 40px rgba(0,0,0,.05);
  border-color: rgba(0,0,0,.05);
}
.card-panel-iconf-div {
  color: #409eff;
  margin: 25px 0 0 14px;
  padding: 10px;
  float: left;
  border-radius: 6px;
  transition: all 0.5s ease-out;
}
.grid-content:hover .card-panel-iconf-div {
  background: #409eff;
  color: #fff;
}
.panel-icon {
  font-size: 40px;
}
.card-panel-desc {
  float: right;
  margin: 25px 24px 25px 0px;
  font-size: 26px;
  font-weight: 500;
  color: #333;
}
.card-panel-desc .text {
  color: #333;
  font-size: 14px;
  font-weight: normal;
}
.title {
  text-align: right;
  color: #333;
  font-size: 14px;
  font-weight: normal;
  margin-bottom: 10px;
  text-align: left
}
</style>
