# useWindowScroll

响应式窗口滚动

**包：** `@vueuse/core`
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useWindowScroll } from '@vueuse/core'

const { x, y } = useWindowScroll()
</script>

<template>
  <div>
    读取当前 x、y 滚动位置：{{ x }}, {{ y }}
  </div>
  <button @click="x = 100">
    将 X 滚动至 100
  </button>
  <button @click="y = 100">
    将 Y 滚动至 100
  </button>
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useWindowScroll/)
