<template>
  <div id="app">
    <hello-world
      :msg="msg"
      @input="v => msg=v"
    />
    <human-data-form
      v-bind.sync="human"
    />
    <p>{{ this.humanDesc }}</p>
  </div>
</template>
<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld'
import HumanDataForm from '@/components/HumanDataForm'

export default {
  components: {
    HelloWorld,
    HumanDataForm
  },
  data() {
    return {
      msg: "Hello World!",
      human: {
        lastName: '',
        firstName: '',
        age: 0,
      }
    }
  },
  computed: {
    humanDesc() {
      return `${this.human.firstName + this.human.lastName}です。年は、10歳サバよんで、${this.human.age}歳です。`
    }
  }
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
