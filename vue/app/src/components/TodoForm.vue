<template>
 <form class="o-todo-form-area">
  <div class="m-state-button">
    <button @click.prevent="incrementState">インクリメント</button>
  </div>
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
  },
  data() {
    return {
      statuses: [
        { key: 'not_started_yet', name: '未着手' },
        { key: 'in_progress', name: '進行中' },
        { key: 'complete', name: '完了' }
      ]
    }
  },
  methods: {
    incrementState() {
      this.$store.dispatch('increment')
    }
  },
}
</script>
