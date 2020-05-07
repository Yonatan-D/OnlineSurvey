<template>
  <div class="publish">
    <div class="card">
      <el-row :gutter="10">
        <el-col :span="16">
          <el-card style="margin-bottom:10px;">
            <div class="share-card">
              <h3>问卷链接</h3>
              <el-row :gutter="20">
                <el-col :span="5">
                  <div class="qrcode" style="width:106.2px;height:106.2px;background:#333;">
                    <el-image
                      style="width: 106.2px; height: 106.2px"
                      :src="imageQRCode"
                      fit="cover"
                    ></el-image>
                  </div>
                </el-col>
                <el-col :span="16">
                  <div class="copy-text-input">
                    <el-input v-model="surveyUrl" style="margin-bottom: 25px;" ref="input">
                      <el-button slot="append" class="btn" @click="copyLink()">复制</el-button>
                    </el-input>
                    <el-link
                      :underline="false"
                      :href="imageQRCode"
                      download="qrcode.png"
                      style="margin-right:20px"
                    >
                      <el-button plain>下载二维码</el-button>
                    </el-link>
                    <el-button plain @click="wechatDialogVisible = true">分享到微信朋友圈</el-button>
                  </div>
                </el-col>
                <el-col :span="3">
                  <el-button class="button" plain @click="openSurvey()">打开</el-button>
                </el-col>
              </el-row>
            </div>
          </el-card>
          <el-card style="height:329px">
            <div class="setting-card">
              <h3>回收设置</h3>
              <el-switch
                v-model="endDateSetting"
                active-text="设定问卷结束时间"
                :active-value="1"
                :inactive-value="0"
                @change="setEndAnswerDate"
              ></el-switch>
              <p v-show="endDateSetting">
                <el-date-picker
                  v-model="enAnDate"
                  type="datetime"
                  placeholder="选择日期时间"
                  @change="setEndAnswerDate"
                ></el-date-picker>
              </p>
            </div>
          </el-card>
        </el-col>
        <el-col :span="8">
          <el-card class="preview-card">
            <div class="mobile-preview">
              <iframe id="preview_mobile_iframe" :src="surveyUrl+'&noAddVisits=true'" frameborder="0"></iframe>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>
    <!-- 微信扫码分享问卷 -->
    <el-dialog
      title="扫码分享问卷"
      width="580px"
      :visible.sync="wechatDialogVisible"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      :show-close="false"
      append-to-body
    >
      <div style="text-align:center">
        <p>微信扫一扫二维码，点击右上角分享该问卷</p>
        <el-image style="width: 200px; height: 200px" :src="imageQRCode" fit="cover"></el-image>
      </div>
      <div slot="footer">
        <el-button type="primary" @click="wechatDialogVisible = false">关闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import QS from "qs";

export default {
  data() {
    return {
      surveyId: "",
      surveyUrl: "",
      msg: "",
      imageQRCode: "",
      endDateSetting: 0,
      enAnDate: null,
      wechatDialogVisible: false
    };
  },

  methods: {
    /**
     * 新标签页打开问卷
     */
    openSurvey() {
      window.open(this.surveyUrl);
    },
    /**
     * 复制问卷链接
     */
    copyLink() {
      this.$refs.input.select();
      if (document.execCommand("copy")) {
        this.$message({
          message: '<strong style="color:#333">复制成功</strong>',
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
      } else {
        this.$message({
          message: '<strong style="color:#333">复制失败</strong>',
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
      }
    },
    /**
     * 获取问卷二维码
     */
    getSurveyQRCode() {
      const data = {};
      data.surveyUrl = this.surveyUrl + "&qrcode=true";
      this.$http.post("publish/getQRCode", QS.stringify(data)).then(res => {
        this.imageQRCode = res.data;
      });
    },
    /**
     * 设定问卷结束时间
     */
    setEndAnswerDate() {
      const survey = {};
      survey.id = this.surveyId;
      survey.enHandle = this.endDateSetting;
      if (this.endDateSetting == 1) {
        if (this.enAnDate == null) return;
        survey.enAnDate = new Date(this.enAnDate).format("yyyy-MM-dd hh:mm:ss");
      }
      this.$http.post("save/survey/info", survey).then(() => {
        this.$message({
          message: '<strong style="color:#333">设置已生效</strong>',
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
      });
    },
    /**
     * 获取问卷信息（查看问卷结束时间的设置）
     */
    getSurveyStatus() {
      this.$http.get(`survey/status/${this.surveyId}`).then(res => {
        this.endDateSetting = res.data.enHandle;
        this.enAnDate = res.data.enAnDate;
      });
    }
  },

  mounted() {
    this.surveyId = this.$route.query.surveyId;
    this.surveyUrl = `${this.$http.domain}/#/answer/pc/?surveyId=${this.surveyId}`;
    this.getSurveyQRCode();
    this.getSurveyStatus();
  }
};
</script>

<style scoped>
.publish {
  position: fixed;
  top: 122px;
  left: 0;
  right: 0;
  bottom: 0;
  overflow-x: auto;
  overflow-y: scroll;
  background-color: #f4f6f9;
}
.card {
  width: 1100px;
  height: 100%;
  margin: 20px auto;
}
.share-card,
.setting-card {
  padding: 30px 20px;
}
h3 {
  margin-top: 0;
}
/* .preview-card {
  display: flex;
  align-items: center;
  justify-content: center;
} */
.mobile-preview {
  height: 550px;
  background-size: contain;
  background-repeat: no-repeat;
  background-image: url("~@/assets/image/bg_perview_mobile_no_shadow.png");
  /* display: flex;
  align-items: center;
  justify-content: center; */
}
#preview_mobile_iframe {
  position: absolute;
  /* width: 312px; */
  width: 203px;
  height: 362px;
  margin-top: 83px;
  margin-left: 55px;
  /* top: 87px;
  left: 19px; */
}
/* 滚动条样式 start */
.publish::-webkit-scrollbar {
  width: 10px;
}
.publish::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.publish::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
</style>