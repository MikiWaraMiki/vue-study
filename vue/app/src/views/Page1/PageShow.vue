<template>
  <div>
    <h1>/page1/:idのページ</h1>
    <p>:idには、{{ getPageId }}が入力されました</p>
  </div>
</template>
<script>
export default {
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  computed: {
    getPageId() {
      return this.id
    }
  }
}
</script>
