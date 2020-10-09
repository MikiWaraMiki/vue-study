<template>
  <div id="app">
    <div class="flex-item">
      <p>今のスクロールの値は{{ scrollY }}</p>
      <p>タイマーの値は{{ timer }}</p>
      <p v-if="scrollOverHundled">
        100px以上スクロール しました。
      </p>
    </div>
    <div v-for="i in repeatArray" :key="i">
      <p>{{ i }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      scrollY: 0,
      timer: null,
      arrayNum: 100,
    }
  },
  computed: {
    repeatArray() {
      return [...Array(this.arrayNum).keys()]
    },
    scrollOverHundled() {
      return this.scrollY > 100
    }
  },
  created() {
    // イベントリスナにハンドラを登録
    window.addEventListener('scroll', this.handleScroll)
  },
  beforeDestroy() {
    // SPAとかで動くアプリだと必須。
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll() {
      if (this.timer === null) {
        this.timer = setTimeout(() => {
          this.scrollY = window.scrollY
          clearTimeout(this.timer)
          this.timer = null
        }, 200)
      }
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
.flex-item {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  height: 100px;
  background: coral;
  color: white;
  margin-top: 0px;
}
</style>
