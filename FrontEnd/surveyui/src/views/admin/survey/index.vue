<template>
  <div class="survey">
    <my-table
      :data="tableData"
      @page="surveyPageQuery"
      @check="handleCheck"
      @delete="handleDelete"
      @visibility="handleVisibility"
      @mulitOpen="handleMulitOpen"
      @mulitBan="handleMulitBan"
      @mulitDel="handleMulitDel"
    ></my-table>
  </div>
</template>

<script>
import MyTable from "../components/Table.vue";
import { SurveyCols } from "../components/SurveyCols";
import { Toolbar } from "../components/Toolbar";
import { PageInfo } from "../components/PageInfo";
import QS from "qs";

export default {
  data() {
    return {
      tableData: {
        cols: SurveyCols,
        rowData: [],
        pageinfo: PageInfo,
        toolbar: Toolbar,
        searchFilterConfig: {
          isSearch: true,
          placeholder: "搜索ID、问卷标题、简介",
          filters: ["id", "title", "introduction"]
        },
        isOperation: true,
        operation: {
          label: "操作选项",
          width: "185",
          data: [
            { label: "查看", type: "primary", emit: "check" },
            { label: "删除", type: "danger", emit: "delete" }
          ]
        }
      }
    };
  },

  components: { MyTable },

  methods: {
    /**
     * 处理单个问卷状态
     */
    handleVisibility(data) {
      data.row.visibility === 1
        ? (data.row.visibility = 0)
        : (data.row.visibility = 1);
      let message =
        data.row.visibility === 1
          ? `确定要将 <strong>问卷ID前6位: ${data.row.id.substring(
              0,
              6
            )}, <br>问卷标题: ${
              data.row.title
            }</strong> 的问卷<strong style="color:#ff6161">封禁</strong>吗？`
          : `确定要将 <strong>问卷ID前6位: ${data.row.id.substring(
              0,
              6
            )}, <br>问卷标题: ${
              data.row.title
            }</strong> 的问卷<strong style="color:#ff6161">恢复正常</strong>吗？`;
      this.$confirm(message, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
        dangerouslyUseHTMLString: true
      }).then(() => {
        const survey = {};
        survey.id = data.row.id;
        survey.visibility = data.row.visibility === 1 ? 0 : 1;
        this.$http
          .post("survey/visibility", [survey])
          .then(() => {
            data.row.visibility === 1
              ? (data.row.visibility = 0)
              : (data.row.visibility = 1);
            this.$message({
              message: `问卷ID: ${data.row.id} 已处理`,
              type: "success"
            });
          })
          .catch(() => {
            this.$message({
              message: "操作失败",
              type: "error"
            });
          });
      });
    },
    /**
     * 批量开启问卷
     */
    handleMulitOpen(rows) {
      this.$confirm(
        `确定要将这 <strong style="color:#ff6161">${rows.length} 份问卷</strong> 恢复正常状态吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        rows.forEach(row => {
          row.visibility = 1;
        });
        this.$http
          .post("survey/visibility", rows)
          .then(() => {
            this.$message({
              message: `已将这 ${rows.length}份问卷 恢复正常状态`,
              type: "success"
            });
          })
          .catch(() => {
            this.$message({
              message: "操作失败",
              type: "error"
            });
          });
      });
    },
    /**
     * 批量封禁问卷
     */
    handleMulitBan(rows) {
      this.$confirm(
        `确定要将这 <strong style="color:#ff6161">${rows.length}个问卷</strong> 封禁吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        rows.forEach(row => {
          row.visibility = 0;
        });
        this.$http
          .post("survey/visibility", rows)
          .then(() => {
            this.$message({
              message: `已将这 ${rows.length}份问卷 封禁`,
              type: "success"
            });
          })
          .catch(() => {
            this.$message({
              message: "操作失败",
              type: "error"
            });
          });
      });
    },
    /**
     * 删除单份问卷
     */
    handleDelete(data) {
      this.$confirm(
        `确定要将 <strong>问卷ID前6位: ${data.row.id.substring(
          0,
          6
        )}, <br>问卷标题: ${
          data.row.title
        }</strong> 的问卷<strong style="color:#ff6161">删除</strong>吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        const survey = {};
        survey.id = data.row.id;
        this.$http
          .post("survey/mulit_delete", [survey])
          .then(() => {
            this.$message({
              message: `已将问卷ID: ${data.row.id} 的问卷删除`,
              type: "success"
            });
            this.surveyPageQuery();
          })
          .catch(() => {
            this.$message({
              message: "操作失败",
              type: "error"
            });
          });
      });
    },
    /**
     * 批量删除问卷
     */
    handleMulitDel(rows) {
      this.$confirm(
        `确定要将这 <strong style="color:#ff6161">${rows.length}份问卷</strong> 永久删除吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        this.$http
          .post("survey/mulit_delete", rows)
          .then(() => {
            this.$message({
              message: `已将这 ${rows.length}份问卷 删除`,
              type: "success"
            });
            this.surveyPageQuery();
          })
          .catch(() => {
            this.$message({
              message: "操作失败",
              type: "error"
            });
          });
      });
    },
    /**
     * 新标签页打开问卷
     */
    handleCheck(data) {
      window.open(`${this.$http.domain}/#/answer/pc/?surveyId=${data.row.id}`);
    },
    /**
     * 获取表格数据
     */
    surveyPageQuery() {
      const page = {};
      page.page = this.tableData.pageinfo.currentPage;
      page.size = this.tableData.pageinfo.pageSize;
      this.$http.post("survey/manage/list", QS.stringify(page)).then(res => {
        this.tableData.pageinfo.total = res.data.count;
        this.tableData.rowData = res.data.surveyList;
      });
    }
  },

  mounted() {
    this.surveyPageQuery();
  }
};
</script>
