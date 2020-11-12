<template>
  <div class="hello">
    <child-slot>
      <div slot="header">
        <p>ParantAでHeaderを指定しました</p>
      </div>
    </child-slot>
  </div>
</template>

<script>
import ChildSlot from '@/components/ChildSlot.vue'
export default {
  components: {
    ChildSlot
  }
}
</script>
