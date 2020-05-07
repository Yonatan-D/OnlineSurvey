<template>
  <div class="admin">
    <el-container>
      <el-container>
        <el-aside width="150px">
          <el-menu
            :default-active="this.$route.path"
            class="el-menu-vertical"
            background-color="#23262E"
            text-color="#fff"
            active-text-color="#409EFF"
            router
          >
            <el-menu-item index="/admin/home">
              <i class="el-icon-menu"></i>
              <span slot="title">首页</span>
            </el-menu-item>
            <el-menu-item index="/admin/user">
              <i class="el-icon-menu"></i>
              <span slot="title">用户管理</span>
            </el-menu-item>
            <el-menu-item index="/admin/survey">
              <i class="el-icon-menu"></i>
              <span slot="title">问卷管理</span>
            </el-menu-item>
          </el-menu>
        </el-aside>
        <el-container>
          <el-header>
            <div class="header-left">
              <h1>在线问卷调查系统后台管理</h1>
            </div>
            <div class="header-right">
              <el-button size="mini" type="primary" @click="loginOut">退出</el-button>
            </div>
          </el-header>
          <el-main>
            <transition name="fade" mode="out-in">
              <router-view></router-view>
            </transition>
          </el-main>
          <el-footer>
            <span class="copyright">made by yonatan</span>
          </el-footer>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import { mapMutations } from "vuex";

export default {
  data() {
    return {};
  },

  methods: {
    ...mapMutations(["clearToken", "clearUser", "clearUid"]),

    loginOut() {
      this.clearToken("SURVEY_TOKEN");
      this.clearUser("SURVEY_USER");
      this.clearUid("SURVEY_UID");
      this.$router.push({ path: "/login" });
      this.$message({
        message: "退出登录",
        duration: 1000
      });
    }
  }
};
</script>

<style scoped>
.admin {
  width: 100%;
  height: 100%;
}
.header-left {
  float: left;
}
.header-left h1 {
  margin: 0;
  color: #333;
  font-size: 22px;
}
.header-right {
  float: right;
}
.el-header,
.el-footer {
  background-color: #fff;
  color: #333;
  text-align: center;
  line-height: 60px;
}
.el-header {
    border-bottom: 1px solid #e1e7f2;
}
.el-footer {
    border-top: 1px solid #e1e7f2;
}
.el-footer .copyright {
  color: #aaa;
}
.el-aside {
  background-color: #d3dce6;
  color: #333;
  height: 100%;
}
.el-main {
  background-color: #f4f6f9;
  color: #333;
  height: 100%;
  overflow-x: auto;
}
.el-container {
  height: 100%;
}
.el-menu-vertical {
  height: 100%;
}
.fade-enter-active,
.fade-leave-active {
  transition: all 0.5s;
}
.fade-enter {
  opacity: 0;
  transform: translateX(-30px);
}
.fade-leave-to {
  opacity: 0;
  transform: translateX(30px);
}
/* 滚动条样式 start */
.el-main::-webkit-scrollbar {
  width: 10px;
}
.el-main::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.15);
  border-radius: 5px;
}
.el-main::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
/* 滚动条样式 end */
</style>