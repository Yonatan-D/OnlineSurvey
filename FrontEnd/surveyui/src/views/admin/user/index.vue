<template>
  <div class="user">
    <my-table
      :data="tableData"
      @page="userPageQuery"
      @delete="handleDelete"
      @status="handleStatus"
      @mulitOpen="handleMulitOpen"
      @mulitBan="handleMulitBan"
      @mulitDel="handleMulitDel"
    ></my-table>
  </div>
</template>

<script>
import MyTable from "../components/Table";
import { UserCols } from "../components/UserCols";
import { Toolbar } from "../components/Toolbar";
import { PageInfo } from "../components/PageInfo";
import QS from "qs";

export default {
  data() {
    return {
      tableData: {
        cols: UserCols,
        rowData: [],
        pageinfo: PageInfo,
        toolbar: Toolbar,
        searchFilterConfig: {
          isSearch: true,
          placeholder: "搜索ID、用户名",
          filters: ["id", "username"]
        },
        isOperation: true,
        operation: {
          label: "操作选项",
          width: "",
          data: [{ label: "删除", type: "danger", emit: "delete" }]
        }
      }
    };
  },

  components: { MyTable },

  methods: {
    /**
     * 处理单个账号状态
     */
    handleStatus(data) {
      data.row.status === 1 ? (data.row.status = 0) : (data.row.status = 1);
      let message =
        data.row.status === 1
          ? `确定要将 <strong>用户ID前6位: ${data.row.id.substring(
              0,
              6
            )}, 用户名: ${
              data.row.username
            }</strong> 的用户<strong style="color:#ff6161">封禁</strong>吗？`
          : `确定要将 <strong>用户ID前6位: ${data.row.id.substring(
              0,
              6
            )}, 用户名: ${
              data.row.username
            }</strong> 的用户<strong style="color:#ff6161">恢复正常</strong>吗？`;
      this.$confirm(message, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
        dangerouslyUseHTMLString: true
      }).then(() => {
        const user = {};
        user.id = data.row.id;
        user.status = data.row.status === 1 ? 0 : 1;
        this.$http
          .post("user/status", [user])
          .then(() => {
            data.row.status === 1
              ? (data.row.status = 0)
              : (data.row.status = 1);
            this.$message({
              message: `用户ID: ${data.row.id} 已处理`,
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
     * 批量开启用户账号
     */
    handleMulitOpen(rows) {
      this.$confirm(
        `确定要将这 <strong style="color:#ff6161">${rows.length}个用户</strong> 恢复正常状态吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        rows.forEach(row => {
          row.status = 1;
        });
        this.$http
          .post("user/status", rows)
          .then(() => {
            this.$message({
              message: `已将这 ${rows.length}个用户 恢复正常状态`,
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
     * 批量封禁用户账号
     */
    handleMulitBan(rows) {
      this.$confirm(
        `确定要将这 <strong style="color:#ff6161">${rows.length}个用户</strong> 封禁吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        rows.forEach(row => {
          row.status = 0;
        });
        this.$http
          .post("user/status", rows)
          .then(() => {
            this.$message({
              message: `已将这 ${rows.length}个用户 封禁`,
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
     * 删除单个记录
     */
    handleDelete(data) {
      this.$confirm(
        `确定要将 <strong>用户ID前6位: ${data.row.id.substring(
          0,
          6
        )}, 用户名: ${
          data.row.username
        }</strong> 的用户<strong style="color:#ff6161">删除</strong>吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
        const user = {};
        user.id = data.row.id;
        this.$http
          .post("user/delete", [user])
          .then(() => {
            this.$message({
              message: `已将用户ID: ${data.row.id} 的用户删除`,
              type: "success"
            });
            this.userPageQuery();
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
     * 批量删除用户账号
     */
    handleMulitDel(rows) {
      this.$confirm(
        `确定要将这 <strong style="color:#ff6161">${rows.length}个用户</strong> 永久删除吗？`,
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
          dangerouslyUseHTMLString: true
        }
      ).then(() => {
          this.$http
          .post("user/delete", rows)
          .then(() => {
            this.$message({
              message: `已将这 ${rows.length}个用户 删除`,
              type: "success"
            });
            this.userPageQuery();
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
     * 获取表格数据
     */
    userPageQuery() {
      const page = {};
      page.page = this.tableData.pageinfo.currentPage;
      page.size = this.tableData.pageinfo.pageSize;
      this.$http.post("user/list", QS.stringify(page)).then(res => {
        this.tableData.pageinfo.total = res.data.count;
        this.tableData.rowData = res.data.userList;
      });
    }
  },

  mounted() {
    this.userPageQuery();
  }
};
</script>
