<template>
  <div class="edit">
    <fullscreen ref="fullscreen" @change="fullscreenChange">
      <div class="edit-sidebar" ref="sidebar">
        <a class="btn_sidebar_switch" v-show="btnSidebar" @click="openOrCloseSideBar">
          {{btnSideBarName}}
          <i :class="btnSideBarIcon"></i>
        </a>
        <div class="edit-left-nav">
          <ul>
            <li>
              <a @click="toolbarNav = 1">
                <i class="el-icon-menu" :class="{currentNav:toolbarNav==1}"></i>题型
              </a>
            </li>
            <li>
              <a @click="toolbarNav = 2">
                <i class="el-icon-notebook-2" :class="{currentNav:toolbarNav==2}"></i>题库
              </a>
            </li>
            <li>
              <a @click="toolbarNav = 3">
                <i class="el-icon-document" :class="{currentNav:toolbarNav==3}"></i>大纲
              </a>
            </li>
          </ul>
        </div>
        <!-- 基础题型 -->
        <div class="edit-left-questbox" v-show="toolbarNav==1">
          <h3>基础题型</h3>
          <div class="content">
            <el-button class="qs-btn" plain size="medium" @click="addQuestion('radio')">
              <i class="iconfont">&#xe667;</i>单 选 题
            </el-button>
            <el-button class="qs-btn" plain size="medium" @click="addQuestion('checkbox')">
              <i class="iconfont">&#xe669;</i>多 选 题
            </el-button>
            <el-button class="qs-btn" plain size="medium" @click="addQuestion('textarea')">
              <i class="iconfont">&#xe668;</i>文 本 题
            </el-button>
            <el-button class="qs-btn" plain size="medium" @click="addQuestion('rate')">
              <i class="el-icon-star-off" style="margin-right:6px"></i>评 分 题
            </el-button>
          </div>
        </div>
        <!-- 题库列表：用户收藏和系统提供 -->
        <div class="edit-left-questbox" v-show="toolbarNav==2">
          <h3>题库</h3>
          <div class="content">
            <el-collapse>
              <!-- 我的收藏 -->
              <el-collapse-item name="1">
                <template slot="title">我的收藏</template>
                <div
                  class="quest-bank-item"
                  v-for="(item, index) in questionBank.user.question_list"
                  :key="index"
                  @click="addQuestionOfBank(item)"
                >
                  <div style="width:162px">
                    <span class="words-ellipsis" style="width:120px">{{item.content.title}}</span>
                    <el-popover placement="right" width="200" trigger="hover" :close-delay="0">
                      <div style="padding:15px">
                        <span style="color:#333">{{item.content.title}}</span>
                        <span
                          style="color:#999;margin-left:10px;"
                        >[{{item.content.type | typeFilter(types)}}]</span>
                        <div
                          v-for="(option, oindx) in item.content.options"
                          :key="oindx"
                        >{{option.value}}</div>
                      </div>
                      <i slot="reference" class="el-icon-info quest-bank-info-btn"></i>
                    </el-popover>
                    <i
                      class="el-icon-error quest-bank-del-btn"
                      @click.stop="removeQuestionOfBank(item, index)"
                    ></i>
                  </div>
                </div>
              </el-collapse-item>
              <!-- 系统预设题库 -->
              <el-collapse-item
                v-for="(group, key, gindx) in questionBank.system.group_list"
                :key="gindx"
                :name="gindx"
              >
                <template slot="title">{{key}}</template>
                <div class="quest-bank-item" v-for="(groupId, i) in group" :key="i">
                  <div
                    v-for="(question, qindx) in questionBank.system.question_list"
                    :key="qindx"
                    @click="addQuestionOfBank(question)"
                  >
                    <div style="width:160px" v-if="question.qsItemId === groupId">
                      <span class="words-ellipsis" style="width:140px">{{question.content.title}}</span>
                      <el-popover placement="right" width="200" trigger="hover" :close-delay="0">
                        <div style="padding:15px">
                          <span style="color:#333">{{question.content.title}}</span>
                          <span
                            style="color:#999;margin-left:10px;"
                          >{{question.content.type | typeFilter(types)}}</span>
                          <div
                            v-for="(option, oindx) in question.content.options"
                            :key="oindx"
                          >{{option.value}}</div>
                        </div>
                        <i slot="reference" class="el-icon-info quest-bank-info-btn"></i>
                      </el-popover>
                    </div>
                  </div>
                </div>
              </el-collapse-item>
            </el-collapse>
          </div>
        </div>
        <!-- 大纲视图 -->
        <div class="edit-left-questbox" v-show="toolbarNav==3">
          <h3>大纲视图</h3>
          <div class="content">
            <el-timeline>
              <el-timeline-item
                v-for="(qsitem, index) in survey.qsitems"
                :icon="qsitem.type | iconFilter(icons)"
                :key="index"
                color="#666"
                size="large"
              >
                <div class="words-ellipsis" style="width:150px">{{index+1}}. {{qsitem.title}}</div>
                <template slot="icon"></template>
              </el-timeline-item>
            </el-timeline>
          </div>
        </div>
      </div>
      <div class="edit-contain" ref="contain">
        <!-- 右上角按钮组 -->
        <el-button-group style="right:35px;position:fixed;">
          <el-button size="mini" icon="el-icon-share" plain @click="share"></el-button>
          <el-button size="mini" icon="el-icon-full-screen" plain @click="toggle"></el-button>
        </el-button-group>
        <!-- 问卷内容 -->
        <el-card class="survey" v-if="creating" v-loading="loading">
          <!-- 标题 -->
          <div class="title">
            <h1
              @click="editSurveyTitle()"
              v-show="!isEditTitle"
              style="text-align:center"
            >{{survey.title}}</h1>
            <h1 v-show="isEditTitle">
              <el-input
                ref="title"
                @blur="blurSurveyTitle()"
                maxlength="20"
                show-word-limit
                :clearable="true"
                placeholder="请输入标题"
                v-model="survey.title"
              ></el-input>
            </h1>
          </div>
          <!-- 简介 -->
          <div class="intro">
            <p @click="editSurveyIntro()" v-show="!isEditIntro">{{survey.introduction}}</p>
            <p v-show="isEditIntro">
              <el-input
                ref="intro"
                type="textarea"
                @blur="blurSurveyIntro()"
                :autosize="{ minRows: 2, maxRows: 2}"
                maxlength="100"
                show-word-limit
                placeholder="请输入简介"
                v-model="survey.introduction"
              ></el-input>
            </p>
          </div>

          <transition-group tag="div">
            <div
              class="quest-list"
              :class="{'animated':true,'shake':editing==index, 'choose':isEditQuest[index]==true}"
              v-for="(item, index) in survey.qsitems"
              :key="index"
              @click="editSurveyQuestion(index)"
              v-dragging="{ item:item, list:survey.qsitems, group:'quest' }"
              :draggable="isEditQuest[index]==true?false:true"
            >
              <div class="qs-contain">
                <div v-show="!isEditQuest[index]">
                  <!-- 单选题 -->
                  <div v-if="item.type === 'radio'">
                    <p>
                      {{index+1}}. {{item.title}}
                      <span class="must" v-if="item.isRequired == 1">*</span>
                    </p>
                    <el-radio-group v-model="radioValue">
                      <el-radio
                        class="block"
                        :label="option.id"
                        v-for="(option, i) in item.options"
                        :key="i"
                        v-show="survey.qsitems[index].options[i].visibility != 0"
                      >{{option.value}}</el-radio>
                    </el-radio-group>
                  </div>
                  <!-- 多选题 -->
                  <div v-else-if="item.type === 'checkbox'">
                    <p>
                      {{index+1}}. {{item.title}}
                      <span class="must" v-if="item.isRequired == 1">*</span>
                    </p>
                    <el-checkbox-group v-model="checkboxValue">
                      <el-checkbox
                        class="block"
                        :label="option.id"
                        v-for="(option, i) in item.options"
                        :key="i"
                        v-show="survey.qsitems[index].options[i].visibility != 0"
                        style="width:20px;"
                      >{{option.value}}</el-checkbox>
                    </el-checkbox-group>
                  </div>
                  <!-- 文本题 -->
                  <div v-else-if="item.type === 'textarea'">
                    <p>
                      {{index+1}}. {{item.title}}
                      <span class="must" v-if="item.isRequired == 1">*</span>
                    </p>
                    <el-input type="textarea" :autosize="{ minRows: 5, maxRows: 5}"></el-input>
                  </div>
                  <!-- 评分题 -->
                  <div v-else-if="item.type === 'rate'">
                    <p>
                      {{index+1}}. {{item.title}}
                      <span class="must" v-if="item.isRequired == 1">*</span>
                    </p>
                    <el-rate></el-rate>
                  </div>
                </div>
                <!-- 题目操作面板 -->
                <div class="qs-contain" v-show="!isEditQuest[index]" style="margin-top:20px">
                  <el-button
                    size="mini"
                    plain
                    style="color:#E6A23C"
                    class="question-btn"
                    icon="el-icon-star-off"
                    @click.stop="starQuestion(item)"
                  >收藏</el-button>
                  <el-button
                    size="mini"
                    plain
                    class="question-btn"
                    icon="el-icon-download"
                    @click.stop="toBottomQuestion(index)"
                  >最后</el-button>
                  <el-button
                    size="mini"
                    plain
                    class="question-btn"
                    icon="el-icon-upload2"
                    @click.stop="toTopQuestion(index)"
                  >最前</el-button>
                  <el-button
                    size="mini"
                    plain
                    class="question-btn"
                    icon="el-icon-bottom"
                    @click.stop="swapQuestion(index, index+1)"
                  >下移</el-button>
                  <el-button
                    size="mini"
                    plain
                    class="question-btn"
                    icon="el-icon-top"
                    @click.stop="swapQuestion(index, index-1)"
                  >上移</el-button>
                  <el-button
                    size="mini"
                    plain
                    style="color:#F56C6C"
                    class="question-btn"
                    icon="el-icon-delete"
                    @click.stop="delSurveyQuestion(index)"
                  >删除</el-button>
                  <!-- <el-button
                  size="mini"
                  plain
                  class="question-btn"
                  icon="el-icon-copy-document"
                  @click.stop="copyQuestion(item, index)"
                  >复制</el-button>-->
                  <el-button size="mini" plain class="question-btn" icon="el-icon-edit-outline">编辑</el-button>
                </div>

                <!-- 编辑模式 start -->
                <div v-show="isEditQuest[index]">
                  <el-input
                    class="inlineBlock"
                    :autosize="{ minRows: 1}"
                    show-word-limit
                    clearable
                    placeholder="请输入题目"
                    v-model="item.title"
                  >
                    <template slot="prepend">{{item.type | typeFilter(types)}}</template>
                  </el-input>
                  <div
                    v-for="(option, i) in item.options"
                    :key="i"
                    v-show="survey.qsitems[index].options[i].visibility != 0"
                  >
                    <el-input
                      class="inlineBlock"
                      v-model="option.value"
                      clearable
                      style="width:82%;margin-right:1%;"
                    >
                      <template slot="prepend">选项</template>
                    </el-input>
                    <div class="toolbar" style="float:right;">
                      <el-button icon="el-icon-plus" circle @click="addOption(index,i)"></el-button>
                      <el-button icon="el-icon-minus" circle @click="delOption(index,i)"></el-button>
                    </div>
                  </div>
                  <div
                    v-if="item.type === 'radio' || item.type === 'checkbox'"
                    style="display:inline-block"
                  >
                    <el-button
                      class="inlineBlock"
                      @click="addOption(index)"
                      style="cursor:pointer;"
                    >添加选项</el-button>
                    <el-button
                      class="inlineBlock"
                      @click="addOtherOption(index)"
                      style="cursor:pointer;"
                    >添加「其他」项</el-button>
                  </div>
                  <el-switch
                    class="inlineBlock"
                    style="float:right;margin:15px 0px;"
                    v-model="item.isRequired"
                    :active-value="1"
                    :inactive-value="0"
                    inactive-text="此题必填"
                  ></el-switch>
                  <el-button
                    class="inlineBlock"
                    @click.stop="saveSurveyQuestion(index)"
                    type="primary"
                    style="width:100%; cursor:pointer;"
                  >完 成 编 辑</el-button>
                </div>
                <!-- 编辑模式 end -->
              </div>
            </div>
          </transition-group>
        </el-card>
      </div>
    </fullscreen>
    <!-- 选择问卷创建类型对话框 -->
    <el-dialog
      title="请选择问卷创建类型"
      width="730px"
      style="font-weight:bold"
      :modal="false"
      :visible.sync="createDialogVisible"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      :show-close="false"
      append-to-body
    >
      <div>
        <el-row>
          <el-col :span="8">
            <div class="grid-content" :class="{'isChoose':chooseType==0}" @click="chooseType = 0">
              <el-card class="item blank" shadow="hover">
                <img src="@/assets/image/blank.png" />
                <p>创建空白问卷</p>
                <p>从一份空白问卷开始创建</p>
              </el-card>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="grid-content" :class="{'isChoose':chooseType==1}" @click="chooseType = 1">
              <el-card class="item template" shadow="hover">
                <img src="@/assets/image/template.png" />
                <p>选择问卷模板</p>
                <p>使用其他用户公开的问卷</p>
              </el-card>
            </div>
          </el-col>
          <!-- <el-col :span="8">
            <div class="grid-content" :class="{'isChoose':chooseType==2}" @click="chooseType = 2">
                <el-card class="item import" shadow="hover">
                    <img src="@/assets/image/import.png">
                    <p>文本编辑问卷</p>
                    <p>自由编辑文本自动生成问卷</p>
                </el-card>
            </div>
          </el-col>-->
        </el-row>
      </div>
      <div slot="footer">
        <el-button @click="cancelCreate()">取消</el-button>
        <el-button type="primary" @click="createSurvey()">
          <span v-show="chooseType == 0">立即创建</span>
          <span v-show="chooseType == 1">下一步</span>
        </el-button>
      </div>
    </el-dialog>
    <!-- 公开问卷对话框 -->
    <el-dialog
      title="设置问卷标签"
      width="580px"
      style="font-weight:bold"
      :visible.sync="tagDialogVisible"
      :close-on-click-modal="false"
      :close-on-press-escape="false"
      :show-close="false"
      append-to-body
    >
      <div style="width:100%">
        <el-tag
          type="info"
          v-for="(tag, index) in tags"
          :key="index"
          closable
          :disable-transitions="false"
          @close="deleteTag(index)"
        >{{tag.tagName}}</el-tag>
        <el-input
          class="input-new-tag"
          v-if="tagInputVisible"
          v-model="tagInputValue"
          ref="saveTagInput"
          size="small"
          @keyup.enter.native="addTag"
          @blur="addTag"
        ></el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showTagInput">+ 添加新标签</el-button>
      </div>
      <div slot="footer">
        <el-button type="primary" @click="tagDialogVisible = false">关闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState } from "vuex";
import QS from "qs";
import fullscreen from "vue-fullscreen";
import Vue from "vue";
Vue.use(fullscreen);

export default {
  data() {
    return {
      surveyId: "",
      createDialogVisible: false,
      tagDialogVisible: false,
      creating: false,
      chooseType: 0,
      questionBank: {
        system: {},
        user: {}
      },
      // tool
      isOpenSideBar: true,
      btnSidebar: true,
      btnSideBarName: "收起工具栏",
      btnSideBarIcon: "el-icon-s-fold",
      toolbarNav: 1,
      // show
      survey: {},
      radioValue: "",
      checkboxValue: [],
      loading: true,
      fullscreen: false,
      // tag
      tags: [],
      tagInputVisible: false,
      tagInputValue: "",
      // edit
      isEditTitle: false,
      isEditIntro: false,
      isEditQuest: [],
      editing: null,
      oldVal: "",
      oldObj: {},
      // icon
      icons: [
        { value: "radio", text: "iconfont icon-danxuan" },
        { value: "checkbox", text: "iconfont icon-duoxuan" },
        { value: "textarea", text: "iconfont icon-duohangwenben" },
        { value: "rate", text: "el-icon-star-off" }
      ],
      types: [
        { value: "radio", text: "单选题" },
        { value: "checkbox", text: "多选题" },
        { value: "textarea", text: "文本题" },
        { value: "rate", text: "评分题" }
      ],
      // drag
      preQsitems: []
    };
  },

  filters: {
    // 过滤大纲视图题型的icon图标
    iconFilter(value, icons) {
      for (let i = 0; i < icons.length; i++) {
        if (value == icons[i].value) {
          return icons[i].text;
        }
      }
    },
    // 过滤题库题目预览的类型
    typeFilter(value, types) {
      for (let i = 0; i < types.length; i++) {
        if (value == types[i].value) {
          return types[i].text;
        }
      }
    }
  },

  methods: {
    /**
     * 取消创建问卷
     */
    cancelCreate() {
      this.createDialogVisible = false;
      this.$router.go(-1);
    },
    /**
     * 创建问卷
     */
    createSurvey() {
      if (this.chooseType == 0) {
        this.createDialogVisible = false;
        this.creating = true;
        const surveydata = {};
        surveydata.creator = this.uid;
        this.$http.post("survey/new/blank", surveydata).then(res => {
          // 当前页地址栏增加surveyId，刷新页面
          // 防止刷新丢失数据和按钮不显示
          this.$router.push({
            query: {
              surveyId: res.data
            }
          });
          this.$router.go(0);
        });
      } else if (this.chooseType == 1) {
        this.$router.push("/home/template");
      }
    },
    /**
     * 展开与关闭工具栏
     */
    openOrCloseSideBar() {
      if (this.isOpenSideBar) {
        this.isOpenSideBar = false;
        this.btnSideBarName = "展开工具栏";
        this.btnSideBarIcon = "el-icon-s-unfold";
        this.$refs.sidebar.style = "left: -251px";
        this.$refs.contain.style = "left: 0px";
      } else {
        this.isOpenSideBar = true;
        this.btnSideBarName = "收起工具栏";
        this.btnSideBarIcon = "el-icon-s-fold";
        this.$refs.sidebar.style = "left: 0px";
        this.$refs.contain.style = "left: 251px";
      }
    },
    /**
     * 获取问卷信息
     */
    getSurvey() {
      this.$http
        .get("survey/" + this.surveyId)
        .then(res => {
          this.loading = false;
          this.survey = res.data;
          const qsitems = res.data.qsitems;
          // 初始化isEditQuest的值
          for (const key in qsitems) {
            this.$set(this.isEditQuest, key, false);
          }
        })
        .catch(() => {
          this.loading = false;
        });
    },
    /**
     * 添加问卷题目
     */
    addQuestion(type, question) {
      // 当前题目未保存不能添加
      for (const key in this.isEditQuest) {
        if (this.isEditQuest[key] == true) {
          this.editing = key; // 添加抖动动画
          setTimeout(() => {
            this.editing = null;
          }, 1000);
          return; // 结束往下执行
        }
      }
      const questdata = {};
      questdata.type = type;
      questdata.isRequired = 0;
      questdata.surveyId = this.survey.id;
      // 题目排序
      let length = this.survey.qsitems.length;
      questdata.number = length + 1;
      if (length > 0) {
        let lastOrderId = this.survey.qsitems[length - 1].orderId;
        questdata.orderId = lastOrderId + 1;
      } else {
        // 空白问卷
        questdata.orderId = 1000;
      }
      if (question == null) {
        switch (type) {
          case "radio":
            questdata.title = "这是一道单选题";
            questdata.options = [
              { value: "选项A", orderId: 0, visibility: 1 },
              { value: "选项B", orderId: 1, visibility: 1 }
            ];
            break;
          case "checkbox":
            questdata.title = "这是一道多选题";
            questdata.options = [
              { value: "选项A", orderId: 0, visibility: 1 },
              { value: "选项B", orderId: 1, visibility: 1 }
            ];
            break;
          case "textarea":
            questdata.title = "这是一道文本题";
            break;
          case "rate":
            questdata.title = "这是一道评分题";
            break;
          default:
            break;
        }
      } else {
        questdata.title = question.title;
        questdata.options = question.options;
      }

      this.$http.saveSurvey("question/new", questdata).then(() => {
        // questdata.id = res.data.id;
        // questdata.qsItemId = res.data.qsItemId;
        this.survey.qsitems.push(questdata);
        // 滚动到末尾增加的题目
        this.$nextTick(() => {
          this.$refs.contain.scrollTop = this.$refs.contain.scrollHeight;
          this.getSurvey(); //重新获取数据
        });
      });
    },
    /**
     * 删除问卷题目
     */
    delSurveyQuestion(index) {
      let message = `确定要将此题目彻底删除吗？`;
      this.$confirm(message, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        // 提交删除请求
        const questdata = {};
        questdata.id = this.survey.qsitems[index].id;
        questdata.type = this.survey.qsitems[index].type;
        questdata.qsItemId = this.survey.qsitems[index].qsItemId;
        questdata.surveyId = this.survey.id;
        let length = this.survey.qsitems.length - 1;
        questdata.number = length;
        this.$http.saveSurvey("question/del", questdata).then(() => {
          this.survey.qsitems.splice(index, 1);
        });
      });
    },
    /**
     * 编辑问卷题目
     */
    editSurveyQuestion(index) {
      // 当前题目未保存不能编辑其它题
      for (const key in this.isEditQuest) {
        if (this.isEditQuest[key] == true) {
          if (key == index) return; // 结束往下执行
          if (key != index) {
            this.editing = key; // 添加抖动动画
            setTimeout(() => {
              this.editing = null;
            }, 1000);
            return; // 结束往下执行
          }
        }
      }
      // 打开编辑模式
      this.$set(this.isEditQuest, index, true);
      // 拷贝修改前的数据
      const qsitems = this.survey.qsitems;
      for (const key in qsitems) {
        if (key == index) {
          this.oldObj = JSON.parse(JSON.stringify(this.survey.qsitems[key]));
        }
      }
    },
    /**
     * 保存问卷题目
     */
    saveSurveyQuestion(index) {
      let change = false;
      const oldQsitem = this.oldObj;
      const qsitems = this.survey.qsitems;

      for (const key in qsitems) {
        if (key == index) {
          let title = qsitems[key].title;
          let options = qsitems[key].options;
          let isRequired = qsitems[key].isRequired;

          const questdata = {};
          questdata.type = qsitems[key].type;
          questdata.surveyId = this.survey.id;

          // 保存题目或选项
          if (title != oldQsitem.title) {
            // 题目有改动
            change = true;
            questdata.qsItemId = qsitems[key].qsItemId;
            questdata.title = qsitems[key].title;
          }
          if (options != null) {
            if (options.length != oldQsitem.options.length) {
              // 选项数组长度有变，直接提交全部选项（删除不改变原数组长度）
              change = true;
              for (const key in options) {
                // 只有增加会改变数组长度，只需要在这位置分配orderId
                options[key].orderId = key;
              }
              questdata.options = options;
            } else if (options.length == oldQsitem.options.length) {
              // 若数组长度未变，一一比对选项的值
              for (const key in options) {
                // 选项的值有改动，提交全部选项
                if (
                  options[key].value != oldQsitem.options[key].value ||
                  options[key].visibility != oldQsitem.options[key].visibility
                ) {
                  change = true;
                  questdata.options = options;
                }
              }
            }
          }
          // 必填属性有变化
          if (isRequired != oldQsitem.isRequired) {
            change = true;
            questdata.id = qsitems[key].id;
            questdata.isRequired = qsitems[key].isRequired;
          }
          if (change) this.$http.saveSurvey("question/save", questdata);
        }
      }
      // axaj成功后关闭编辑模式
      this.$set(this.isEditQuest, index, false);
    },
    /**
     * 编辑问卷标题
     */
    editSurveyTitle() {
      this.isEditTitle = true;
      this.$nextTick(() => {
        this.$refs["title"].focus();
      });
      this.oldVal = this.survey.title;
    },
    /**
     * 保存问卷标题
     */
    blurSurveyTitle() {
      const surveydata = {};
      if (this.survey.title.length == 0) {
        alert();
        return;
      } else {
        if (this.survey.title !== this.oldVal) {
          surveydata.id = this.survey.id;
          surveydata.title = this.survey.title;
          this.$http.saveSurvey("save/survey/info", surveydata);
        }
      }
      this.isEditTitle = false;
    },
    /**
     * 编辑问卷简介
     */
    editSurveyIntro() {
      this.isEditIntro = true;
      this.$nextTick(() => {
        this.$refs["intro"].focus();
      });
      this.oldVal = this.survey.introduction;
    },
    /**
     * 保存问卷简介
     */
    blurSurveyIntro() {
      this.isEditIntro = false;
      const surveydata = {};
      if (this.survey.introduction !== this.oldVal) {
        surveydata.id = this.survey.id;
        surveydata.introduction = this.survey.introduction;
        this.$http.saveSurvey("save/survey/info", surveydata);
      }
    },
    /**
     * 添加选项
     */
    addOption(index, i) {
      const qsitem = this.survey.qsitems[index];
      if (i == null) {
        i = 0;
      } //qsitem.options.length + 1
      else {
        i++;
      }
      qsitem.options.splice(i, 0, {
        value: "",
        qsItemId: qsitem.qsItemId,
        visibility: 1
      });
    },
    /**
     * 删除选项
     */
    delOption(index, i) {
      const qsitem = this.survey.qsitems[index];
      // 记录需要删除的选项
      if (qsitem.options[i].id != null) {
        qsitem.options[i].visibility = 0;
      } else {
        qsitem.options.splice(i, 1);
      }
    },
    /**
     * 添加其他选项
     */
    addOtherOption(index) {
      const qsitem = this.survey.qsitems[index];
      let last = qsitem.options.length;
      qsitem.options.splice(last, 0, {
        value: "其他 ____",
        qsItemId: qsitem.qsItemId,
        visibility: 1
      });
    },
    /**
     * 用于编辑页面全屏显示
     */
    toggle() {
      this.btnSidebar = false;
      this.$refs["sidebar"].style = "top:0";
      this.$refs["contain"].style = "top:0";
      this.$refs["fullscreen"].toggle();
    },
    /**
     * 全屏编辑
     */
    fullscreenChange(fullscreen) {
      this.fullscreen = fullscreen;
      if (this.fullscreen == false) {
        this.btnSidebar = true;
        this.$refs["sidebar"].style = "top:122px";
        this.$refs["contain"].style = "top:122px";
      }
    },
    /**
     * 收藏题目
     */
    starQuestion(item) {
      const data = {};
      data.belongId = this.uid;
      data.qsItemId = item.qsItemId;
      data.type = item.type;
      let newQsItemId = "";
      this.$http.post("star_question", data).then(res => {
        this.$message({
          message: '<strong style="color:#333">收藏成功</strong>',
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
        newQsItemId = res.data;
        // 页面显示同步
        this.questionBank.user.question_list.unshift({
          qsItemId: newQsItemId,
          content: { title: item.title, type: item.type, options: item.options }
        });
      });
    },
    /**
     * 添加题库的题目
     */
    addQuestionOfBank(item) {
      const question = {};
      question.title = item.content.title;
      question.options = item.content.options;
      this.addQuestion(item.content.type, question);
    },
    /**
     * 移除收藏题目
     */
    removeQuestionOfBank(item, index) {
      this.$confirm(`确认要删除这道题目吗？`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消"
      }).then(() => {
        const data = {};
        data.type = item.content.type;
        data.qsItemId = item.qsItemId;
        this.$http.post("remove_star_question", QS.stringify(data)).then(() => {
          const questionList = this.questionBank.user.question_list;
          questionList.splice(index, 1);
        });
      });
    },
    /**
     * 获取题库列表
     */
    getQuestionBank() {
      // 获取系统题库
      this.$http.post(`question_system_list_get`).then(res => {
        this.questionBank.system = res.data;
      });
      // 获取用户收藏题目
      this.$http.post(`question_user_list_get/${this.uid}`).then(res => {
        this.questionBank.user = res.data;
      });
    },

    // /**
    //  * 复制题目到下一项
    //  */
    // copyQuestion(item, index) {
    //   const qsItem = JSON.parse(JSON.stringify(item));
    //   qsItem.surveyId = this.surveyId;
    //   qsItem.orderId = item.orderId + 1; // 排序
    //   this.$http.saveSurvey("question/new", qsItem).then(() => {
    //     this.survey.qsitems.splice(index, 0, qsItem);
    //   });
    // },

    /**
     * 上移,下移：交换题目位置
     */
    swapQuestion(from, to) {
      const qsitems = this.survey.qsitems;
      const fromQuest = qsitems[from];
      const toQuest = qsitems[to];

      if (to < 0) {
        this.$message({
          message: "已经到顶了！",
          type: "error"
        });
        return;
      }
      if (to > qsitems.length - 1) {
        this.$message({
          message: "已经到底了！",
          type: "error"
        });
        return;
      }
      // 后端交换orderId
      const question = {};
      question.fromId = fromQuest.id;
      question.fromOid = fromQuest.orderId;
      question.toId = toQuest.id;
      question.toOid = toQuest.orderId;
      this.$http
        .saveSurvey("question/swap", QS.stringify(question))
        .then(() => {
          this.getSurvey();
        });
    },
    /**
     * 题目移到最前
     */
    toTopQuestion(index) {
      const qsitems = this.survey.qsitems;
      if (index == 0) {
        this.$message({
          message: "已经到顶了！",
          type: "error"
        });
        return;
      }
      const question = {};
      question.id = qsitems[index].id;
      question.orderId = qsitems[0].orderId - 1;
      this.$http
        .saveSurvey("question/jump", QS.stringify(question))
        .then(() => {
          this.getSurvey();
          this.$refs.contain.scrollTop = 0;
        });
    },
    /**
     * 题目移到最后
     */
    toBottomQuestion(index) {
      const qsitems = this.survey.qsitems;
      if (index == this.survey.qsitems.length - 1) {
        this.$message({
          message: "已经到底了！",
          type: "error"
        });
        return;
      }
      const question = {};
      question.id = qsitems[index].id;
      question.orderId = qsitems[qsitems.length - 1].orderId + 1;
      this.$http
        .saveSurvey("question/jump", QS.stringify(question))
        .then(() => {
          this.getSurvey();
          this.$refs.contain.scrollTop = this.$refs.contain.scrollHeight;
        });
    },
    /**
     * 设置公开问卷的标签
     */
    share() {
      this.tagDialogVisible = true;
      const data = {};
      data.surveyId = this.surveyId;
      this.$http.post("/tag/tags", QS.stringify(data)).then(res => {
        this.tags = res.data;
      });
    },
    /**
     * 删除标签
     */
    deleteTag(index) {
      let tag = {};
      tag.id = this.tags[index].id;
      this.$http.post("/tag/del", QS.stringify(tag)).then(() => {
        this.tags.splice(index, 1);
      });
    },
    /**
     * 打开新标签输入框
     */
    showTagInput() {
      this.tagInputVisible = true;
      this.$nextTick(() => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    /**
     * 添加标签
     */
    addTag() {
      if (this.tagInputValue) {
        let tag = {};
        tag.tagName = this.tagInputValue;
        tag.surveyId = this.surveyId;
        this.$http
          .post("/tag/add", tag)
          .then(() => {
            this.tags.push(tag);
          })
          .catch(() => {
            this.$message({
              message: "添加失败",
              type: "error"
            });
          });
      }
      this.tagInputVisible = false;
      this.tagInputValue = "";
    }
  },

  computed: {
    ...mapState({
      uid: state => state.uid
    })
  },

  mounted() {
    // 接收路由传来的问卷编号
    this.surveyId = this.$route.query.surveyId;
    // 向服务器请求问卷信息
    if (this.surveyId == null) {
      this.createDialogVisible = true;
    } else {
      this.creating = true;
      this.getSurvey(); //获取问卷信息
      this.getQuestionBank(); //获取题库列表
    }

    this.$dragging.$on("dragged", () => {
      this.preQsitems = JSON.parse(JSON.stringify(this.survey.qsitems));
    });

    this.$dragging.$on("dragend", () => {
      let isChange =
        JSON.stringify(this.preQsitems) === JSON.stringify(this.survey.qsitems);
      if (isChange) {
        let quests = [];
        this.survey.qsitems.forEach(quest => {
          let qu = {};
          qu.id = quest.id;
          qu.orderId = quest.orderId;
          quests.push(qu);
        });
        this.$http.saveSurvey("/question/reorder", quests);
      }
      this.preQsitems = [];
    });
  },

  beforeRouteLeave(to, from, next) {
    for (const key in this.isEditQuest) {
      if (this.isEditQuest[key] == true) {
        const answer = window.confirm("系统可能不会保存您所做的更改。");
        if (answer) {
          next();
        } else {
          next(false);
          return;
        }
      }
    }
    next();
  }
};
</script>

<style>
.center-msgbox {
  min-width: 100px;
  background-color: #fff;
}
.survey .el-card__body,
.modifyPanel .el-card__body {
  padding: 0 !important;
}
.el-collapse-item__header {
  padding-left: 10px;
}
.el-collapse-item__content {
  padding-left: 10px;
}
</style>
<style scoped>
.el-timeline {
  padding-top: 15px;
  padding-left: 15px;
}
/* 左侧编辑工具栏 start */
.edit-sidebar {
  position: fixed;
  top: 122px;
  left: 0;
  bottom: 0;
  width: 251px;
  border-right: 1px solid #e0e0e0;
  background-color: #fafafa;
  z-index: 10;
  transition: 0.3s;
}
.btn_sidebar_switch {
  width: 110px;
  height: 35px;
  line-height: 35px;
  border-radius: 0 35px 35px 0;
  padding-right: 10px;
  background-color: #fafafa;
  position: absolute;
  left: 251px;
  cursor: pointer;
  text-align: right;
  user-select: none;
  border: 1px solid #e0e0e0;
  border-left: none;
  font-size: 14px;
  color: #4a4a4a;
}
.btn_sidebar_switch i {
  margin-left: 10px;
  margin-bottom: 3px;
  vertical-align: middle;
  font-size: 22px;
  color: #4a4a4a;
}
.edit-sidebar .edit-left-nav {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  z-index: 11;
  width: 60px;
  background-color: #fff;
  border-right: 1px solid #d8d8d8;
}
.edit-sidebar .edit-left-nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
.edit-sidebar .edit-left-nav ul li {
  width: 40px;
  height: 55px;
  margin: 10px 10px 30px 10px;
  text-align: center;
  font-size: 12px;
  cursor: pointer;
}
.currentNav {
  color: #fff !important;
  background-color: #409eff;
  transition: 0.2s;
}
.currentNav:hover {
  background-color: #409eff !important;
}
.edit-sidebar .edit-left-nav ul li {
  color: #484848;
}
.edit-sidebar .edit-left-nav ul li i {
  color: #484848;
  font-size: 24px;
  padding: 5px;
  border-radius: 7px;
}
.edit-sidebar .edit-left-nav ul li i:hover {
  background-color: #eee;
}
.edit-sidebar .edit-left-questbox {
  position: absolute;
  top: 0;
  left: 60px;
  bottom: 0;
  width: 190px;
}
.edit-left-questbox h3 {
  color: #333;
  margin: 12px;
  font-weight: normal;
  position: fixed;
}
.edit-left-questbox .content {
  margin-top: 50px;
  /* width: 95%; */
  height: calc(100% - 50px);
  overflow-x: hidden;
  overflow-y: scroll;
}
.edit-left-questbox .qs-btn {
  margin: 10px 10%;
  width: 80%;
}
.edit-left-questbox .header-icon {
  margin-left: 5px;
}
.edit-left-questbox .content::-webkit-scrollbar {
  display: none;
}
/* 题库面板样式 start */
.words-ellipsis {
  display: inline-block; /* 关键 */
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.quest-bank-info-btn {
  float: right;
  font-size: 16px;
  line-height: 30px;
  color: #999;
  cursor: pointer;
  transition: 0.3s;
}
.quest-bank-info-btn:hover {
  color: #409eff;
}
.quest-bank-del-btn {
  float: right;
  font-size: 16px;
  line-height: 30px;
  color: #999;
  cursor: pointer;
  transition: 0.3s;
  margin-right: 3px;
}
.quest-bank-del-btn:hover {
  color: #ff6161;
}
.quest-bank-item {
  cursor: pointer;
  padding-left: 5px;
  margin-right: 5px;
  height: 30px;
  line-height: 30px;
}
.quest-bank-item:hover {
  background-color: #f5f5f5;
}
/* 题库面板样式 end */
/* 左侧编辑工具栏 end */
/* 主工作区 start */
.edit-contain {
  position: fixed;
  top: 122px;
  bottom: 0;
  left: 251px;
  right: 0;
  padding: 20px 20px 50px 20px;
  transition: 0.3s;
  background-color: #f4f6f9;
  overflow: auto;
}
/* 滚动条样式 start */
.edit-contain::-webkit-scrollbar {
  width: 10px;
}
.edit-contain::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.edit-contain::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
.edit-contain .survey,
.modifyPanel {
  max-width: 980px;
  min-width: 730px;
  margin: 40px auto;
  padding-top: 50px;
  padding-bottom: 100px;
}
/* 编辑模式选择面板 start */
.modifyPanel h1 {
  color: #ebf0f5;
  font-size: 56px;
  font-weight: 500;
  margin: 15px;
  height: 48px;
  display: inline-block;
}
.modifyPanel .pattern {
  display: inline-block;
  background-color: #fafafa;
  width: 100%;
  padding: 20px 0 20px 10px;
}
.modifyPanel .choose_temp_modify_type {
  border: 3px solid #409eff;
}
.modifyPanel .choose_temp_modify_type h1 {
  color: #409eff;
}
.pattern p {
  margin: 0;
  padding: 5px 0px;
  text-align: left;
}
.pattern p:nth-child(1) {
  color: #333;
  font-size: 16px;
}
.pattern p:nth-child(2) {
  color: #666;
  font-size: 12px;
}
/* 编辑模式选择面板 end */
.edit-contain .survey .title,
.intro {
  padding: 1px 35px;
  margin: 5px 0px;
  border-top: 1px solid #fff;
  border-bottom: 1px solid #fff;
}
.edit-contain .survey .title h1,
.intro p {
  color: #333;
  font-weight: 500;
  margin: 10px;
  padding: 10px;
  border: 1px solid #fff;
}
.edit-contain .survey .title:hover,
.intro:hover {
  background-color: #fafafa;
  border-top: 1px solid #e0e0e0;
  border-bottom: 1px solid #e0e0e0;
  cursor: text;
}
.edit-contain .survey .title:hover > h1,
.intro:hover > p {
  background-color: #fff;
  border: 1px solid #eaeaea;
}
.edit-contain .survey .quest-list {
  padding: 35px 55px;
  border-top: 1px solid #fff;
  border-bottom: 1px solid #fff;
  cursor: move;
}
.choose {
  border: 2px solid #409eff !important;
  border-radius: 4px;
  background-color: #fafafa;
  cursor: default !important;
}
.edit-contain .survey .quest-list:hover {
  background-color: #fafafa;
  border-top: 1px solid #e0e0e0;
  border-bottom: 1px solid #e0e0e0;
}
.question-btn {
  /* display: none; */
  visibility: hidden;
  float: right;
  padding: 7px;
  margin: 0 3px;
}
.edit-contain .survey .quest-list:hover .question-btn {
  /* display: block; */
  visibility: visible;
}
.edit-contain .survey .quest-list p {
  margin-top: 0;
}
.edit-contain .survey .quest-list p .must {
  color: #ff6161;
  font-size: 18px;
}
.quest-list .qs-contain {
  width: 100%;
  vertical-align: middle;
  display: inline-block;
  color: #444;
  font-size: 16px;
  font-weight: bold;
}
.inlineBlock {
  margin: 0 30px 10px 0;
  cursor: move;
}
.block {
  color: #333;
  display: block;
  margin: 0 0 20px 0;
  cursor: move;
}
/* 主工作区 end */
/* 图标库 start */
@font-face {
  font-family: "iconfont";
  src: url("../../../assets/iconfont/iconfont.eot");
  src: url("../../../assets/iconfont/iconfont.eot?#iefix")
      format("embedded-opentype"),
    url("../../../assets/iconfont/iconfont.woff") format("woff"),
    url("../../../assets/iconfont/iconfont.ttf") format("truetype"),
    url("../../../assets/iconfont/iconfont.svg#iconfont") format("svg");
}
.iconfont {
  margin-right: 5px;
  font-family: "iconfont" !important;
  font-size: 16px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
/* 图标库 end */
/* 创建问卷模态框 start */
.grid-content {
  padding: 0px;
  height: 280px;
  padding: 10px;
  cursor: pointer;
}
.item {
  height: 100%;
}
.item img {
  width: 100%;
}
.item p:nth-child(2) {
  color: #4f4f4f;
  font-size: 16px;
  text-align: center;
}
.item p:nth-child(3) {
  color: #4f4f4f;
  font-size: 13px;
  text-align: center;
}
.blank {
  background-color: #fbfbfb; /* #c2daf3 */
}
.template {
  background-color: #fbfbfb; /* #87a8d0 */
}
.import {
  background-color: #fbfbfb; /* #b9ceeb */
}
.isChoose {
  border: 3px solid #409eff;
}
/* 创建问卷模态框 end */
/* 模态框标签样式 start */
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
/* 模态框标签样式 end */
</style>