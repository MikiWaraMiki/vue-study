<template>
  <div id="app">
    <h3>Todo一覧</h3>
    <template v-if="todos.length > 0">
      <div class="o-remove-btn-area">
        <button class="a-remove-btn" @click="removeTodo">
          削除
        </button>
      </div>
      <table class="o-todo-list">
        <thead>
          <tr>
            <th v-for="header in tableHeaders" :key="header.key">
              {{ header.name}}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="todo in todos" :key="todo.id" :class="statusRowClass(todo.status)">
            <td>{{ todo.id }}</td>
            <td>{{ todo.name }}</td>
            <td>{{ statusText(todo.status) }}</td>
            <td>{{ todo.description }}</td>
            <td>
              <input type="checkbox" :id="`todo-${todo.id}`" @change="selectRemoveTodos(todo)" />
            </td>
          </tr>
        </tbody>
      </table>
    </template>
    <template v-else>
      Todoは登録されていません
    </template>
    <div>
      <h3>Todoを登録</h3>
      <!-- ここにエラーメッセージを表示させる -->
      <form class="o-todo-form-area">
        <!-- ここに登録フォームを実装する -->
      </form>
      <button class="a-add-btn">登録</button>
      <div class="o-data-area">
        <!-- 登録するTodoのデータをそのまま表示する -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableHeaders: [
        { key: 'id', name: '登録ID'},
        { key: 'name', name: 'Todo名'},
        { key: 'status', name: 'ステータス'},
        { key: 'description', name: '詳細'},
        { key: 'delete', name: '削除'}
      ],
      todos: [
        {
          id: 1,
          name: "金曜ロードショーをみる",
          status: "not_work",
          description: "しんどい侍"
        },
        {
          id: 2,
          name: "千鳥の大吾とDAIGOの違い",
          status: 'in_progress',
          description: 'それでええ'
        },
        {
          id: 3,
          name: 'ハカを踊る',
          status: 'finish',
          description: 'こんにちは、こんにちは'
        }
      ],
      statuses: [
        {key: 'not_work', text: '未対応'},
        {key: 'in_progress', text: '進行中'},
        {key: 'finish', text: '完了'}
      ]
    }
  },
  methods: {
    statusRowClass(status) {
      const convertStatusHypen = status.replace('_', '-')
      return `s-${convertStatusHypen}-row`
    },
    statusText(val) {
      return this.statuses.find(
        status => status.key === val
      ).text
    },
    removeTodo() {
      // チェックボックス で選択されたTodoを削除する
    },
    selectRemoveTodos(selectedTodo) {
      // 選択された時に、チェックが外れた場合は、削除対象から外す
      // チェックが入った時には、削除対象に追加する
      console.log(selectedTodo)
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
.o-todo-list {
  width: 100%;
  border: 1px solid;
}
.o-todo-form-area label[for]{
  display: block;
}
.o-todo-form-area input,select,textarea {
  width: 80%;
  margin: 0 auto;
}
.o-errors-area {
  width: 400px;
  margin: 0 auto;
}
.o-errors-area li {
  text-align: left;
}
.o-remove-btn-area {
  text-align: right;
  margin-bottom: 10px;
}
.s-not-work-row {
  color: red;
}
.s-in-progress-row {
  background: #f7f7f7;
  color: #f70;
}
.s-finish-row {
  background: #364549;
  color: white;
}
.a-add-btn {
  width: 160px;
  margin-top: 10px;
}
</style>
© 2020 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
