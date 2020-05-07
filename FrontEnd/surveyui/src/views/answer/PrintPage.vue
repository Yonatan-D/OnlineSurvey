<template>
  <div class="print">
    <!-- <div class="mask"></div> -->
    <div class="survey" ref="survey" v-wechat-title="this.title">
      <h2 style="text-align:center;font-weight:500">{{survey.title}}</h2>
      <p style="margin:40px 0">{{survey.introduction}}</p>
      <div class="qs-item" v-for="(item, index) in survey.qsitems" :key="index">
        <p>
          {{index+1}}. {{item.title}}
          <span class="must" v-if="item.isRequired == 1">*</span>
        </p>
        <div v-if="item.type === 'radio'">
          <el-radio-group class="block">
            <el-radio
              class="block an-item"
              :label="option.id"
              v-for="(option, i) in item.options"
              :key="i"
            >{{option.value}}</el-radio>
          </el-radio-group>
        </div>
        <div v-else-if="item.type === 'checkbox'">
          <el-checkbox-group v-model="checkvalue" disable>
            <el-checkbox
              class="block an-item"
              :label="option.id"
              v-for="(option, i) in item.options"
              :key="i"
            >{{option.value}}</el-checkbox>
          </el-checkbox-group>
        </div>
        <div v-else-if="item.type === 'textarea'">
          <el-input type="textarea" :autosize="{ minRows: 5, maxRows: 5}"></el-input>
        </div>
        <div v-else-if="item.type === 'rate'">
          <el-rate></el-rate>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: "",
      surveyId: "",
      survey: {},
      checkvalue: []
    };
  },

  methods: {
    /**
     * 向服务器请求问卷信息
     */
    getSurvey() {
      this.$http
        .get("survey/" + this.surveyId)
        .then(res => {
          this.loading = false;
          this.survey = res.data;
          this.title = this.survey.title;
          setTimeout(() => {
              this.$print(this.$refs.survey);
          }, 500)
        })
        .catch(() => {
          this.$alert("获取问卷失败!");
          this.loading = false;
        });
    }
  },

  mounted() {
    this.surveyId = this.$route.query.surveyId;
    this.getSurvey();
  }
};
</script>

<style scoped>
.print {
  height: 100%;
  overflow-x: hidden;
  overflow-y: auto;
}
@media print {
  .print {
    overflow-x: hidden;
    page-break-after: auto;
    page-break-inside: auto;
    page-break-before: auto;
    overflow-y: hidden;
  }
}
/* .mask {
    z-index: 133;
    position: absolute;
    opacity: 0;
    width: 800px;
    height: 100vh;
    transform: translate(-50%,-50%);
    top: 0;
    left: 50%;
    right: 0;
    bottom: 0;
    background-color:red;
} */
.survey {
  width: 700px;
  margin: 20px auto;
  padding: 25px;
}
.qs-item {
  width: 100%;
  margin: 0 auto;
  padding: 25px 0px;
  color: #444;
  font-size: 15px;
  font-weight: bold;
}
.qs-item .must {
  color: #ff6161;
  font-size: 18px;
}
.block {
  display: block;
  color: #333;
}
.an-item {
  margin: 0;
  padding: 10px 20px;
}
</style>