<template>
  <div class="temp">
    <div class="container">
      <el-tabs v-model="activeName">
        <el-tab-pane label="用户公开问卷" name="first">
          <el-row :gutter="5">
            <el-col :span="5">
              <el-card class="menu card" shadow="never">
                <h4>热门标签</h4>
                <el-button
                  class="survey-tag"
                  size="mini"
                  v-for="(tag, index) in tags"
                  :key="index"
                  @click="loadingSurveyOfTag(tag)"
                >{{tag}}</el-button>
              </el-card>
            </el-col>
            <el-col :span="19">
              <el-card class="card" shadow="never">
                <el-input v-model="search" placeholder="当前标签下搜索问卷"></el-input>
                <div
                  class="survey-items"
                  v-for="(survey, index) in surveyList.filter(surveyList => !search || surveyList.title.toLowerCase().includes(search.toLowerCase()))"
                  :key="index"
                >
                  <span style="float:left">{{survey.title}}</span>
                  <el-link
                    :underline="false"
                    type="primary"
                    style="float:right"
                    @click="preview(survey.id)"
                  >
                    <i class="el-icon-view" style="margin-right:5px"></i>预览
                  </el-link>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script>
import QS from "qs";

export default {
  data() {
    return {
      activeName: "first",
      search: "",
      tags: [],
      surveyList: []
    };
  },

  methods: {
    /**
     * 获取全部标签按热度排序
     */
    loadingAllTags() {
      this.$http.post("/tag/all").then(res => {
        this.tags = res.data;
        this.loadingSurveyOfTag(this.tags[0]);
      });
    },

    /**
     * 获取指定标签的问卷
     */
    loadingSurveyOfTag(tag) {
      const data = {};
      data.tag = tag;
      this.$http.post("/tag/survey", QS.stringify(data)).then(res => {
        this.surveyList = res.data;
      });
    },

    /**
     * 预览模板
     */
    preview(surveyId) {
      window.open(
        `/#/answer/pc?surveyId=${surveyId}&isPreview=true&isTemplate=true`
      );
    }
  },

  mounted() {
    this.loadingAllTags();
  }
};
</script>

<style>
.temp .menu .el-card__body {
  padding: 25px 0px;
}
.temp .menu .el-menu-item {
  height: 33px;
  line-height: 33px;
}
.temp .el-input__inner {
  border-radius: 40px;
  margin-bottom: 20px;
}
</style>
<style scoped>
.temp {
  position: fixed;
  top: 60px;
  left: 0px;
  bottom: 0px;
  right: 0px;
  width: 100%;
  height: calc(100%-60px);
  overflow-y: scroll;
  background-color: #f4f6f9;
}
.container {
  width: 80%;
  height: 100%;
  margin: 20px auto;
}
.card {
  min-height: 75vh;
  text-align: center;
}
h4 {
  color: #4f4f4f;
  margin: 0 0 20px 0;
}
.survey-tag {
  margin: 5px 5px;
}
.survey-items {
  height: 30px;
  line-height: 30px;
  padding: 10px 10px;
  border-top: 1px solid #ececec;
}
/* 滚动条样式 start */
.temp::-webkit-scrollbar {
  width: 10px;
}
.temp::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.temp::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
</style>