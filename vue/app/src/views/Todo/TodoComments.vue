<template>
  <div>
    <p>{{id}}のコメント一覧</p>
    <router-link :to="{name: 'todo-home'}">詳細に戻る</router-link>

    <template v-for="comment in comments">
      <div :key="comment.id">
        <p>コメントid: {{ comment.id }}</p>
        <p>コメント: {{ comment.memo }}</p>
        <p>作成日: {{ comment.createdAt }}</p>
      </div>
    </template>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      comments: []
    }
  },
  created() {
    this.initializeData()
  },
  methods: {
    async initializeData() {
      const url = `http://localhost:3000/api/v1/todos/${this.id}/todo_comments`
      const { data } = await axios.get(url)
      this.comments = data.todoComments
    }
  }
}
</script>
