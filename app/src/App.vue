<template>
  <div id="app">
    <div>
      <scoped-slot>
        <template v-slot:header>
          <div>
            Headerどす〜〜〜
          </div>
        </template>
        <template #footer="slotProps">
          <p>FooterFoterFooterFooter</p>
          <p>{{ slotProps.copyLight }}</p>
        </template>
      </scoped-slot>
    </div>
  </div>
</template>
<script>
// @ is an alias to /src
import ScopedSlot from '@/components/ScopedSlot'

export default {
  components: {
    ScopedSlot
  },
}
</script>
