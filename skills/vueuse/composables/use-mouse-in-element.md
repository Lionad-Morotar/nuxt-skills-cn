# useMouseInElement

与元素相关的响应式鼠标位置

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useMouseInElement } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const target = useTemplateRef('target')

const { x, y, isOutside } = useMouseInElement(target)
</script>

<template>
  <div ref="target">
    <h1>Hello world</h1>
  </div>
</template>
```

## 返回值

| 名称             | 类型         |
| ---------------- | ------------ |
| x                | `Ref`        |
| y                | `Ref`        |
| sourceType       | `Ref`        |
| elementX         | `shallowRef` |
| elementY         | `shallowRef` |
| elementPositionX | `shallowRef` |
| elementPositionY | `shallowRef` |
| elementHeight    | `shallowRef` |
| elementWidth     | `shallowRef` |
| isOutside        | `shallowRef` |
| stop             | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useMouseInElement/)
