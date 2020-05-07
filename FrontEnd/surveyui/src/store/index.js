import Vue from 'vue'
import Vuex from 'vuex'
import Cookies from 'js-cookie'

Vue.use(Vuex)

const TOKEN = 'SURVEY_TOKEN';
const USER = 'SURVEY_USER';
const UID = 'SURVEY_UID';

const state = {
  token: Cookies.get(TOKEN) || "",
  user: Cookies.get(USER) || "",
  uid: Cookies.get(UID) || ""
}

const mutations = {
  /**
   * 设置Token
   * @param {*} state 
   * @param {*} value 
   */
  setToken(state, value) {
    state.token = value;
    Cookies.set(TOKEN, value);
  },
  /**
   * 清除Token
   * @param {*} state 
   */
  clearToken(state) {
    state.token = "";
    Cookies.remove(TOKEN);
  },
  /**
   * 设置用户信息
   * @param {*} state 
   * @param {*} value 
   */
  setUser(state, value) {
    state.user = value;
    Cookies.set(USER, value);
  },
  /**
   * 清除用户信息
   * @param {*} state 
   */
  clearUser(state) {
    state.user = "";
    Cookies.remove(USER);
  },
  /**
   * 设置用户ID
   * @param {*} state 
   * @param {*} value 
   */
  setUid(state, value) {
    state.uid = value;
    Cookies.set(UID, value);
  },
  /**
   * 清除用户ID
   * @param {*} state 
   */
  clearUid(state) {
    state.uid = "";
    Cookies.remove(UID);
  }
}

export default new Vuex.Store({
  state,
  mutations,
  actions: {
  },
  modules: {
  }
})
