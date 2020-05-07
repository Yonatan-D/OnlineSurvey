<template>
  <div class="search" ref="search">
    <div style="width:950px; margin:25px auto;">
      <el-row :gutter="30">
        <el-col :span="6">
          <div class="menu">
            <el-menu>
              <el-menu-item :class="{currentNav:searchType==1}" @click="chooseSearchType(1)">
                <el-link :underline="false">问卷</el-link>
                <el-link :underline="false" style="float:right">
                  <el-tag size="mini" type="info" effect="dark">{{searchCounts.survey}}</el-tag>
                </el-link>
              </el-menu-item>
              <!-- <el-menu-item :class="{currentNav:searchType==2}" @click="chooseSearchType(2)">
                <el-link :underline="false">题目</el-link>
                <el-link :underline="false" style="float:right">
                  <el-tag size="mini" type="info" effect="dark">{{searchCounts.quest}}</el-tag>
                </el-link>
              </el-menu-item>
              <el-menu-item :class="{currentNav:searchType==3}" @click="chooseSearchType(3)">
                <el-link :underline="false">标签</el-link>
                <el-link :underline="false" style="float:right">
                  <el-tag size="mini" type="info" effect="dark">{{searchCounts.tag}}</el-tag>
                </el-link>
              </el-menu-item> -->
            </el-menu>
          </div>
        </el-col>
        <el-col :span="18">
          <div class="result-contain">
            <div class="detail">
              <h3>
                <span v-if="searchType == '1'">{{searchCounts.survey}}个问卷结果</span>
                <span v-if="searchType == '2'">{{searchCounts.quest}}个题目结果</span>
                <span v-if="searchType == '3'">{{searchCounts.tag}}个标签结果</span>
                <el-select v-model="sortby" placeholder="请选择" @change="selectSortBy()">
                  <el-option-group label="选择排序条件">
                    <el-option value="1" label="最近修改"></el-option>
                    <el-option value="2" label="最多使用"></el-option>
                    <el-option value="3" label="最多浏览"></el-option>
                  </el-option-group>
                </el-select>
              </h3>
            </div>
            <!-- 检索结果为0显示 -->
            <div class="search-result-item" v-if="search.length==0">
              <div style="width:400px;margin:50px auto;text-align:center;">
                <i class="el-icon-search" style="font-size:30px;"></i>
                <h3 style="color:#24292E;margin:10px 0;">我们未找到任何与 “{{searchText}}” 匹配的结果</h3>
                <p style="color:#4f4f4f;font-size:12px;">要不您换个关键字？</p>
              </div>
            </div>
            <!-- 问卷检索结果显示 -->
            <div v-if="searchType == '1'">
              <div class="search-result-item" v-for="(item, index) in search" :key="index">
                <div class="item-icon">
                  <i class="icon el-icon-collection"></i>
                </div>
                <div class="item-text">
                  <div class="title">
                    <el-link
                      @click="preview(item.id)"
                      v-html="item.title.replace(new RegExp(searchText, 'gm'), `<strong>${searchText}</strong>`)"
                    >{{item.title}}</el-link>
                  </div>
                  <div class="intro" v-if="item.introduction">
                    <p
                      v-html="item.introduction.replace(new RegExp(searchText, 'gm'), `<strong>${searchText}</strong>`)"
                    >{{item.introduction}}</p>
                  </div>
                  <div class="tags" v-if="item.tags">
                    <el-tag size="mini" v-for="(tag, index) in item.tags" :key="index">{{tag}}</el-tag>
                  </div>
                  <div class="info">
                    <el-tooltip content="使用数" placement="bottom" effect="light">
                      <el-link :underline="false">
                        <i class="el-icon-user-solid"></i>
                        {{item.quote}}
                      </el-link>
                    </el-tooltip>
                    <el-tooltip content="回收数" placement="bottom" effect="light">
                      <el-link :underline="false">
                        <i class="el-icon-document-checked"></i>
                        {{item.recycleCount}}
                      </el-link>
                    </el-tooltip>
                    <el-tooltip content="浏览数" placement="bottom" effect="light">
                      <el-link :underline="false">
                        <i class="el-icon-view"></i>
                        {{item.visits}}
                      </el-link>
                    </el-tooltip>
                    <span
                      class="update-date"
                    >修改于 {{new Date().getDateDiff(new Date(item.updateDate))}}</span>
                  </div>
                </div>
              </div>
            </div>
            <!-- 问卷检索结果显示 -->
            <div v-if="searchType == '2'">
              <div class="search-result-item" v-for="(item, index) in 10" :key="index">
                <div style="font-size:14px">
                <p>[单选题] 这是一道单选题单选题单选题。</p>
                <span v-for="(item, index) in 4" :key="index">大苏打 / </span><span>...</span>
                </div>
                <span  style="float:right;font-size:14px;line-height:19.2px">《<el-link :underline="true" type="primary">问卷标题</el-link>》</span>
              </div>
            </div>
            <div class="pagination">
              <el-pagination
                background
                layout="prev, pager, next"
                :page-size="pageinfo.pageSize"
                :current-page="Number($route.query.page)"
                :total="pageinfo.total"
                @current-change="searchCurrentChange"
                hide-on-single-page
              ></el-pagination>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>
<script>
import QS from "qs";

export default {
  data() {
    return {
      searchText: "",
      sortby: "1",
      searchType: "1",
      searchCounts: {
        survey: 0,
        quest: 0,
        tag: 0
      },
      search: [],
      pageinfo: {
        //每页数量
        pageSize: 10,
        //当前页
        currentPage: 1,
        //总数量
        total: 0
      }
    };
  },

  methods: {
    selectSortBy() {
      this.$router.push({
        query: {
          searchText: this.searchText,
          page: 1,
          sortby: this.sortby
        }
      });
      this.pageinfo.currentPage = 1;
      this.searchPageQuery();
    },

    chooseSearchType(type) {
      this.searchType = type;
    },

    searchResultCount() {
      if (this.searchText.length == 0) return;
      const data = {};
      data.searchText = this.searchText;
      this.$http.post("search/count", QS.stringify(data)).then(res => {
        this.searchCounts = res.data;
        this.pageinfo.total = this.searchCounts.survey;
      });
    },

    searchPageQuery() {
      const data = {};
      data.searchText = this.searchText;
      data.page = this.pageinfo.currentPage;
      data.size = this.pageinfo.pageSize;
      let URL = "";
      switch (this.sortby) {
        case "1":
          URL = "search/serveylist/date";
          break;
        case "2":
          URL = "search/serveylist/quote";
          break;
        case "3":
          URL = "search/serveylist/visits";
          break;
        default:
          break;
      }
      this.$http.post(URL, QS.stringify(data)).then(res => {
        this.search = res.data;
        for (const key in this.search) {
          if(this.search[key].tags) this.search[key].tags = this.search[key].tags.split(",");
        }
        this.$refs.search.scrollTop = 0;
      });
    },

    searchCurrentChange(page) {
      this.$router.push({
        query: {
          searchText: this.searchText,
          page: page,
          sortby: this.sortby
        }
      });
      this.pageinfo.currentPage = page;
      this.searchPageQuery();
    },

    preview(surveyId) {
      this.$router.push({
        name: "PCView",
        query: {
          surveyId: surveyId,
          isPreview: true,
          isTemplate: true,
          searchText: this.searchText,
          page: this.pageinfo.currentPage,
          sortby: this.sortby
        }
      });
    }
  },

  mounted() {
    this.searchText = this.$route.query.searchText;
    this.pageinfo.currentPage = Number(this.$route.query.page);
    this.sortby = this.$route.query.sortby;
    this.searchResultCount();
    this.searchPageQuery();
  }
};
</script>
<style scoped>
.search {
  position: fixed;
  top: 60px;
  left: 0px;
  bottom: 0px;
  right: 0px;
  width: 100%;
  height: calc(100%-60px);
  overflow-y: scroll;
}
/* 查询类型菜单 start */
.menu {
  height: 120px;
}
.menu ul {
  border-right: none;
}
.menu ul li {
  border: 1px solid #eee;
}
/* .menu ul li:nth-child(1) {
  border-bottom: none;
}
.menu ul li:nth-child(2) {
  border-bottom: none;
} */
.menu ul li a {
  color: #0366d6;
}
.menu .el-tag {
  border-radius: 10px;
}
.currentNav {
  border-left: 2px solid #e36209 !important;
}
/* 查询类型菜单 end */
/* 查询结果内容 start */
.result-contain {
  padding-bottom: 60px;
}
.detail h3 {
  color: #24292e;
  height: 40px;
  line-height: 40px;
  margin-top: 0;
}
.detail .el-select {
  float: right;
  width: 150px;
}
.pagination {
  text-align: center;
  margin: 10px 0;
}
/* 查询结果内容 start */
/* 查询条目 start */
.search-result-item {
  padding: 24px 0;
  border-top: 1px solid #e1e4e8;
}
.search-result-item .item-icon {
  margin-top: 2px;
  margin-right: 10px;
  float: left;
}
.search-result-item .item-text {
  display: inline-block;
  width: 675px;
}
.search-result-item .title a {
  color: #0366d6;
  font-size: 16px;
}
.el-link.is-underline:hover:after {
  border-bottom: 2px solid #0366d6;
}
.search-result-item .intro p {
  margin: 6px 0 2px 0;
  font-size: 14px;
}
.search-result-item .tags {
  margin: 6px 0 8px 0;
}
.search-result-item .tags span {
  margin-right: 5px;
}
.search-result-item .info a {
  margin-right: 16px;
}
.search-result-item .info .update-date {
  color: #606266;
  font-size: 14px;
}
/* 查询条目 end */
/* 滚动条样式 start */
.search::-webkit-scrollbar {
  width: 10px;
}
.search::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.search::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
</style>