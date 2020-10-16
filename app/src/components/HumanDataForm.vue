<template>
  <div>
    <h3>人の名前</h3>
    <input
      type="text"
      :value="firstName"
      placeholder="山田"
      @input="$emit('update:firstName', $event.target.value)"
    />
    <input
      type="text"
      :value="lastName"
      placeholder="太郎"
      @input="$emit('update:lastName', $event.target.value)"
    />
    <input
      type="number"
      :value="age"
      @input="$emit('update:age', $event.target.value)"
    />
  </div>
</template>

<script>
export default {
  props: {
    lastName: {
      type: String,
      required: true,
    },
    firstName: {
      type: String,
      required: true
    },
    age: {
      type: [Number,String],
      required: true
    }
  },
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
