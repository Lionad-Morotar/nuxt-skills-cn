# useElementHover

响应式元素的悬停状态。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useElementHover } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const myHoverableElement = useTemplateRef('myHoverableElement')
const isHovered = useElementHover(myHoverableElement)
</script>

<template>
  <button ref="myHoverableElement">
    {{ isHovered }}
  </button>
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useElementHover/)
