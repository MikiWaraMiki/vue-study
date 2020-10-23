<template>
  <div>
    <slot name="header"></slot>
    <h1>名前付きスロットを試してみよう</h1>

    <slot name="footer" :copy-light="copyLight">
      <p>デフォルトで、フッターに表示させています。</p>
    </slot>
  </div>

</template>
<script>
export default {
  data() {
    return {
      copyLight: "コピーらいと" // <- これを親コンポーネントから参照したい
    }
  },
}
</script>
