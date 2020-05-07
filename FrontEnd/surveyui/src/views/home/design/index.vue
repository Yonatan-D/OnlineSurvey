<template>
  <div class="design">
    <div class="sub-header">
      <el-menu router :default-active="isActive" mode="horizontal" active-text-color="#409EFF">
        <el-menu-item index="/home/design/edit" style="padding-right:5px" @click="toEditPage()">编辑问卷</el-menu-item>
        <el-menu-item style="cursor:default;padding:0;">
          <i class="el-icon-arrow-right" style="margin-bottom:2px"></i>
        </el-menu-item>
        <el-menu-item
          index="/home/design/publish"
          style="padding:0 5px"
          @click="toPublishPage()"
        >投放问卷</el-menu-item>
        <el-menu-item style="cursor:default;padding:0;">
          <i class="el-icon-arrow-right" style="margin-bottom:2px"></i>
        </el-menu-item>
        <el-menu-item
          index="/home/design/chart/overview"
          style="padding-left:5px"
          @click="toChartPage()"
        >统计报表</el-menu-item>
        <el-menu-item style="float:right;" v-if="survey">
          <el-button plain icon="el-icon-view" @click="preview()">预览</el-button>
          <el-button type="primary" v-show="survey.status == 0" @click="handlePublish(1)">
            <i class="el-icon-open" style="color:#fff;"></i>开始回收
          </el-button>
          <el-button type="primary" v-show="survey.status == 1" @click="handlePublish(0)">
            <i class="el-icon-turn-off" style="color:#fff;"></i>暂停回收
          </el-button>
        </el-menu-item>
      </el-menu>
    </div>
    <div class="contain">
      <router-view v-if="isRouterAlive"></router-view>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isRouterAlive: true,
      isActive: "",
      surveyId: "",
      survey: "",
      edit: `/home/design/edit?surveyId=${this.surveyId}`,
      publish: `/home/design/publish?surveyId=${this.surveyId}`
    };
  },

  methods: {
    loadingSurvey() {
      this.$http.get(`survey/status/${this.surveyId}`).then(res => {
        this.survey = res.data;
      });
    },

    handlePublish(status) {
      let message = "";
      if (status == 1) message = "问卷已经开始回收";
      else message = "问卷已经暂停回收";
      const survey = {};
      survey.id = this.survey.id;
      survey.status = status;
      this.$http.post("survey/publish", survey).then(() => {
        this.$message({
          message: `<strong style="color:#333">${message}</strong>`,
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
        this.survey.status = status;
        // 刷新投放页的手机预览
        if (this.$route.path == "/home/design/publish") {
          this.isRouterAlive = false;
          this.$nextTick(function() {
            this.isRouterAlive = true;
          });
        }
      });
    },

    preview() {
      // 预览问卷
      this.$router.push({
        name: "PCView",
        query: {
          surveyId: this.surveyId,
          isPreview: true
        }
      });
    },

    toEditPage() {
      this.$router.push({
        path: "/home/design/edit",
        query: {
          surveyId: this.surveyId
        }
      });
    },

    toPublishPage() {
      this.$router.push({
        path: "/home/design/publish",
        query: {
          surveyId: this.surveyId
        }
      });
    },

    toChartPage() {
      this.$router.push({
        path: "/home/design/chart/overview",
        query: {
          surveyId: this.surveyId
        }
      });
    }
  },

  mounted() {
    this.isActive = this.$route.path;
    this.surveyId = this.$route.query.surveyId;
    this.loadingSurvey();
  }
};
</script>

<style scoped>
.design {
  width: 100%;
  height: 100%;
}
/* 问卷生成-投放-数据步骤导航栏 start */
.sub-header {
  z-index: 999;
  position: fixed;
  top: 61px;
  width: 100%;
  min-width: 950px;
  height: 60px;
  line-height: 60px;
  border-bottom: 1px solid #eaeaea;
  zoom: 1;
  background-color: #fff;
  color: #333333;
  box-shadow: 0px 3px 8px 0px rgba(224, 229, 236, 0.4);
}
/* 问卷生成-投放-数据步骤导航栏 end */
.el-menu-item {
  border-bottom-color: #fff !important;
}
.el-menu-item:hover {
  color: #409eff !important;
}
.el-menu-item:nth-child(2) {
  color: #909399 !important;
}
.el-menu-item:nth-child(4) {
  color: #909399 !important;
}
.contain {
  position: fixed;
  top: 122px;
  bottom: 0;
  left: 0;
  right: 0;
}
</style>