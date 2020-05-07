<template>
  <div class="mine" v-loading="loading">
    <div class="menu">
      <el-menu mode="horizontal">
        <el-menu-item>
          <div style="display:inline-block">
            <el-button size="mini" type="primary" @click="createBlankSurvey()">
              <i class="el-icon-plus" style="color:#fff"></i>空白问卷
            </el-button>
          </div>
        </el-menu-item>
        <el-menu-item style="float:right">
          <el-input v-model="search" size="mini" placeholder="输入关键字搜索" />
        </el-menu-item>
      </el-menu>
    </div>
    <div class="table">
      <div style="height:101%;">
        <el-table
          :data="surveyList.filter(surveyList => !search || surveyList.title.toLowerCase().includes(search.toLowerCase()))"
        >
          <el-table-column prop="public" width="35">
            <template slot-scope="scope">
              <i class="el-icon-share" v-if="scope.row.quote> 0" style="color:#3bb357"></i>
            </template>
          </el-table-column>
          <el-table-column prop="title" label="名称" width="300" sortable>
            <template slot-scope="scope">
              <el-link
                :underline="false"
                @click="handleEdit(scope.$index, scope.row)"
              >{{scope.row.title}}</el-link>
            </template>
          </el-table-column>
          <el-table-column prop="status" label="状态" align="center">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.status == 0" type="info">暂停回收</el-tag>
              <el-tag v-if="scope.row.status == 1">正在回收</el-tag>
            </template>
          </el-table-column>
          <el-table-column
            prop="createdDate"
            label="创建时间"
            sortable
            show-overflow-tooltip
            align="center"
          ></el-table-column>
          <el-table-column
            prop="updateDate"
            label="修改时间"
            sortable
            show-overflow-tooltip
            align="center"
          >
            <template
              slot-scope="scope"
            >修改于 {{new Date().getDateDiff(new Date(scope.row.updateDate))}}</template>
          </el-table-column>
          <el-table-column prop="recycle" label="回收量" align="right" width="120"></el-table-column>
          <el-table-column prop="quote" label="使用数" align="right" width="120"></el-table-column>
          <el-table-column prop="operate" label="操作" align="center" width="140">
            <template slot-scope="scope">
              <el-popover
                placement="bottom"
                width="200"
                trigger="click"
                visible-arrow
                :offset="-85"
              >
                <el-menu>
                  <el-menu-item
                    v-if="scope.row.status == 0"
                    @click="handlePublish(scope.$index, scope.row, 1)"
                  >开始回收</el-menu-item>
                  <el-menu-item
                    v-if="scope.row.status == 1"
                    @click="handlePublish(scope.$index, scope.row, 0)"
                  >暂停回收</el-menu-item>
                  <el-menu-item
                    @click="$router.push(`/home/design/publish?surveyId=${scope.row.id}`)"
                  >投放问卷</el-menu-item>
                  <el-menu-item @click="handleData(scope.$index, scope.row)">统计报表</el-menu-item>
                  <el-divider class="setting-divider"></el-divider>
                  <el-menu-item @click="handlePrint(scope.$index, scope.row)">
                    <span slot="title">打印</span>
                    <i class="el-icon-printer"></i>
                  </el-menu-item>
                  <el-menu-item @click="handleCopy(scope.$index, scope.row)">
                    <span slot="title">复制</span>
                    <i class="el-icon-copy-document"></i>
                  </el-menu-item>
                  <el-menu-item @click="handleEdit(scope.$index, scope.row)">
                    <span slot="title">编辑</span>
                    <i class="el-icon-edit"></i>
                  </el-menu-item>
                  <el-menu-item @click="handleDelete(scope.$index, scope.row)">
                    <span slot="title">删除</span>
                    <i class="el-icon-delete"></i>
                  </el-menu-item>
                  <el-menu-item @click="handleRefresh(scope.$index, scope.row)">
                    <span slot="title">清空答卷</span>
                    <i class="el-icon-refresh"></i>
                  </el-menu-item>
                </el-menu>
                <el-button size="mini" plain slot="reference" icon="el-icon-more"></el-button>
              </el-popover>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import QS from "qs";

export default {
  data() {
    return {
      loading: false,
      surveyList: [],
      search: ""
    };
  },
  methods: {
    ...mapMutations(["clearToken", "clearUser"]),

    handleEdit(index, row) {
      this.$router.push({
        path: "/home/design/edit",
        query: {
          surveyId: row.id
        }
      });
    },

    handleCopy(index, row) {
      this.$confirm(`确定要复制问卷《${row.title}》吗？`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消"
      }).then(() => {
        const data = {};
        data.surveyId = row.id;
        data.creator = row.creator;
        this.$http
          .post("survey/template/new", QS.stringify(data))
          .then(() => {
            this.getSurveyList();
          })
          .catch(() => {
            this.$message({
              message: "创建失败!",
              type: "error"
            });
          });
      });
    },

    handlePublish(index, row, status) {
      let content = "";
      let message = "";
      if (status == 1) {
        content = `要开始回收问卷《${row.title}》吗？`;
        message = "问卷已经开始回收";
      } else {
        content = `暂停回收期间，问卷链接关闭，问卷不回收数据。确定要暂停回收问卷《${row.title}》吗？`;
        message = "问卷已经暂停回收";
      }
      this.$confirm(content, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        row.status = status;
        const survey = {};
        survey.id = row.id;
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
        });
      });
    },

    handleDelete(index, row) {
      let message = `确定要将问卷《${row.title}》彻底删除吗？`;
      if (row.recycle > 0)
        message += `<p>包括：<span style="color:#FF6161"><strong>${row.recycle} </strong>份有效答卷</span></p>`;
      this.$confirm(message, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
        dangerouslyUseHTMLString: true
      }).then(() => {
        this.surveyList.splice(index, 1);
        this.$http.get("survey/del/" + row.id).then(() => {
          this.$message({
            message: '<strong style="color:#333">删除成功</strong>',
            dangerouslyUseHTMLString: true,
            iconClass: " ",
            center: true,
            duration: 1000,
            offset: 68,
            customClass: "center-msgbox"
          });
        });
      });
    },

    handleRefresh(index, row) {
      this.$confirm(
        `清空答卷不可恢复，确定清空问卷《${row.title}》的已有答卷吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      ).then(() => {
        this.$http.get("recycle/refresh/" + row.id).then(() => {
          this.$message({
            message: '<strong style="color:#333">数据已清空</strong>',
            dangerouslyUseHTMLString: true,
            iconClass: " ",
            center: true,
            duration: 1000,
            offset: 68,
            customClass: "center-msgbox"
          });
        });
      });
    },

    handleData(index, row) {
      this.$router.push({
        path: "/home/design/chart/overview",
        query: {
          surveyId: row.id
        }
      });
    },

    handlePrint(index, row) {
      window.open(`/#/print?surveyId=${row.id}`);
    },

    getSurveyList() {
      this.loading = true;
      this.$http
        .get("survey/list/" + this.uid)
        .then(res => {
          this.surveyList = res.data;
          this.loading = false;
        })
        .catch(() => {
          this.loading = false;
        });
    },

    /**
     * 创建空白问卷
     */
    createBlankSurvey() {
      const surveydata = {};
      surveydata.creator = this.uid;
      this.$http.post("survey/new/blank", surveydata).then(res => {
        const surveyId = res.data;
        this.$router.push({
          path: "/home/design/edit",
          query: {
            surveyId: surveyId
          }
        });
      });
    }
  },

  computed: {
    ...mapState({
      uid: state => state.uid
    })
  },

  mounted() {
    this.getSurveyList();
  }
};
</script>

<style>
/* 不显示element表格的横向滚动条 */
/* .el-table--scrollable-x .el-table__body-wrapper {
  overflow-x: scroll;
} */
.el-popper {
  padding: 0;
}
.el-menu-item {
  height: 45px;
  line-height: 45px;
}
.el-menu-item:hover {
  color: #409eff;
}
.center-msgbox {
  min-width: 100px;
  background-color: #fff;
}
</style>
<style scoped>
.mine {
  width: 100%;
  height: 100%;
  background-color: #f4f6f9;
}
.mine .menu {
  z-index: 999;
  position: fixed;
  top: 61px;
  width: 100%;
  min-width: 780px;
  height: 60px;
  zoom: 1;
}
.mine .table {
  position: fixed;
  top: 122px;
  left: 0;
  bottom: 0;
  width: 100%;
  z-index: 10;
  overflow-y: scroll;
}
/* 滚动条样式 start */
.table::-webkit-scrollbar {
  width: 10px;
}
.table::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.table::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
.setting-divider {
  margin: 0;
}
</style>