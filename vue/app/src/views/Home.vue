<template>
  <div id="home">
    <h3>Todo一覧</h3>
    <template v-if="todos.length > 0">
      <div class="o-remove-btn-area">
        <button class="a-remove-btn" @click="removeTodo">
          削除
        </button>
      </div>
      <div>
        <todo-table :todos="todo"></todo-table>
      </div>
    </template>
    <template v-else>
      Todoは登録されていません
    </template>
    <div>
      <h3>Todoを登録</h3>
      <template v-if="isError">
        <form-error-list :errors="errors" />
      </template>
      <todo-form :todo.sync="todo"></todo-form>

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
      todos: []
    }
  },
  created() {
    this.initialize()
  },
  methods: {
    initalize() {
      // 取得処理を書く
    },
    createTodo() {
      // 登録処理を書く
    },
    removeTodo() {
      // チェックボックス で選択されたTodoを削除する
    },
  },
}
</script>
<style scoped>
#app {
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
