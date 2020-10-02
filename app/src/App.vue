<template>
  <div id="app">
    <p v-if="msg">
      {{ msg }}
    </p>
    <p v-else>
      文字が入力されていないで
    </p>
    <input type="text" v-model="msg" />
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      msg: ''
    }
  },
}
</script>

<style lang="scss" scoped>
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
