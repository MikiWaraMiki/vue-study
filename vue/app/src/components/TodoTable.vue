<template>
  <table class="o-todo-list">
    <tbody>
      <tr v-for="todo in todos" :key="todo.id" :class="statusRowClass(todo.status)">
        <td>{{ todo.id }}</td>
        <td>
          <router-link :to="`/todos/${todo.id}`">
            {{ todo.name }}
          </router-link>
        </td>
        <td>{{ statusText(todo.status) }}</td>
        <td>{{ todo.description }}</td>
        <td>
          <input type="checkbox" :id="`todo-${todo.id}`" @change="selectRemoveTodos(todo)" />
        </td>
      </tr>
    </tbody>
  </table>
</template>
<script>
export default {
  props: {
    todos: {
      type: Array,
      required: true
    },
  },
  data() {
    return {
      statuses: [
        { key: "not_started_yet", text: '未着手' },
        { key: "in_progress", text: '進行中' },
        { key: "complete", text: '完了' },
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
    selectRemoveTodos(selectedTodo) {
      // 選択された時に、チェックが外れた場合は、削除対象から外す
      // チェックが入った時には、削除対象に追加する
      console.log(selectedTodo)
    },
  },
}
</script>
<style scoped>
.o-todo-list {
  width: 100%;
  border: 1px solid;
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

</style>
