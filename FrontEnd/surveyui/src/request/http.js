import axios from "axios";
import Cookies from "js-cookie";
import router from "@/router";
import { Message } from "element-ui";

// 请求超时
axios.defaults.timeout = 20000;
// 设置基础URL地址，往后的请求都是带上该地址
axios.defaults.baseURL = "api";
const domain = axios.defaults.domain = "http://localhost:8080"

//请求拦截（前台到后台）
axios.interceptors.request.use(
  config => {
    if (Cookies.get("SURVEY_TOKEN")) {
      config.headers["Authorization"] = Cookies.get("SURVEY_TOKEN");
    }
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

//响应拦截（后台到前台）
axios.interceptors.response.use(
  response => {
    //如果返回的HTTP状态码为200，说明请求调用成功，可以正常拿到数据
    //否则请求失败
    if (response.status === 200) {
      if (response.data) {
        // 业务状态码为200，说明数据有效
        if (response.data.code === "200") {
          return Promise.resolve(response);
        } else {
          return Promise.reject(response);
        }
      } else {
        return Promise.resolve(response);
      }
    } else {
      return Promise.reject(response);
    }
  },
  error => {
    const err = error.response.data;
    if (err.message === "401") {
      Message({
        message: "登录已失效，请重新登录",
        type: "warning"
      });
      Cookies.remove("SURVEY_TOKEN");
      Cookies.remove("SURVEY_USER");
      Cookies.remove("SURVEY_UID");
      router.push("/login");
    }
    return Promise.reject(error);
  }
);

/**
 * 封装get请求
 */
const get = (url, params) => {
  return new Promise((resolve, reject) => {
    axios
      .get(url, {
        params: params
      })
      .then(res => {
        //将返回值返回给调用者
        resolve(res.data);
      })
      .catch(err => {
        reject(err.data);
      });
  });
};

/**
 * 封装post请求
 */
const post = (url, params) => {
  return new Promise((resolve, reject) => {
    axios
      .post(url, params)
      .then(res => {
        //将返回值返回给调用者
        resolve(res.data);
      })
      .catch(err => {
        reject(err.data);
      });
  });
};

/**
 * 保存问卷的请求和提示语
 */
const saveSurvey = (url, params) => {
  return new Promise((resolve, reject) => {
    const savingMsg = Message({
      message: '<strong style="color:#333">保存中...</strong>',
      dangerouslyUseHTMLString: true,
      iconClass: " ",
      center: true,
      duration: 0,
      offset: 68,
      customClass: "center-msgbox"
    });
    axios
      .post(url, params)
      .then(res => {
        savingMsg.close();
        Message({
          message: '<strong style="color:#333">保存成功</strong>',
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
        resolve(res.data);
      })
      .catch(err => {
        savingMsg.close();
        Message({
          message: '<strong style="color:#333">保存失败</strong>',
          dangerouslyUseHTMLString: true,
          iconClass: " ",
          center: true,
          duration: 1000,
          offset: 68,
          customClass: "center-msgbox"
        });
        reject(err.data);
      });
  });
};

export default {
  get,
  post,
  saveSurvey,
  domain
};
