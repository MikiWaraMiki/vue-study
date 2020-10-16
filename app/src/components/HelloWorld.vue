<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <input type="text" v-model="_msg" />
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  computed: {
    _msg: {
      get() {
        return this.msg
      },
      set(val) {
        console.log(val)
        this.$emit('input', val)
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
