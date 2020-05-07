<template>
  <div>
    <div class="toolbar">
      <div class="toolbar-left">
        <el-button
          v-for="(item, index) in data.toolbar"
          :key="index"
          size="mini"
          :icon="item.icon"
          @click="handleTableData(item.emit)"
        >{{item.name}}</el-button>
      </div>
      <div class="toolbar-right">
        <el-input
          v-if="data.searchFilterConfig.isSearch"
          v-model="search"
          size="mini"
          suffix-icon="el-icon-search"
          :placeholder="data.searchFilterConfig.placeholder"
        />
      </div>
    </div>
    <el-table
      :data="data.rowData.filter(searchFilter)"
      @selection-change="handleSelectionChange"
      border
    >
      <el-table-column type="selection" width="55" align="center"></el-table-column>
      <el-table-column
        v-for="(item, index) in data.cols"
        :key="index"
        :prop="item.prop"
        :label="item.label"
        :width="item.width"
        :align="item.align || 'center'"
        :fixed="item.fixed"
        show-overflow-tooltip
      >
        <template slot-scope="scope">
          <template v-if="!item.switch">{{scope.row[item.prop]}}</template>
          <el-switch
            v-if="item.switch"
            v-model="scope.row[item.prop]"
            :active-value="1"
            :inactive-value="0"
            active-color="#13ce66"
            inactive-color="#ff6161"
            @change="handleRowData(scope.$index, scope.row, item.emit)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column
        v-if="data.isOperation"
        :label="data.operation.label"
        :width="data.operation.width"
        align="center"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            v-for="(item, index) in data.operation.data"
            :key="index"
            :type="item.type"
            @click="handleRowData(scope.$index, scope.row, item.emit)"
          >{{item.label}}</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      background
      layout="prev, pager, next, sizes, total"
      :page-sizes="data.pageinfo.pageSizes"
      :page-size="data.pageinfo.pageSize"
      :current-page="data.pageinfo.currentPage"
      :total="data.pageinfo.total"
      style="margin-top: 10px;"
      @current-change="currentChange"
      @size-change="sizeChange"
    ></el-pagination>
  </div>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      multipleSelection: []
    };
  },
  props: {
    data: {
      type: Object
    }
  },

  computed: {
    searchFilter() {
      return rowData =>
        !this.search ||
        this.data.searchFilterConfig.filters.some(filter =>
          rowData[filter].toLowerCase().includes(this.search.toLowerCase())
        );
    }
  },

  methods: {
    //根据页码查询数据
    currentChange(page) {
      this.data.pageinfo.currentPage = page;
      this.$emit("page", this.data.pageinfo);
    },
    sizeChange(pageSize) {
      this.data.pageinfo.pageSize = pageSize;
      this.data.pageinfo.currentPage = 1;
      this.$emit("page", this.data.pageinfo);
    },
    handleRowData(index, row, emit) {
      this.$emit(emit, { index, row });
    },
    handleTableData(emit) {
      this.$emit(emit, this.multipleSelection);
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    }
  }
};
</script>

<style>
body .el-table th.gutter {
  display: table-cell !important;
}
</style>
<style scoped>
.toolbar {
  padding: 10px 20px;
  background-color: #eee;
  line-height: 35px;
}
.toolbar-left {
  display: inline-block;
}
.toolbar-right {
  display: block;
  float: right;
}
</style>