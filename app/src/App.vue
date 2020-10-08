<template>
  <div id="app">
    <div class="single-data-biding">
      <h3>単方向データバイディングの例</h3>
      <p> {{ singleText }}</p>
    </div>

    <div class="bidirectional-data-biding">
      <h3>双方向データバイディングの例</h3>
      <input type="text" v-model="bidirectionalText" />
      <p> {{ bidirectionalText }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      singleText: '単方向データバイディング',
      bidirectionalText: '双方向データバイディング',
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
