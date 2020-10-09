<template>
  <div id="app">
    <div>
      <label for="price">金額</label>
      <input id="price" v-model.number="price" />
    </div>
    <div>
      <label for="amount">税込み</label>
      <input id="amount" v-model.number="amount" />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      price: 0,
      tax: 0.1,
    }
  },
  computed: {
    amount: {
      get: function() { return Math.round(this.price * (1 + this.tax)) },
      set: function(val) { this.price = Math.round(val / (1 + this.tax)) }
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
