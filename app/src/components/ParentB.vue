<template>
  <div class="hello">
    <child-slot>
      <div slot="footer">
        <p>ParantBでHeaderを指定しました</p>
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
