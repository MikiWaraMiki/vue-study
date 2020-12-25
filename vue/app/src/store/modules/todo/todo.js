/**
 * Todo登録用Vuex
 */
import axios from 'axios'
const addTodoModule = {
  namespaced: true,
  state: {
    id: '',
    name: '',
    description: '',
    status: ''
  },
  getters: {
    getTodo(state) {
      return {
        id: '',
        name: state.name,
        description: state.description,
        status: state.status
      }
    }
  },
  mutations: {
    setId(state, id) {
      state.id = id
    },
    updateName(state, name) {
      state.name = name
    },
    updateStatus(state, status) {
      state.status = status
    },
    updateDescription(state, description) {
      state.description = description
    }
  },
  actions: {
    updateTodoValue({ commit }, todo) {
      commit('updateName', todo.name)
      commit('updateStatus', todo.status)
      commit('updateDescription', todo.description)
    },
    async addTodo({ getters, commit }) {
      const url = 'http://localhost:3000/api/v1/todos'
      const params = {
        todo: {
          ...getters.getTodo
        }
      }
      const { data } = await axios.post(url, params)
      commit('setId', data.todo.id)
    }
  }
}
export { addTodoModule }
