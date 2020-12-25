import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
// counter module
import { counterVuexModule } from '@/store/modules/counter'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    counter: counterVuexModule
  },
  state: {
    todos: [],
    todoName: '', // Todo名
    todoStatus: '', // ステータス
    todoDescription: '', // 詳細
    onSuccess: false,
    onFalse: false,
    errors: []
  },
  getters: {
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
    updateTodo(state, todo) {
      /**
       * {
       *   name: "新しい名前",
       *   description: "新しい詳細",
       *   status: '変更されたステータス'
       * }
       *
       * [Vuexの呼び出され方]
       * TodoForm.vue->Home.vue(set) -> actions内のupdateTodoを呼び出し
       *              -> mutations内のupdateTodoを呼び出し
       *                 -> todoName, todoDescription, todoStatus
       */
      state.todoName = todo.name
      state.todoDescription = todo.description
      state.todoStatus = todo.status
    },
    setTodos(state, todos) {
      state.todos = todos
    },
    addTodo(state, todo) {
      state.todos.push(todo)
    }
  },
  actions: {
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
      console.log(params)
      const { data } = await axios.post(url, params)

      commit('addTodo', data.todo)
    }
  },
})
