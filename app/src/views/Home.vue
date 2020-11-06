<template>
  <div class="home">
    <template v-if="isMounted">
      <div v-if="!isErrorHappened">
        {{ professionals }}
      </div>
      <div v-else>
        エラーが発生しました
      </div>
    </template>
    <template v-else>
      <p>データ取得中です</p>
    </template>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      professionals: [],
      isErrorHappened: false,
      isMounted: false,
    }
  },
  async created() {
    try {
      const url = '/api/v1/for_clients/professionals'
      const result = await this.axios.get(url)
      this.professionals = result.data.professionals
    } catch (err) {
      console.error(err)
    } finally {
      this.isMounted = true
    }
  },
}
</script>
