const app = getApp()

Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
    surveyInfo: {},
    hasSurveyInfo: false,
    date: '2021-08-15',
    surveyId: '3ef705052d864ce3ba790018b1053e96',
    openid: '',
  },

  async onShow() {
    this.data.openid = wx.getStorageSync('user').openid;
    this.getUserProfile();

    const surveyInfo = await wx.$curl.get(`/survey/${this.data.surveyId}`);
    console.log(surveyInfo);
    if (surveyInfo && surveyInfo.code === '200') {
      this.setData({
        surveyInfo: surveyInfo.data
      })
    }
    // 拿openid去查库，判断用户是否已经填写
    // post /recycle/list { surveyId, date }   有date就过滤 if
    // return {} 为空说明没填写
    // t_survey_recycle增加wxuserid，头像，昵称，存储取出
    // 本地根据wxUserId遍历list，没有就没填写，有就显示（后续要开启填写提示就方便了，数据都拿了回来）

    // 获取所有填写答卷
    const getRecycleList = async (surveyId) => {
      const { data:{list: recycleList} } =await wx.$curl.post('/recycle/list', {
        surveyId,
        page: 1,
        size: 100
      }, {
        'content-type': 'application/x-www-form-urlencoded'
      })
      console.log(recycleList);
      return recycleList;
    }
    
    // 判断问卷是否填写
    const isSubmit = (recycleList) => {
      if (recycleList.length != 0) {
        const recycle = recycleList.filter(r => r.wxUserId && r.wxUserId == this.data.openid)
        console.log('recycle', recycle);
        return recycle.length > 0 ? true : false;
      }
      return false;
    }

    const recycleList = await getRecycleList(this.data.surveyId);
    const booleanSubmit = isSubmit(recycleList)
    console.log(booleanSubmit);
    
console.log(this.data.openid);
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
  async submitSurvey(e) {
    console.log('submit data: ', e.detail.value);
    console.log(this.data.userInfo);
    console.log(this.data.openid);
    const wxUserId = this.data.openid;
    const {
      avatarUrl: wxAvatarUrl,
      nickName: wxNickName,
      province,
      city
    } = this.data.userInfo;

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
      wxUserId,
      wxAvatarUrl,
      wxNickName
    };
    const {
      code
    } = await wx.$curl.post('/answer', {
      answers,
      surveyRecycle
    });
    if (code === '200') {
      console.log('显示参与人列表');
    }
  }

})