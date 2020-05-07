import Vue from "vue";
import VueRouter from "vue-router";
import Login from "../views/login";
import Home from "../views/home";
import Design from "../views/home/design";
import PCView from "../views/answer/PCView.vue";
import PhoneView from "../views/answer/PhoneView.vue";
import SubmitSuccess from "../views/answer/Success.vue";
import Close from "../views/answer/Close.vue";
import NoFind from "../views/answer/NoFind.vue";
import AnswerPage from "../views/answer/AnswerPage.vue";
import Cookies from "js-cookie";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    redirect: "home"
  },
  {
    path: "/home",
    name: "home",
    redirect: "/home/mine",
    component: Home,
    meta: {
      //当前路由地址,需要登录之后才能访问
      requiresAuth: true,
      roles: ["user"]
    },
    children: [
      {
        path: "design",
        name: "design",
        component: Design,
        children: [
          {
            path: "edit",
            name: "edit",
            component: () => import("../views/home/design/Edit.vue"),
            meta: {
              title: "编辑问卷"
            }
          },
          {
            path: "publish",
            name: "publish",
            component: () => import("../views/home/design/Publish.vue"),
            meta: {
              title: "投放问卷"
            }
          },
          {
            path: "chart",
            name: "chart",
            component: () => import("../views/home/design/chart"),
            children: [
              {
                path: "overview",
                name: "overview",
                component: () =>
                  import("../views/home/design/chart/Overview.vue"),
                meta: {
                  title: "回收概况"
                }
              },
              {
                path: "recycle",
                name: "recycle",
                component: () =>
                  import("../views/home/design/chart/Recycle.vue"),
                meta: {
                  title: "数据分析"
                }
              },
              {
                path: "cross",
                name: "cross",
                component: () => import("../views/home/design/chart/Cross.vue"),
                meta: {
                  title: "交叉分析"
                }
              }
            ]
          }
        ]
      },
      {
        path: "mine",
        name: "mine",
        component: () => import("../views/home/Mine.vue"),
        meta: {
          title: "我的问卷"
        }
      },
      // {
      //   path: "rank",
      //   name: "rank",
      //   component: () => import("../views/home/Rank.vue"),
      //   meta: {
      //     title: "网站动态"
      //   }
      // },
      {
        path: "search",
        name: "search",
        component: () => import("../views/home/Search.vue"),
        meta: {
          title: "搜索结果"
        }
      },
      {
        path: "template",
        name: "template",
        component: () => import("../views/home/Template.vue"),
        meta: {
          title: "选择模板"
        }
      }
    ]
  },
  {
    path: "/login",
    name: "login",
    component: Login,
    meta: {
      title: "登录系统",
      roles: ["admin", "user"]
    }
  },
  {
    path: "/answer/pc",
    name: "PCView",
    component: PCView
  },
  {
    path: "/answer/phone",
    name: "PhoneView",
    component: PhoneView,
    meta: {
      //当前路由地址,需要登录之后才能访问
      requiresAuth: true,
      title: "手机预览",
      roles: ["admin", "user"]
    }
  },
  {
    path: "/view/recycle",
    name: "AnswerPage",
    component: AnswerPage,
    meta: {
      //当前路由地址,需要登录之后才能访问
      requiresAuth: true,
      title: "查看答卷",
      roles: ["user"]
    }
  },
  {
    path: "/submit/success",
    name: "submit",
    component: SubmitSuccess,
    meta: {
      title: "提交成功"
    }
  },
  {
    path: "/close",
    name: "close",
    component: Close,
    meta: {
      title: "问卷已关闭"
    }
  },
  {
    path: "/nofind",
    name: "nofind",
    component: NoFind,
    meta: {
      title: "问卷不存在"
    }
  },
  {
    path: "/print",
    name: "print",
    component: () => import("../views/answer/PrintPage.vue"),
    meta: {
      //当前路由地址,需要登录之后才能访问
      requiresAuth: true,
      roles: ["user"]
    }
  },
  {
    path: "/404",
    name: "404",
    component: () => import("../views/404.vue")
  },
  {
    path: "/admin",
    name: "admin",
    component: () => import("../views/admin"),
    redirect: "/admin/home",
    meta: {
      //当前路由地址,需要登录之后才能访问
      requiresAuth: true,
      roles: ["admin"]
    },
    children: [
      {
        path: "home",
        name: "home",
        component: () => import("../views/admin/home")
      },
      {
        path: "user",
        name: "user",
        component: () => import("../views/admin/user")
      },
      {
        path: "survey",
        name: "survey",
        component: () => import("../views/admin/survey")
      }
    ]
  }
];

const router = new VueRouter({
  routes
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    let token = Cookies.get("SURVEY_TOKEN");
    if (token === undefined) {
      let fullPath = to.fullPath;
      next({
        path: "/login",
        query: {
          redirect: fullPath
        }
      });
    } else {
      let role = JSON.parse(Cookies.get("SURVEY_USER")).role;
      if (to.matched[0].meta.roles.includes(role)) {
        next();
      } else {
        next({
          path: "/404"
        });
      }
    }
  } else {
    next();
  }
});

export default router;
