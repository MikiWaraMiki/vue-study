<template>
  <div id="home">
    <h3>Todo一覧</h3>
    <p>state: {{ stateCount }}</p>
    <p>stateの２倍: {{ $store.getters.countDouble }}</p>
    <template v-if="todos.length > 0">
      <div class="o-remove-btn-area">
        <button class="a-remove-btn" @click="removeTodo">
          削除
        </button>
      </div>
      <div>
        <todo-table :todos="todos"></todo-table>
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
      <todo-form :new-todo.sync="todo"></todo-form>

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
      todos: [],
      todo: {},
      isError: false,
      errors: [],
    }
  },
  created() {
    this.initialize()
  },
  computed: {
    stateCount() {
      return this.$store.state.count
    }
  },
  methods: {
    async initialize() {
      try {
        const { data } = await this.axios.get('http://localhost:3000/api/v1/todos')
        this.todos = data.todos
      } catch (err) {
        console.log(err.status)
        console.log("エラーーーーーーーーーーーーーーー")
      } finally {
        // APIの接続処理が終わった時のことをかく
      }
    },
    async createTodo() {
      try {
        // APIに対してPOST
        console.log(this.todo)
        const params = {
           todo: {
            ...this.todo
          }
        }
        console.log(params)
        const { data } = await this.axios.post('http://127.0.0.1:3000/api/v1/todos', params)
        console.log(data)
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
