import Vue from 'vue'
import Vuex from 'vuex'
// counter module
import { counterVuexModule } from '@/store/modules/counter'
import { addTodoModule } from '@/store/modules/todo/todo'
import { todoListModule } from '@/store/modules/todo/todoList'
Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    counter: counterVuexModule,
    todo: addTodoModule,
    todoList: todoListModule
  },
})
