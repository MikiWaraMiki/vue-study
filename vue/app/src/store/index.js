import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    count: 0,
    todos: [],
    todoName: '',
    todoStatus: '',
    todoDescription: '',
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
    },
    getTodo(state) {
      return {
        name: state.todoName,
        status: state.todoStatus,
        description: state.todoDescription
      }
    }
  },
  mutations: {
    increment(state) {
      state.count++
    },
    updateTodo(state, todo) {
      state.todo = todo
    },
    setTodos(state, todos) {
      state.todos = todos
    },
    addTodo(state, todo) {
      state.todos.push(todo)
    }
  },
  actions: {
    increment({ commit }) {
      commit('increment')
    },
    updateTodo({ commit }, todo) {
      commit('updateTodo', todo)
    },
    async fetchTodos({ commit }) {
      const url = "http://localhost:3000/api/v1/todos"
      const { data }  = await axios.get(url)
      commit('setTodos', data.todos)
    },
    async addTodo({ getters, commit }) {
      const url = "http://localhost:3000/api/v1/todos"
      const params = {
        todo: {
          ...getters.getTodo
        }
      }
      const { data } = await axios.post(url, params)

      commit('addTodo', data.todo)
    }
  },
  modules: {
  }
})
