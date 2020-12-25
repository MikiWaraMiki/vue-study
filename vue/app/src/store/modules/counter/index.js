/**
 * counterのstateを管理する
 */
const counterVuexModule = {
  namespaced: true,
  state: {
    count: 0,
  },
  getters: {
    countNow(state) {
      return state.count
    },
    countDouble(state) {
      return state.count * 2
    },
  },
  mutations: {
    increment(state) {
      state.count++
    },
  },
  actions: {
    increment({ commit }) {
      commit('increment')
    },
  }
}
export { counterVuexModule }
