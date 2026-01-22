# useScrollLock

锁定元素的滚动。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useScrollLock } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const isLocked = useScrollLock(el)

isLocked.value = true // 锁定
isLocked.value = false // 解锁
</script>

<template>
  <div ref="el" />
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useScrollLock/)
