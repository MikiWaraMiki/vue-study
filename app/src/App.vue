<template>
  <div id="app">
    <div>
      <h3>githubからリポジトリの一覧を取得</h3>
      <select v-model="current">
        <option v-for="topic in topics" :key="topic.val" :value="topic.val">
          {{ topic.name }}
        </option>
      </select>
    </div>
    <template v-if="repoList.length > 0">
      <div v-for="(repo,index) in repoList" :key="index">
        {{ repo.full_name }}
      </div>
    </template>
    <template v-else>
      Not Found.
    </template>
  </div>
</template>

<script>
export default {
  data() {
    return {
      repoList: [],
      current: '',
      previous: '',
      topics: [
        {val: 'vue', name: 'Vue.js'},
        {val: 'react', name: 'React.js'},
        {val: 'jQuery', name: 'jQuery'},
      ]
    }
  },
  watch: {
    current: async (newVal, oldVal) => {
      if (newVal !== oldVal) {
        try {
          const result = await axios.get('https://api.github.com/search/repositories', {
            params: {q: `topic:${newVal}`}
          })
          this.repoList = result.data.items
        } catch (e) {
          console.error(e)
        }
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
</style>
