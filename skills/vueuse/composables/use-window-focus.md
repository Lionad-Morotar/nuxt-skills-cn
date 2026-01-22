# useWindowFocus

使用事件实时跟踪窗口焦点状态。

**包：** `@vueuse/core`  
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useWindowFocus } from '@vueuse/core'

const focused = useWindowFocus()
</script>

<template>
  <div>{{ focused }}</div>
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useWindowFocus/)
