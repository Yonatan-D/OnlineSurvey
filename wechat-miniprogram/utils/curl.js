const curl = {
    get (url, data) {
        return new Promise((resolve, reject) => {
            wx.request({
                method: 'GET',
                url: getApp().globalData.config.host + url,
                data,
                success: (res) => {
                    resolve(res.data);
                },
                fail: reject
            })
        })
    },

    post (url, data) {
        return new Promise((resolve, reject) => {
            wx.request({
                method: 'POST',
                url: getApp().globalData.config.host + url,
                data,
                success: (res) => {
                    resolve(res.data);
                },
                fail: reject
            })
        })
    },
}

module.exports = curl;