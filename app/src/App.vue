<template>
  <div id="app">
    <hello-world
      :msg="msg"
      @input="onClickVal($event)"
    />
  </div>
</template>
<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld'

export default {
  components: {
    HelloWorld,
  },
  data() {
    return {
      msg: "Hello World!",
      clickVal: false,
    }
  },
  methods: {
    onClickVal(val) {
      this.msg = val.target.value
    }
  },
}
</script>

<style>
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
