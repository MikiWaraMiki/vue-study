import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    count: 0,
    todos: [],
    onSuccess: false,
    onFalse: false,
    errors: []
  },
  getters: {
    countDouble(state) {
      return state.count * 2
    },
    getTodos(state) {
      return state.todos
    }
  },
  mutations: {
    increment(state) {
      state.count++
    },
    setTodos(state, todos) {
      state.todos = todos
    }
  },
  actions: {
    increment({ commit }) {
      commit('increment')
    },
    async fetchTodos({ commit }) {
      const url = "http://localhost:3000/api/v1/todos"
      const { data }  = await axios.get(url)
      commit('setTodos', data.todos)
    }
  },
  modules: {
  }
})
