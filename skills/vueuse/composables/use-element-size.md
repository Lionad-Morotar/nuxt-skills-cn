# useElementSize

HTML 元素的响应式尺寸。ResizeObserver MDN

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useElementSize } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const { width, height } = useElementSize(el)
</script>

<template>
  <div ref="el">
    Height: {{ height }}
    Width: {{ width }}
  </div>
</template>
```

## 返回值

| 名称   | 类型         |
| ------ | ------------ |
| width  | `shallowRef` |
| height | `shallowRef` |
| stop   | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useElementSize/)
