const app = getApp()

Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
    surveyInfo: {},
    hasSurveyInfo: false,
    date: '2021-08-15',
  },

  async onShow() {
    const surveyInfo = await wx.$curl.get("/survey/3ef705052d864ce3ba790018b1053e96");
    console.log(surveyInfo);
    if (surveyInfo && surveyInfo.code === '200') {
      this.setData({
        surveyInfo: surveyInfo.data
      })
    }
    this.getUserProfile();
  },

  /**
   * 获取微信用户数据
   */
  getUserProfile() {
    // 从本地缓存取出用户数据
    const user = wx.getStorageSync('user');
    if (user && user.nickName) {
      this.setData({
        hasUserInfo: true,
        userInfo: user
      });
      return;
    }
    // 本地缓存没有就请求
    wx.getUserProfile({
      desc: '用于用户信息', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        const user = res.userInfo;
        console.log(user);
        wx.setStorageSync('user', user); // 缓存用户数据到本地
        this.setData({
          userInfo: user,
          hasUserInfo: true
        })
      }
    })
  },

  /**
   * 提交问卷
   */
  submitSurvey(e) {
    console.log('submit data: ', e.detail.value);
    console.log(this.data.userInfo);
    console.log(app.globalData.openid);
    const wxUserId = app.globalData.openid;
    const { avatarUrl, nickName, province, city } = this.data.userInfo;
    
    const answers = [];
    for (const [k, v] of Object.entries(e.detail.value)) {
      answers.push({
        type: k.split('/')[0],
        questionId: k.split('/')[1],
        content: v,
      })
    }
    const surveyRecycle = {
      surveyId: this.data.surveyInfo.id,
      dataSource: "微信小程序",
      deviceInfo: 2,
      ip: "",
      position: province + city,
      totalTime: 0,
      submitDate: new Date().format("yyyy-MM-dd hh:mm:ss"),
      avatarUrl,
      nickName
    };
    wx.$curl.post('/answer', { wxUserId, answers, surveyRecycle });
  } 

})
