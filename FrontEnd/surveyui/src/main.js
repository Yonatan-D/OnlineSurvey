import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 引入ElementUI
import ElementUI from 'element-ui'; // 抽屉
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

// 引入ECharts
import echarts from "echarts";
Vue.prototype.$echarts = echarts;
import "echarts/theme/macarons";
import "echarts/map/js/china"

// 引入icon图标
import './assets/iconfont/iconfont.css'

// 引入动画animate.css
import animate from 'animate.css'
Vue.prototype.animate = animate;

// 引入自己封装的http请求方法
import http from './request/http.js'
// 挂载到vue原型链上
Vue.prototype.$http = http;

// 引入时间格式化方法
import date from './date/date.js';
Vue.use(date);

// 引入网页title插件
import VueWechatTitle from 'vue-wechat-title'
Vue.use(VueWechatTitle)

// 引入打印插件
import Print from './print/Print.js'
Vue.use(Print)

// 引入拖拽插件
import VueDND from 'awe-dnd'
Vue.use(VueDND)

// 根据路由设置标题
router.beforeEach((to, from, next) => {
  if(to.meta.title) {
    document.title = to.meta.title;
  }
  next();
})

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
