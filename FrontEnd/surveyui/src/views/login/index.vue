<template>
  <div class="login">
    <div class="login-center--wrapper">
      <p class="title">在线问卷调查系统</p>
      <p style="margin-top: 30px;">
        <el-input
          placeholder="请输入用户名"
          prefix-icon="el-icon-user-solid"
          v-model="username"
          clearable
        ></el-input>
      </p>
      <p style="margin-top: 20px;">
        <el-input
          placeholder="请输入密码"
          v-model="password"
          show-password
          clearable
          prefix-icon="el-icon-lock"
          @keyup.enter.native="signIn()"
        ></el-input>
      </p>
      <p style="margin-top: 30px;">
        <el-button type="primary" style="width: 100%;" @click="signIn()">
          <span v-show="!signingIn">登 录</span>
          <i v-show="signingIn" class="el-icon-loading"></i>
        </el-button>
      </p>
      <p style="margin-top:10px;text-align: right;">
        <el-link type="primary" @click="registDialogVisible=true">在线注册</el-link>
      </p>
    </div>
    <el-dialog :close-on-click-modal="false" :visible.sync="registDialogVisible" width="600px">
      <template slot="title">
        <div class="regist-dialog-title">
          <img alt="logo" src="@/assets/image/logo.png" width="32px" />
          <h3>在线注册</h3>
        </div>
      </template>

      <el-form
        style="margin:0 35px"
        :model="registForm"
        status-icon
        :rules="rules"
        ref="registForm"
        label-width="100px"
        label-position="left"
      >
        <el-form-item prop="username" label="用户名">
          <el-input
            v-model="registForm.username"
            placeholder="支持汉字，注册后不能修改"
            prefix-icon="el-icon-user-solid"
          ></el-input>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input
            v-model="registForm.email"
            placeholder="输入可以联系的邮箱"
            prefix-icon="el-icon-message"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input
            type="password"
            v-model="registForm.password"
            autocomplete="off"
            placeholder="不少于6位的字母、数字或特殊符号"
            prefix-icon="el-icon-lock"
          ></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPassword">
          <el-input
            type="password"
            v-model="registForm.checkPassword"
            autocomplete="off"
            placeholder="两次输入密码必须一致"
            prefix-icon="el-icon-lock"
          ></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="registDialogVisible = false;$refs['registForm'].resetFields();">取 消</el-button>
        <el-button @click="resetForm('registForm')">重 置</el-button>
        <el-button type="primary" @click="submitForm('registForm')">注 册</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { mapMutations } from "vuex";

export default {
  data() {
    // 用户名查重
    var validateName = (rule, value, callback) => {
      if (value.trim() === "") {
        callback(new Error("请输入用户名"));
      } else {
        // 用户名查重
        const user = {};
        user.username = value;
        this.$http
          .post("/user/checkName", user)
          .then(res => {
            if (res.existsName) {
              callback(new Error("该用户名已被注册!"));
            } else {
              callback();
            }
          })
          .catch(() => {
            callback(new Error("似乎出现了什么错误..."));
          });
      }
    };

    // 密码校验
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.registForm.checkPassword !== "") {
          this.$refs.registForm.validateField("checkPassword");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };

    return {
      // 登录
      signingIn: false,
      username: "",
      password: "",
      // 注册
      registDialogVisible: false,
      registForm: {
        username: "",
        email: "",
        password: "",
        checkPassword: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { validator: validateName, trigger: "blur" }
        ],
        email: [
          { required: true, message: "请输入邮箱地址", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        password: [
          { required: true, validator: validatePass, trigger: "blur" },
          { min: 6, message: "密码长度最少为6位", trigger: "blur" }
        ],
        checkPassword: [
          { required: true, validator: validatePass2, trigger: "blur" }
        ]
      }
    };
  },
  methods: {
    ...mapMutations(["setToken", "setUser", "setUid"]),

    /**
     * 用户登录
     */
    signIn() {
      if (!this.username) {
        this.$message({
          message: "请输入用户名",
          type: "warning"
        });
        return false;
      }
      if (!this.password) {
        this.$message({
          message: "请输入登录密码",
          type: "warning"
        });
        return false;
      }
      this.signingIn = true;
      const user = {};
      user.username = this.username;
      user.password = this.password;
      this.$http
        .post("/user/login", user)
        .then(res => {
          let user = res.user;
          let uid = user.id;
          let token = res.token;

          if (token) {
            this.signingIn = false;
            this.$message({
              message: "登录成功",
              type: "success",
              duration: 1000
            });
            // 保存到Cookies
            this.setToken(token);
            this.setUser(user);
            this.setUid(uid);
            // 获取目标地址
            let path = user.role === "admin" ? "/admin/home" : this.$route.query.redirect || "/home/mine";
            // 跳转页面
            this.$router.push(path);
          } else {
            this.signingIn = false;
            this.$message({
              message: res.message,
              type: "warning",
              duration: 1000
            });
          }
        })
        .catch((err) => {
          this.signingIn = false;
          this.$message({
            message: err.message,
            type: "error",
            duration: 1500
          });
        });
    },

    /**
     * 提交注册信息
     */
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          this.$http
            .post("/user/regist", this.registForm)
            .then(() => {
              this.registDialogVisible = false;
              this.username = this.registForm.username; // 将注册的用户名填入登录框
              this.$message({
                message: "注册成功!",
                type: "success",
                duration: 1000
              });
            })
            .catch(() => {
              this.$alert("注册失败!");
            });
        } else {
          return false;
        }
      });
    },

    /**
     * 重置注册信息
     */
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
};
</script>

<style scoped>
.login {
  width: 100%;
  height: 100%;
}
.login-center--wrapper {
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
}
.title {
  font-size: 26px;
  color: #4caaf5;
  text-align: center;
  margin-top: 20px;
}
.regist-dialog-title {
  display: flex;
  align-items: center;
}
.regist-dialog-title h3 {
  margin: 0 0 0 5px;
  display: inline;
  font-weight: 500;
}
</style>
