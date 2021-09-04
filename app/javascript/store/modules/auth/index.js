import axios from "axios";

const state = {
  currentUser: null,
};

const getters = {
  currentUser: (state) => state.currentUser,
  currentUserAvatar: (state) => state.currentUser.avatar_url,
};

const mutations = {
  SET_CURRENT_USER: (state, user) => {
    state.currentUser = user;
    localStorage.setItem("currentUser", JSON.stringify(user));
    axios.defaults.headers.common["Authorization"] = `Bearer ${user.token}`;
  },
  CLEAR_CURRENT_USER: () => {
    state.currentUser = null;
    localStorage.removeItem("currentUser");
    location.reload();
  },
};

const actions = {
  async login({ commit }, sessionParams) {
    const res = await axios.post(`/api/session`, sessionParams);
    commit("SET_CURRENT_USER", res.data.user);
  },
  async updateProfile({ commit, state }, userParams) {
    const res = await axios.patch(`/api/me/account`, userParams);
    commit("SET_CURRENT_USER", {
      ...res.data.user,
      ...{ token: state.currentUser.token },
    });
  },
  async removeAvatar({ commit, state }) {
    const res = await axios.delete(`/api/me/account`);
    commit("SET_CURRENT_USER", {
      ...res.data.user,
      ...{ token: state.currentUser.token },
    });
  },
  logout({ commit }) {
    commit("CLEAR_CURRENT_USER");
  },
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
};