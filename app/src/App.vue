<template>
  <div id="app">
    <div v-if="counte == 0">
      <p>押されていないやないかい</p>
    </div>
    <div v-else>
      <p>{{ count }}回押されました</p>
    </div>
    <button @click="incrementCount">
      インクリメント
    </button>

    <button @click="reset">
      リセット
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      count: 0,
    }
  },
  methods: {
    incrementCount() {
      console.log(`before increment value: ${this.count}`)
      this.count += 1
      console.log(`after increment value: ${this.count}`)
    },
    reset() {
      this.count = 0
      window.alert("リセットしました")
    }
  },
}
</script>
<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
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
</style>
