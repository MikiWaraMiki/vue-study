<template>
  <div id="app">
    <input type="number" v-model="arrayNum" placeholder="数字を入力してください" />
    <button @click="createArray()">FizzBuzz計算</button>
    <template v-if="nums">
      <p v-for="num in nums" :key="num">
        {{ num }}は{{ fizzBuzzText(num) }}
      </p>
    </template>
    <template v-else>
      <p>数字が入力されていません</p>
    </template>
  </div>
</template>

<script>
export default {
  data() {
    return {
      nums: undefined,
      arrayNum: undefined,
    }
  },
  methods: {
    createArray() {
      if( !this.arrayNum || this.arrayNum < 1) return

      const parseIntNumber = parseInt(this.arrayNum)
      this.nums = [...Array(parseIntNumber).keys()].map(i => ++i)
      console.log(this.nums)
    },
    fizzBuzzText(num) {
      const fizzBuzzStr = (num % 3 ? '' : 'Fizz') + (num % 5 ? '' : 'Buzz')
      return fizzBuzzStr || 'なんでもないや'
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
