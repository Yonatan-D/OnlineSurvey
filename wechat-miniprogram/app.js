// app.js
const curl = require("./utils/curl");
const { format } = require("./utils/date");
const config = require("./config");
App({
  onLaunch() {
    wx.$curl = curl;
    Date.prototype.format = format;

    // 登录
    wx.login({
      success: async (res) => {
        if (res.code) {
          wx.request({
            url: 'https://api.weixin.qq.com/sns/jscode2session',
            data: {
              appid: this.globalData.config.appid,
              secret: this.globalData.config.secret,
              js_code: res.code,
              grant_type: 'authorization_code'
            },
            success: (res) => {
              const { openid, session_key } = res.data;
              console.log({ openid, session_key });
              Object.assign(this.globalData, { openid, session_key })
            }
          })
        }
      }
    })
    
  },
  globalData: {
    config
  }
})
