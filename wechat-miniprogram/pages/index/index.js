// index.js
// 获取应用实例
const app = getApp()

Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
  },

  onShow() {
    const user = wx.getStorageSync('user');
    if (user && user.nickName) {
      this.setData({
        hasUserInfo: true,
        userInfo: user
      })
    }
  },

  getUserProfile() {
    wx.getUserProfile({
      desc: '用于记录用户昵称和头像', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        const user = res.userInfo;
        wx.setStorageSync('user', user);
        this.setData({
          userInfo: user,
          hasUserInfo: true
        })
      }
    })
  },

  submitSurvey() {
    const { avatarUrl, nickName } = this.data.userInfo;
    console.log(avatarUrl, nickName);
  } 

})
