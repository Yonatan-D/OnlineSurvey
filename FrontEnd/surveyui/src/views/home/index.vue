<template>
  <div class="home">
    <!-- 顶层菜单栏 -->
    <div class="header">
      <el-menu
        router
        :default-active="this.$route.path"
        mode="horizontal"
        @select="handleSelect"
        active-text-color="#409EFF"
      >
        <el-menu-item>
          <a href="/" class="logo">
            <img alt="logo" src="@/assets/image/logo.png" width="32px" />
            <img alt="title" src="@/assets/image/site-title.png" width="32px" />
          </a>
        </el-menu-item>
        <el-menu-item>
          <el-input
            v-model="searchText"
            placeholder="搜索其他用户公开的问卷"
            @keyup.enter.native="searchSurvey()"
          ></el-input>
        </el-menu-item>
        <el-menu-item index="/home/design/edit">创建问卷</el-menu-item>
        <el-menu-item index="/home/mine">我的问卷</el-menu-item>
        <!-- <el-menu-item index="/home/rank">网站动态</el-menu-item> -->
        <el-menu-item style="float:right; padding:0; margin-right:20px;">
          <div class="account">
            <!-- <div class="message">
              <i class="el-icon-message-solid"></i>
            </div> -->
            <el-avatar
              :size="25"
              style="background:#409EFF;color:#FFF;margin-right:15px;"
            >{{user.username.substring(0,1)}}</el-avatar>
            <el-dropdown>
              <span class="el-dropdown-link">
                {{user.username}}
                <i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item disabled style="color:#666">我的邮箱：{{user.email}}</el-dropdown-item>
                <el-dropdown-item disabled style="color:#666">注册时间：{{user.createdDate}}</el-dropdown-item>
                <el-dropdown-item disabled divided style="color:#666">上次登录时间：{{new Date().getDateDiff(new Date(user.lastLoginDate))}}</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <span class="splitor" style="color:#999;">|</span>
            <span>
              <a class="loginBtn" href="javascript:;" @click="loginOut()">退出</a>
            </span>
          </div>
        </el-menu-item>
      </el-menu>
    </div>
    <!-- 主内容 -->
    <div class="contain">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
import Cookies from "js-cookie";

export default {
  data() {
    return {
      user: {
        username: ""
      },
      searchText: ""
    };
  },
  methods: {
    ...mapMutations(["clearToken", "clearUser", "clearUid"]),

    handleSelect(key) {
      if (this.$route.path == key) this.$router.go(0); // 刷新当前页
    },

    loginOut() {
      this.clearToken("SURVEY_TOKEN");
      this.clearUser("SURVEY_USER");
      this.clearUid("SURVEY_UID");
      this.$router.push({ path: "/login" });
      this.$message({
        message: "退出登录",
        duration: 1000
      });
    },

    /**
     * 模糊查询问卷
     */
    searchSurvey() {
      if (this.searchText.length == 0) return;
      if (this.$route.path == "/home/search") {
        this.$router.push({
          path: "/home/search",
          query: {
            searchText: this.searchText, //更新searchText
            page: 1,
            sortby: "1"
          }
        });
        this.$router.go(0); //刷新页面触发mounted
      } else {
        this.$router.push({
          path: "/home/search",
          query: {
            searchText: this.searchText,
            page: 1,
            sortby: "1"
          }
        });
      }
    },
  },

  mounted() {
    this.user = JSON.parse(Cookies.get("SURVEY_USER"));
  }
};
</script>

<style scoped>
.home {
  width: 100%;
  height: 100%;
}
/* 顶部导航栏 start */
.header {
  height: 60px;
  position: fixed;
  width: 100%;
  min-width: 780px;
  z-index: 1000;
}
.header .logo img {
  vertical-align: middle;
}
.header .loginBtn {
  text-decoration: none;
}
.header .loginBtn:hover {
  color: #409eff;
}
.header .account .message,
.splitor {
  display: inline-block;
  margin: 0 10px;
}
.header .account .message i {
  color: #bbb;
  font-size: 20px;
}
.header .account .message i:hover {
  color: #409eff;
  cursor: pointer;
}
.header .account span {
  color: #333;
}
/* 顶部导航栏 end */
/* 主内容区 start */
.contain {
  width: 100%;
  height: 100%;
  overflow-x: auto;
}
/* 主内容区 end */
.el-menu-item:nth-child(1) {
  border-bottom-color: #fff !important;
}
.el-menu-item:nth-child(2) {
  border-bottom-color: #fff !important;
}
.el-menu-item:nth-child(5) {
  border-bottom-color: #fff !important;
}
</style>
