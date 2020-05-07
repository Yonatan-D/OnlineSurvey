<template>
  <div class="contain">
    <div class="answer-page" ref="page">
      <div class="recycle_detail">
        <p>序号：{{id}}</p>
        <p>提交答卷时间：{{recycle.detail.submitDate}}</p>
        <p>来源IP：{{recycle.detail.ip}}（{{recycle.detail.position}}）</p>
        <p>来源渠道：{{recycle.detail.dataSource}}</p>
        <p>
          <span v-if="recycle.detail.deviceInfo == 1" style="color:#409EFF">
            <i class="el-icon-s-platform"></i>
            <span>（电脑提交）</span>
          </span>
          <span v-else-if="recycle.detail.deviceInfo == 2" style="color:#2f9833">
            <i class="el-icon-mobile-phone"></i>
            <span>（手机提交）</span>
          </span>
          <i class="el-icon-timer"></i>
          <span>用时：{{recycle.detail.totalTime}}秒</span>
        </p>
        <el-button size="mini" icon="el-icon-printer" class="no-print" style="float:right" @click="printPage">打印答卷</el-button>
      </div>
      <div class="recycle_result">
        <div class="quest_item" v-for="(item, index) in recycle.result" :key="index">
          <div class="title">
            {{index+1}}.{{item.title}}
            <span class="must" v-if="item.must == 1">*</span>
          </div>
          <div class="content">{{item.content}}</div>
        </div>
      </div>
      <div class="toolbar no-print">
        <el-button type="primary" @click="seeAllRecycle()">查看全部的答卷</el-button>
        <el-button @click="closeWindow()">关闭窗口</el-button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      id: "",
      recycleId: "",
      recycle: {
        detail: {},
        result: {}
      }
    };
  },

  methods: {
    seeAllRecycle() {
      this.$router.push({
        path: "/home/design/chart/overview",
        query: {
          surveyId: this.$route.query.surveyId,
          scrollTo: "bottom"
        }
      });
    },

    closeWindow() {
      window.close();
    },

    getRecycle() {
      this.$http.get("recycle/detail/page/" + this.recycleId).then(res => {
        this.recycle = res.data;
      });
    },

    printPage() {
      this.$print(this.$refs.page)
    }
  },

  mounted() {
    this.id = this.$route.query.id;
    this.recycleId = this.$route.query.recycleId;
    this.getRecycle();
  }
};
</script>
<style scoped>
.contain {
  width: 100%;
  height: 100%;
  overflow-y: scroll;
}
.answer-page {
  width: 760px;
  margin: 20px auto;
}
.recycle_detail {
  width: 100%;
  height: 100px;
  padding: 20px;
  background-color: #fafbfc;
  border-bottom: 2px solid #409eff;
  margin-bottom: 16px;
}
.recycle_detail p {
  display: inline-block;
  width: 50%;
  color: #666;
  margin: 5px 0;
}
.recycle_result {
  width: 780px;
  padding: 0 10px;
}
.quest_item {
  padding-top: 10px;
  line-height: 22px;
  border-bottom: 1px dashed #d6d6d6;
}
.quest_item .title {
  color: #4d4d4d;
}
.quest_item .title .must {
  color: #ff6161;
}
.quest_item .content {
  color: #000;
  padding: 8px 0 12px;
  line-height: 1.5;
}
.toolbar {
  margin-top: 20px;
}
/* 滚动条样式 start */
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
/* 滚动条样式 end */
</style>