<template>
  <div>
    <p>ID: {{ todo.id }}</p>
    <p>todo名: {{ todo.name }}</p>
    <p>ステータス: {{ todo.status }}</p>
    <p>詳細: {{ todo.description }}</p>
    <p>作成日: {{ todo.createdAt }}</p>
    <div>
      <router-link to='/'>
        一覧に戻る
      </router-link>
    </div>
    <div>
      <router-link :to="{name: 'todo-comment-index'}">
        コメント一覧
      </router-link>
    </div>
    <router-view></router-view>
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
      todo: {}
    }
  },
  created() {
    console.log('created call')
    this.initializeData()
  },
  methods: {
    // 本来はvuex使った方がいい
    async initializeData() {
      const { data } = await axios.get(
        `http://localhost:3000/api/v1/todos/${this.id}`
      )
      this.todo = data.todo
    }
  },
}
</script>
