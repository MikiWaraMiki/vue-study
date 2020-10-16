<template>
  <div id="app">
    <div>
      <h3>ParentAを呼び出します</h3>
      <parent-a></parent-a>
    </div>
    <div>
      <h3>ParentBを呼び出します</h3>
      <parent-b></parent-b>
    </div>
    <div>
      <h3>ChildSlotを直接呼び出します</h3>
      <child-slot></child-slot>
    </div>
  </div>
</template>
<script>
// @ is an alias to /src
import ParentA from '@/components/ParentA'
import ParentB from '@/components/ParentB'
import ChildSlot from '@/components/ChildSlot.vue'

export default {
  components: {
    ParentA,
    ParentB,
    ChildSlot
  },
}
</script>
