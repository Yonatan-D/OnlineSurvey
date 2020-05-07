<template>
  <div class="answer" v-wechat-title="this.title">
    <div class="survey-content" ref="content">
      <!-- 预览面板 -->
      <div class="preview-toolbar" ref="toolbar" v-if="isPreview">
        <el-button
          type="text"
          icon="el-icon-circle-close"
          @click="closePreview()"
          style="float:left"
        >关闭预览</el-button>
        <div class="toolbar-center">
          <el-button class="btn-computer" type="text" icon="el-icon-s-platform">电脑预览</el-button>
          <span class="interval" style="margin:0 15px"></span>
          <el-button
            class="btn-phone"
            type="text"
            icon="el-icon-mobile-phone"
            @click="toPhoneView()"
          >手机预览</el-button>
        </div>
      </div>
      <div style="position: absolute; right:20px; margin:15px 5px; z-index:999">
        <el-button @click="openDrawer" v-if="!drawer" type="primary" icon="el-icon-back" circle></el-button>
      </div>
      <el-card :class="{survey:drawer}" ref="survey" v-loading="loading" v-if="isNoneQs">
        <div class="survey-inner">
          <div class="qs-item" v-for="(item, index) in survey.qsitems" :key="index">
            <p>
              <span class="serial">{{index+1}}.</span>
              <span class="title">{{item.title}}</span>
              <span class="must" v-if="item.isRequired == 1">*</span>
              <span class="notice" v-if="item.type == 'checkbox'">多选题</span>
            </p>
            <div v-if="item.type === 'radio'">
              <el-radio-group class="block" v-model="answer[item.id]">
                <el-radio
                  class="block an-item"
                  :label="option.id"
                  v-for="(option, i) in item.options"
                  :key="i"
                  @change="refreshProgress(item.id);"
                  width="100"
                >{{option.value}}</el-radio>
              </el-radio-group>
              <!-- <el-input v-show="otherOpt" v-model="answer[item.id]"></el-input> -->
            </div>
            <div v-else-if="item.type === 'checkbox'">
              <el-checkbox-group v-model="answer[item.id]">
                <el-checkbox
                  class="block an-item"
                  :label="option.id"
                  v-for="(option, i) in item.options"
                  :key="i"
                  @change="refreshProgress(item.id)"
                >{{option.value}}</el-checkbox>
              </el-checkbox-group>
            </div>
            <div v-else-if="item.type === 'textarea'">
              <el-input
                type="textarea"
                :autosize="{ minRows: 5, maxRows: 5}"
                v-model="answer[item.id]"
                :oninput="refreshProgress(item.id)"
              ></el-input>
            </div>
            <div v-else-if="item.type === 'rate'">
              <el-rate
                show-text
                :texts="['非常不满意','','','','非常满意']"
                v-model="answer[item.id]"
                @change="refreshProgress(item.id)"
              ></el-rate>
            </div>
          </div>
        </div>
        <div style="text-align:center;margin-bottom:70px;" v-show="answerNumber != 0">
          <el-button v-show="!allowSubmit" type="primary" disabled>请将必填题答完</el-button>
          <el-button v-show="allowSubmit" type="primary" @click="submitSurvey">提交问卷</el-button>
        </div>
      </el-card>
      <div class="progress" ref="line">
        <div class="progress-info">{{answerNumber}}题已回答(共{{survey.number}}个问题)</div>
        <div class="progress-bar">
          <el-progress
            :show-text="false"
            :stroke-width="7"
            :percentage="percentage"
            status="warning"
          ></el-progress>
        </div>
      </div>
    </div>
    <div class="right-info">
      <el-button
        @click="closeDrawer"
        type="primary"
        icon="el-icon-right"
        circle
        style="float:right; margin: 0 10px;"
      ></el-button>
      <div class="survey-info">
        <h2>{{survey.title}}</h2>
        <p class="intro">{{survey.introduction}}</p>
        <p class="dot">问题数</p>
        <br />
        <p class="num">{{survey.number}}</p>
        <div v-if="survey.totalTime > 0">
          <p class="dot">完成所需时间</p>
          <br />
          <p class="num">{{parseInt(survey.totalTime/60)}}分{{survey.totalTime%60}}秒</p>
        </div>

        <!-- 使用模板面板 -->
        <div v-if="isTemplate">
          <p class="dot">使用次数</p>
          <br />
          <p class="num">{{survey.quote}}</p>
          <div class="templateBar" ref="templateBar">
            <div style="margin-top:20px;">
              <el-button type="primary" @click="createTemplateSurvey()" style="padding:12px 60px;">
                使用此模板
                <i class="el-icon-right" style="margin-left:10px;"></i>
              </el-button>
              <div class="prompt">
                没有找到您想要的模板吗？
                <el-link type="primary" href="/#/home/design/edit">立即创建空白问卷</el-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import QS from "qs";

export default {
  data() {
    return {
      title: "",
      surveyId: "",
      drawer: true,
      answer: {},
      markIds: [],
      isNoneQs: false,
      isPreview: false,
      isPhonePreview: false,
      isTemplate: false,
      fromURL: "",
      timer: null,
      totalTime: 0,
      allowSubmit: false,

      answerNumber: 0,
      percentage: 0,

      loading: true,
      survey: {},

      //
      otherOpt: false
    };
  },

  methods: {
    openDrawer() {
      this.drawer = true;
      this.$refs.content.style.width = "calc(100% - 420px)";
      this.$refs.line.style.width = "calc(100% - 420px)";
      if (this.isPreview) this.$refs.toolbar.style.width = "calc(100% - 460px)";
      if (this.isTemplate) this.$refs.templateBar.style.width = "420px";
    },

    closeDrawer() {
      this.drawer = false;
      this.$refs.content.style.width = "100%";
      this.$refs.line.style.width = "100%";
      if (this.isPreview) this.$refs.toolbar.style.width = "100%";
      if (this.isTemplate) this.$refs.templateBar.style.width = "0px";
    },

    /**
     * 提交填写的问卷
     */
    submitSurvey() {
      window.console.log(this.answer);
      if (this.isPreview || this.isPhonePreview) {
        this.$alert("预览模式下提交不会记录数据", "提示").then(() => {
          this.$router.push("/submit/success");
        });
        return;
      }
      clearInterval(this.timer); // 清除计时器
      let parame = {};
      let surveyRecycle = {};
      surveyRecycle.surveyId = this.surveyId;
      surveyRecycle.totalTime = this.totalTime;
      surveyRecycle.submitDate = new Date().format("yyyy-MM-dd hh:mm:ss");
      // 设备
      surveyRecycle.deviceInfo = /Android|webOS|iPhone|iPod|BlackBerry/i.test(
        navigator.userAgent
      )
        ? 2 // 访问设备：手机
        : 1; // 访问设备：PC
      // 来源
      // 判断是否在微信浏览器中打开
      if (this.$route.query.qrcode === "true")
        surveyRecycle.dataSource = "二维码";
      else if (this.is_weixn()) surveyRecycle.dataSource = "微信";
      else surveyRecycle.dataSource = "链接";
      surveyRecycle.ip = returnCitySN["cip"]; // eslint-disable-line no-undef
      surveyRecycle.position = returnCitySN["cname"]; // eslint-disable-line no-undef

      parame.surveyRecycle = surveyRecycle;

      let answer = [];
      for (const key in this.answer) {
        let anitem = {};
        anitem.questionId = key;
        this.survey.qsitems.forEach(item => {
          if (item.id === key) anitem.type = item.type;
        });
        anitem.content = this.answer[key];
        answer.push(anitem);
      }
      parame.answers = answer;
      this.$http
        .post("answer", parame)
        .then(() => {
          this.$router.push("/submit/success");
        })
        .catch(() => {
          this.$alert("提交失败");
        });
    },

    /**
     * 向服务器请求问卷信息
     */
    getSurvey() {
      this.$http
        .get("survey/" + this.surveyId)
        .then(res => {
          this.loading = false;
          this.survey = res.data;
          if (this.isPreview) this.title = "电脑预览";
          else if (this.isTemplate) this.title = "模板预览";
          else this.title = this.survey.title;
          if (!this.isPhonePreview) {
            // 问卷已关闭跳转
            if (!this.isPreview && this.survey.status == 0)
              this.$router.push("/close");
            if (
              this.survey.enHandle == 1 &&
              new Date(this.survey.enAnDate) < new Date()
            )
              this.$router.push("/close");
            // 非预览正常访问，访客数加1
            if (!this.isPreview && this.survey.status == 1) {
              this.increasedVisits();
              // 计时器，记录答题时间
              this.timer = setInterval(() => {
                this.totalTime++;
              }, 1000);
            }
          }
          if (this.survey.qsitems.length != 0) this.isNoneQs = true;
          const qsitem = res.data.qsitems;
          for (const key in qsitem) {
            // 初始化answer的数据类型
            if (
              qsitem[key].type === "textarea" ||
              qsitem[key].type === "radio"
            ) {
              this.$set(this.answer, qsitem[key].id, "");
            } else if (qsitem[key].type === "rate") {
              this.$set(this.answer, qsitem[key].id, null);
            } else if (qsitem[key].type === "checkbox") {
              this.$set(this.answer, qsitem[key].id, []);
            }
          }

          for (const key in qsitem) {
            // 初始化markIds的数据
            this.markIds[qsitem[key].id] = 0;
          }
        })
        .catch(() => {
          this.$router.push("/nofind");
        });
    },

    /**
     * 更新答题进度
     */
    refreshProgress(id) {
      // refreshProgress(id, option) {
      // // 其他选项
      // if(option) {
      //   if(option.value==='其他 ____') {
      //     // this.answer[id] = "";
      //     this.otherOpt=true;
      //   }
      //   else this.otherOpt = false;
      // }

      this.markIds[id] = 1;
      if (this.answer[id].length == 0) {
        this.markIds[id] = 0;
      }
      let answerNumber = 0;
      for (const key in this.markIds) {
        if (this.markIds[key] == 1) {
          answerNumber++;
        }
      }
      this.answerNumber = answerNumber;
      this.percentage = (this.answerNumber / this.survey.number) * 100;
      // 控制提交按钮的显示
      for (const key in this.survey.qsitems) {
        const item = this.survey.qsitems[key];
        if (item.isRequired == 1 && this.markIds[item.id] == 0) {
          this.allowSubmit = false; // 隐藏提交按钮
          return; // 发现有未答的必填题就停止往下执行
        }
      }
      this.allowSubmit = true; // 显示提交按钮
    },

    /**
     * 浏览量加一
     */
    increasedVisits() {
      if(this.$route.query.noAddVisits) return;
      this.$http.get("survey/visits/" + this.surveyId);
    },

    /**
     * 跳转到手机预览视图
     */
    toPhoneView() {
      if (this.isTemplate) {
        this.$router.push({
          name: "PhoneView",
          query: {
            surveyId: this.surveyId,
            searchText: this.$route.query.searchText,
            page: Number(this.$route.query.page),
            sortby: this.$route.query.sortby,
            isTemplate: this.isTemplate
          }
        });
      } else {
        this.$router.push({
          name: "PhoneView",
          query: {
            surveyId: this.surveyId
          }
        });
      }
    },

    /**
     * 关闭预览模式
     */
    closePreview() {
      if (this.isTemplate == true || this.isTemplate == "true") {
        if (this.$route.query.searchText == null) {
          window.close();
        } else {
          this.$router.push(this.fromURL);
        }
      } else {
        this.$router.push(`/home/design/edit?surveyId=${this.surveyId}`);
      }
    },

    /**
     * 使用模板创建问卷
     */
    createTemplateSurvey() {
      const data = {};
      data.surveyId = this.surveyId;
      data.creator = this.uid;
      this.$http
        .post("survey/template/new", QS.stringify(data))
        .then(res => {
          this.surveyId = res.data;
          this.$router.push({
            name: "edit",
            query: {
              surveyId: this.surveyId
            }
          });
        })
        .catch(() => {
          this.$message({
            message: "创建失败!",
            type: "error"
          });
        });
    },

    /**
     * 判断是否在微信浏览器中打开
     */
    is_weixn() {
      var ua = navigator.userAgent.toLowerCase();
      if (ua.match(/MicroMessenger/i) == "micromessenger") {
        return true;
      } else {
        return false;
      }
    }
  },

  computed: {
    ...mapState({
      uid: state => state.uid
    })
  },

  mounted() {
    // 开启预览模式
    this.isPreview = this.$route.query.isPreview;
    this.isPhonePreview = this.$route.query.isPhonePreview;
    // 开启使用模板
    this.isTemplate = this.$route.query.isTemplate;
    if (this.isTemplate) {
      let searchText = this.$route.query.searchText;
      let page = Number(this.$route.query.page);
      let sortby = this.$route.query.sortby;
      this.fromURL = `/home/search?searchText=${searchText}&page=${page}&sortby=${sortby}`;
    }
    // 接收路由传来的问卷编号
    this.surveyId = this.$route.query.surveyId;
    // 向服务器请求问卷信息
    this.getSurvey();
  }
};
</script>

<style scoped>
.answer {
  width: 100%;
  height: 100%;
  background: #fff;
  overflow: hidden;
  font-family: "PingFang SC", tahoma, arial, "helvetica neue",
    "hiragino sans gb", "microsoft yahei", sans-serif;
}
.preview-toolbar {
  width: calc(100% - 460px);
  height: 45px;
  line-height: 45px;
  background-color: #fff;
  border-bottom: 1px solid #dcdfe6;
  position: fixed;
  padding: 0 20px;
  text-align: center;
  z-index: 998;
}
.preview-toolbar .toolbar-center {
  display: inline-block;
  margin-left: -104px;
}
.preview-toolbar .toolbar-center .btn-phone {
  color: #8a8a8a;
}
.preview-toolbar .toolbar-center .btn-phone:hover {
  color: #409eff;
}
.survey-content {
  /* width: calc(100% - 350px); */
  width: calc(100% - 420px);
  height: 100%;
  background-color: #f4f6f9;
  float: left;
  overflow-y: scroll;
  /* transition: .5s; */
  margin-right: 25px;
  border-right: 1px solid #e1e7f2;
}
.survey-content .survey {
  width: 850px;
  max-width: 100%;
  /* min-width: 730px; */
  margin: 68px auto 40px auto;
}
.survey-inner {
  width: 850px;
  max-width: 100%;
  margin: 0 auto;
  padding: 35px 0 50px 0;
}
/* 滚动条样式 start */
.survey-content::-webkit-scrollbar {
  width: 10px;
  display: none;
}
.survey-content::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.survey-content::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
.right-info {
  margin: 15px 15px;
  height: 100%;
  overflow: auto;
}
/* 滚动条样式 start */
.right-info::-webkit-scrollbar {
  width: 5px;
  display: none;
}
.right-info::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.right-info::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
.progress {
  /* width: calc(100% - 350px); */
  width: calc(100% - 420px);
  max-height: 70px;
  /* background: #409eff;#53a8ff */
  background: #53a8ff;
  position: fixed;
  bottom: 0;
  color: #fff;
  line-height: 35px;
  text-align: center;
  /* transition: .5s; */
  z-index: 999;
}
.progress-info {
  display: inline-block;
  margin: 0px 20px;
  /* font-size: 13px; */
  font-size: 1rem;
}
.progress-bar {
  width: 200px;
  display: inline-block;
  margin: 0 5px;
}
.qs-item {
  width: 90%;
  margin: 0 auto 45px auto;
  padding: 25px 0px 0 0;
  color: #444;
  /* font-size: 15px; */
  font-size: 1rem;
  font-weight: bold;
  line-height: 1.5rem;
}
.qs-item .serial {
  margin-right: 8px;
  font-size: 18px;
  font-weight: bolder;
}
.qs-item .must {
  margin-left: 8px;
  color: #ff6161;
  font-size: 18px;
}
.qs-item .notice {
  margin-left: 8px;
  color: #4c4c4c;
  font-size: 14px;
  font-weight: bold;
  padding: 4px 7px;
  background-color: rgba(0, 0, 0, 0.05);
  border-radius: 3px;
  white-space: nowrap; /* 强制不换行 */
}
.block {
  display: block;
  color: #333;
}
.an-item {
  margin: 0;
  padding: 10px 20px;
  line-height: 1.2rem;
  white-space: pre-wrap;
  word-wrap: break-word;
}
.an-item:hover {
  background-color: rgba(40, 99, 243, 0.1);
}
.survey-info {
  padding: 20px;
}
.survey-info h2 {
  display: inline-block;
  color: #333;
  font-weight: bold;
  font-size: 1.8rem;
}
.survey-info .intro {
  color: #4f4f4f;
  /* font-size: 14px; */
  font-size: 1rem;
  margin-bottom: 20px;
}
.survey-info .dot {
  display: inline-block;
  color: #24292e;
  /* font-size: 16px; */
  font-size: 1.2rem;
  margin-bottom: 0;
  padding: 4px 7px;
  background-color: rgba(0, 0, 0, 0.05);
  border-radius: 3px;
}
.survey-info .num {
  display: inline-block;
  color: #24292e;
  /* font-size: 24px; */
  font-size: 1.5rem;
  margin: 5px 0px 5px 4px;
}
.survey-info .templateBar {
  width: 420px;
  height: 130px;
  position: absolute;
  right: 0;
  bottom: 0;
  border-top: 1px solid #e1e4e8;
  text-align: center;
}
.survey-info .templateBar .prompt {
  width: 216px;
  display: inline-block;
  text-align: left;
  margin-top: 10px;
  color: #4f4f4f;
  font-size: 14px;
}
.survey-info .templateBar .prompt a {
  font-size: 12px;
}
</style>