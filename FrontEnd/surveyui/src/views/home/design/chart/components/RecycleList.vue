<template>
  <div style="margin: 20px 0px;">
    <el-card class="box-card">
      <div>
        <template>
          <el-table :data="recycleList" style="width: 100%" height="387px">
            <el-table-column prop="operate" label="操作" align="center" width="75">
              <template slot-scope="scope">
                <el-button
                  type="text"
                  icon="el-icon-view"
                  class="table-btn"
                  @click="see(scope.$index+(pageinfo.currentPage - 1) * pageinfo.pageSize + 1, scope.row.id)"
                ></el-button>
                <el-popconfirm
                  title="确定要删除吗？"
                  @onConfirm="del(scope.$index, scope.row)"
                  style="margin-left:10px;"
                >
                  <el-button slot="reference" type="text" icon="el-icon-delete" class="table-btn"></el-button>
                </el-popconfirm>
              </template>
            </el-table-column>
            <el-table-column type="index" label="序号" width="75" align="center">
              <template slot-scope="scope">
                <span>{{scope.$index+(pageinfo.currentPage - 1) * pageinfo.pageSize + 1}}</span>
              </template>
            </el-table-column>
            <el-table-column prop="submitDate" label="提交答卷时间" width="150" align="center" sortable></el-table-column>
            <el-table-column prop="totalTime" label="所用时间" align="center" sortable>
              <template slot-scope="scope">{{scope.row.totalTime}}秒</template>
            </el-table-column>
            <el-table-column prop="deviceInfo" label="设备" width="75" align="center">
              <template slot-scope="scope">
                <span v-if="scope.row.deviceInfo == 1" style="color:#409EFF">
                  <el-tooltip effect="light" placement="bottom-start">
                    <i class="el-icon-s-platform"></i>
                    <div slot="content">电脑提交</div>
                  </el-tooltip>
                </span>
                <span v-else-if="scope.row.deviceInfo == 2" style="color:#2f9833">
                  <el-tooltip effect="light" placement="bottom-start">
                    <i class="el-icon-mobile-phone"></i>
                    <div slot="content">手机提交</div>
                  </el-tooltip>
                </span>
              </template>
            </el-table-column>
            <el-table-column prop="dataSource" label="来源" align="center" width="75"></el-table-column>
            <el-table-column prop="position" label="来自IP" align="center">
              <template slot-scope="scope">
                <div v-if="scope.row.ip != null">
                  <el-tooltip effect="light" placement="bottom-start">
                    <div slot="content">{{scope.row.ip}} ({{scope.row.position}})</div>
                    <el-tag>{{scope.row.position}}</el-tag>
                  </el-tooltip>
                </div>
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
            background
            layout="prev, pager, next,sizes,total"
            :page-sizes="[5, 10, 15, 20]"
            :page-size="pageinfo.pageSize"
            :current-page="pageinfo.currentPage"
            :total="pageinfo.total"
            style="margin-top: 10px;"
            @current-change="recycleCurrentChange"
            @size-change="recycleSizeChange"
          ></el-pagination>
        </template>
      </div>
    </el-card>
  </div>
</template>

<script>
import QS from "qs";

export default {
  data() {
    return {
      surveyId: "",
      recycleList: [],
      pageinfo: {
        //每页数量
        pageSize: 5,
        //当前页
        currentPage: 1,
        //总数量
        total: 0
      }
    };
  },
  methods: {
    recyclePageQuery() {
      const recycle = {};
      recycle.surveyId = this.surveyId;
      recycle.page = this.pageinfo.currentPage;
      recycle.size = this.pageinfo.pageSize;
      this.$http
        .post("recycle/list", QS.stringify(recycle))
        .then(res => {
            this.recycleList = res.data.list;
            this.pageinfo.total = res.data.count;
        })
    },
    //根据页码查询数据
    recycleCurrentChange(page) {
      this.pageinfo.currentPage = page;
      this.recyclePageQuery();
    },
    recycleSizeChange(pageSize) {
      this.pageinfo.pageSize = pageSize;
      this.pageinfo.currentPage = 1;
      this.recyclePageQuery();
    },
    see(id, recycleId) {
      window.open(
        `#/view/recycle?id=${id}&recycleId=${recycleId}&surveyId=${this.surveyId}`
      );
    },
    del(index, row) {
      this.$http
        .get("recycle/del/" + row.id)
        .then(() => {
            this.recyclePageQuery();
        })
    }
  },
  mounted() {
    this.surveyId = this.$route.query.surveyId;
    this.recyclePageQuery();
  }
};
</script>

<style>
/* 滚动条样式 start */
.el-table--scrollable-y .el-table__body-wrapper::-webkit-scrollbar {
  width: 8px;
}
.el-table--scrollable-y .el-table__body-wrapper::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.el-table--scrollable-y .el-table__body-wrapper::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
.el-popper {
  padding: 0;
}
.el-popconfirm {
  padding: 10px;
}
</style>
<style scoped>
.table-btn {
  color: #909399;
}
.table-btn:hover {
  color: #409EFF;
}
</style>

