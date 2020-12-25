/**
 * Todo一覧取得・登録に関わるVuex
 */

 export default {
   state: {
     todos: [],
     todoName: '',
     todoDescription: '',
     todoStatus: ''
   },
   getters: {
     getTodo(state) {
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
   }
 }
