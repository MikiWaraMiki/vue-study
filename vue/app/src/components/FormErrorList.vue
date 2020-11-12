<template>
  <div>
    <ul class="o-errors-area" v-for="(error, index) in errors" :key="index">
      <li>{{ error }}</li>
    </ul>
  </div>
</template>
<script>
export default {
  props: {
    errors: {
      type: Array,
      default: () => {
        return []
      }
    }
  }
}
</script>
<style scoped>
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
</style>
