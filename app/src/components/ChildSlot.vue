<template>
  <div>
    <p>これは共通で表示される部品です。</p>
    <slot name="header">
      <p>header slotが指定されなかった場合に表示される部品です</p>
    </slot>
    <slot name="footer">
      <p>footer slotが指定されなかった場合に表示される部品です</p>
    </slot>
  </div>
</template>
