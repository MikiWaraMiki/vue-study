/**
 * Todo一覧取得Vuex
 */
import axios from 'axios'
const todoListModule = {
   namespaced: true,
   state: {
     todos: [],
   },
   getters: {
     isSetTodo(state) {
       return state.todos.length > 0
     },
     getTodoList(state) {
       return state.todos
     }
   },
   mutations: {
     setTodoList(state, todoList) {
       state.todos = todoList
     },
     addTodo(state, todo) {
       state.todos.push(todo)
     }
   },
   actions: {
     async fetchTodos({ commit }) {
       const url = 'http://localhost:3000/api/v1/todos'
       const { data } = await axios.get(url)
       commit('setTodoList', data.todos)
     },
     addTodo({ commit }, todo) {
       commit('addTodo', todo)
     }
   }
}

export { todoListModule }
