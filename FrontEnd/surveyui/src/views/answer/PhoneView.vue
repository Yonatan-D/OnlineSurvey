<template>
  <div class="answer">
    <div class="preview-toolbar" ref="toolbar" v-if="isPreview">
      <el-button
        type="text"
        icon="el-icon-circle-close"
        @click="closePreview()"
        style="float:left"
      >关闭预览</el-button>
      <div class="toolbar-center">
        <el-button
          class="btn-computer"
          type="text"
          icon="el-icon-s-platform"
          @click="toPCView()"
        >电脑预览</el-button>
        <span class="interval" style="margin:0 15px"></span>
        <el-button class="btn-phone" type="text" icon="el-icon-mobile-phone">手机预览</el-button>
      </div>
    </div>
    <div>
      <div id="preview_mobile_container">
        <iframe id="preview_mobile_iframe" :src="view" frameborder="0"></iframe>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      surveyId: "",
      isPreview: true,
      view: "",
      fromURL: ""
    };
  },

  methods: {
    toPCView() {
      this.$router.push({
        path: "/answer/pc",
        query: {
          surveyId: this.surveyId,
          isPreview: true,
          searchText: this.$route.query.searchText,
          page: Number(this.$route.query.page),
          sortby: this.$route.query.sortby,
          isTemplate: this.$route.query.isTemplate
        }
      });
    },

    /**
     * 关闭预览模式
     */
    closePreview() {
      if (this.$route.query.isTemplate == true || this.$route.query.isTemplate == "true") {
        if(this.$route.query.searchText == null) {
          window.close();
        } else {
          this.$router.push(this.fromURL);
        }
      } else {
        this.$router.push(`/home/design/edit?surveyId=${this.surveyId}`);
      }
    }
  },

  mounted() {
    this.surveyId = this.$route.query.surveyId;
    this.view = `/#/answer/pc?surveyId=${this.surveyId}&isPhonePreview=true`;
    if (this.$route.query.isTemplate) {
      let searchText = this.$route.query.searchText;
      let page = Number(this.$route.query.page);
      let sortby = this.$route.query.sortby;
      this.fromURL = `/home/search?searchText=${searchText}&page=${page}&sortby=${sortby}`;
    }
  }
};
</script>

<style scoped>
.answer {
  width: 100%;
  height: 100%;
  background-color: #f0f0f0;
}
.preview-toolbar {
  width: 100%;
  height: 45px;
  line-height: 45px;
  background-color: #fff;
  border-bottom: 1px solid #dcdfe6;
  position: fixed;
  padding: 0 20px;
  text-align: center;
}
.preview-toolbar .toolbar-center {
  display: inline-block;
  margin-left: -104px;
}
.preview-toolbar .toolbar-center .btn-computer {
  color: #8a8a8a;
}
.preview-toolbar .toolbar-center .btn-computer:hover {
  color: #409eff;
}
#preview_mobile_container {
  width: 380px;
  height: 650px;
  position: absolute;
  left: 50%;
  bottom: 0;
  transform: translate(-47%, 0);
  background: url("~@/assets/image/bg_preview_mobile.png") no-repeat;
  background-size: 100%;
}
#preview_mobile_iframe {
  position: absolute;
  width: 312px;
  height: 558px;
  top: 87px;
  left: 19px;
}
</style>