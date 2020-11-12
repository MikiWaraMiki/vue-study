<template>
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
</template>

<script>
export default {
  props: {
    newTodo: {
      type: Object,
      required: true
    }
  }
}
</script>
