<template>
  <div id="app">
    <template v-if="isShow">
      <div class="o-group-a">
        <h3>グループA</h3>
        <ul>
          <li v-for="item in groupAItems" :key="item.val">
            {{ item.val }}
          </li>
        </ul>
      </div>
      <div class="o-group-b">
        <h3>グループB</h3>
        <ul>
          <li v-for="item in groupBItems" :key="item.val">
            {{ item.val }}
          </li>
        </ul>
      </div>
      <div class="o-group-non">
        <h3>無所属</h3>
        <ul>
          <li v-for="item in groupNonItems" :key="item.val">
            {{ item.val }}
          </li>
        </ul>
      </div>
    </template>
    <div>
      <button @click="isShow = !isShow">ボタン</button>
      <p>{{ showText }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {group: 'a', val: 'A1'},
        {group: 'a', val: 'A2'},
        {group: 'b', val: 'B1'},
        {group: 'non', val: "Non1"},
        {group: 'a', val: 'A3'},
        {group: 'b', val: 'B2'},
        {group: 'b', val: 'B3'},
        {group: 'non', val: 'Non2'},
      ],
      isShow: false
    }
  },
  computed: {
    groupAItems() {
      console.log('return group a')
      return this.items.filter(item => item.group === 'a')
    },
    groupBItems() {
      console.log('return group b')
      return this.items.filter(item => item.group === 'b')
    },
    groupNonItems() {
      console.log('return group non')
      return this.items.filter(item => item.group === 'non')
    },
    showText() {
      if (this.isShow) return '表示しています'

      return '表示していません'
    }
  },
  methods: {
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
