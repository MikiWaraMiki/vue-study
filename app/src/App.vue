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
      <template v-if="isError">
        <ul class="o-errors-area" v-for="(error, index) in errors" :key="index">
          <li>{{ error }}</li>
        </ul>
      </template>
      <form class="o-todo-form-area">
        <div class="m-name-area">
          <label for="name">名前</label>
          <input id="name" type="text" v-model="newTodo.name" />
        </div>
        <div class="m-status-area">
          <label for="status">ステータス</label>
          <select v-model="newTodo.status">
            <option v-for="status in statuses" :key="status.key" :value="status.key">
              {{ status.name }}
            </option>
          </select>
        </div>
        <div class="m-description-area">
          <label for="description">詳細</label>
          <textarea id="description" placeholder="これだけは終わらせないと。。" v-model="newTodo.description"></textarea>
        </div>
      </form>
      <button @click="addItem" class="a-add-btn">登録</button>
      <div class="o-data-area">
        <h4>データの中身</h4>
        <div>{{ newTodo }}</div>
        <div>{{ removeTodoIds }}</div>
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
      newTodo: {
        name: '',
        status: '',
        description: '',
      },
      statuses: [
        { key: 'not_work', name: '未処理'},
        { key: 'in_progress', name: '進行中' },
        { key: 'finish', name: '完了'},
      ],
      removeTodoIds: [],
      errors: [],
      isError: false,
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
      ).name
    },
    removeTodo() {
      const newTodos = this.todos.filter(todo => {
        return !this.removeTodoIds.includes(todo.id)
      })
      this.todos = newTodos
    },
    selectRemoveTodos(selectedTodo) {
      const removeIndex = this.removeTodoIds.findIndex(todoId => todoId === selectedTodo.id)
      if (removeIndex > -1) {
        this.removeTodoIds.splice(removeIndex, 1)
        return
      }
      this.removeTodoIds.push(selectedTodo.id)
    },
    addItem() {
      this.errors = []
      if (!this.validate()) {
        this.isError = true
      }
      const appendTodo = {
        id: this.todos.length + 1,
        ...this.newTodo
      }
      this.todos.push(appendTodo)
      this.newTodo = Object.assign({}, {
        name: '',
        status: '',
        description: '',
      })
    },
    validate() {
      const validateResult = {
        name: this.validateName(),
        status: this.validateStatus(),
        description: this.validateDescription(),
      }
      if (Object.values(validateResult).includes(false)) {
        return false
      }

      return true
    },
    validateName() {
      if (this.newTodo.name === '') {
        this.errors.push('名前が入力されていません')
        return false
      }
      if (this.newTodo.name.length > 20) {
        this.errors.push('名前は20文字以内で入力してください')
        return false
      }
      return true
    },
    validateStatus() {
      if (this.newTodo.status === '') {
        this.errors.push('ステータスが選択されていません')
        return false
      }

      return true
    },
    validateDescription() {
      if (this.newTodo.description === '') {
        this.errors.push('詳細が入力されていません')
        return false
      }
      if (this.newTodo.description.length > 100) {
        this.errors.push('詳細は100文字以内で入力してください')
        return false
      }
      return true
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
