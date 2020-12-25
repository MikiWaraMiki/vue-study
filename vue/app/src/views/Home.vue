<template>
  <div id="home">
    <h3>Todo一覧</h3>
    <p>state: {{ stateCount }}</p>
    <p>stateの２倍: {{ $store.getters['counter/countDouble'] }}</p>
    <template v-if="isSetTodoList">
      <div class="o-remove-btn-area">
        <button class="a-remove-btn" @click="removeTodo">
          削除
        </button>
      </div>
      <div>
        <todo-table :todos="todoList"></todo-table>
      </div>
    </template>
    <template v-else>
      Todoは登録されていません
    </template>
    <div>
      <h3>Todoを登録</h3>
      <template v-if="isError">
        <p>{{ errors }}</p>
        <form-error-list :errors="errors" />
      </template>
      <todo-form :todo.sync="storeTodoForm"></todo-form>

      <button class="a-add-btn" @click="createTodo">登録</button>
    </div>
  </div>
</template>

<script>
import TodoTable from '@/components/TodoTable'
import TodoForm from '../components/TodoForm.vue'
import FormErrorList from '../components/FormErrorList'
export default {
  components: {
    TodoTable,
    TodoForm,
    FormErrorList,
  },
  data() {
    return {
      tableHeaders: [],
      isError: false,
      errors: [],
      todo: {
        name: '',
        status: '',
        description: ''
      }
    }
  },
  created() {
    this.initialize()
  },
  computed: {
    stateCount() {
      return this.$store.getters['counter/countNow']
    },
    isSetTodoList() {
      return this.$store.getters['todoList/isSetTodo']
    },
    todoList() {
      return this.$store.getters['todoList/getTodoList']
    },
    storeTodoForm: {
      get() {
        return this.$store.getters['todo/getTodo']
      },
      set(value) {
        /**
         * {
         *   name: '',
         *   status: '',
         *   description: ''
         * }
         */
        this.$store.dispatch('todo/updateTodoValue', value)
      }
    }
  },
  methods: {
    async initialize() {
      try {
        this.$store.dispatch('todoList/fetchTodos')
      } catch (err) {
        this.isError = true
      } finally {
        // APIの接続処理が終わった時のことをかく
      }
    },
    async createTodo() {
      try {
        await this.$store.dispatch('todo/addTodo')
        const addTodo = this.$store.getters['todo/getTodo']
        this.$store.dispatch('todoList/addTodo', addTodo)
      } catch(e) {
        const errorResponse = e.response.data
        console.log(errorResponse)
        this.errors = errorResponse.errors
        console.log(this.errors)
        this.isError = true
      }
    },
    removeTodo() {
      // チェックボックス で選択されたTodoを削除する
    },
  },
}
</script>
<style scoped>
#home {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  width: 80%;
  text-align: center;
  margin: 0 auto;
}
#nav {
  padding: 30px;
}
#nav a {
  font-weight: bold;
  color: #2c3e50;
}
#nav a.router-link-exact-active {
  color: #42b983;
}
.o-todo-form-area label[for]{
  display: block;
}
.o-todo-form-area input,select,textarea {
  width: 80%;
  margin: 0 auto;
}
.a-add-btn {
  width: 160px;
  margin-top: 10px;
}
</style>
