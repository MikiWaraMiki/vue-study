<template>
  <div id="app">
    {{ apiRes }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      apiRes: ''
    }
  },
  mounted() {
    console.log(`mounted start:${this.apiRes}`)
    this.apiRes = 'fugafuga'
    console.log(`mounted end: ${this.apiRes}`)
  },
  created() {
    console.log(`created start:${this.apiRes}`)
    this.apiRes = 'hogehoge'
    console.log(`mounted end: ${this.apiRes}`)
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
