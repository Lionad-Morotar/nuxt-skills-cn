# useResizeObserver

报告元素内容尺寸或边框盒的更改

**包：** `@vueuse/core`
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useResizeObserver } from '@vueuse/core'
import { ref, useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const text = ref('')

useResizeObserver(el, (entries) => {
  const entry = entries[0]
  const { width, height } = entry.contentRect
  text.value = `width: ${width}, height: ${height}`
})
</script>

<template>
  <div ref="el">
    {{ text }}
  </div>
</template>
```

## 返回值

| 名称        | 类型           |
| ----------- | -------------- |
| isSupported | `useSupported` |
| stop        | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useResizeObserver/)
