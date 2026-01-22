# useElementBounding

HTML 元素的响应式边界框

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useElementBounding } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const { x, y, top, right, bottom, left, width, height } = useElementBounding(el)
</script>

<template>
  <div ref="el" />
</template>
```

## 选项

| 选项         | 类型      | 默认值  | 描述                                       |
| ------------ | --------- | ------- | ------------------------------------------ |
| reset        | `boolean` | true    | 组件卸载时将值重置为 0                                     |
| windowResize | `boolean` | true    | 监听窗口大小调整事件                                   |
| windowScroll | `boolean` | true    | 监听窗口滚动事件                                     |
| immediate    | `boolean` | true    | 组件挂载时立即调用更新                                   |

## 返回值

| 名称   | 类型         |
| ------ | ------------ |
| height | `shallowRef` |
| bottom | `shallowRef` |
| left   | `shallowRef` |
| right  | `shallowRef` |
| top    | `shallowRef` |
| width  | `shallowRef` |
| x      | `shallowRef` |
| y      | `shallowRef` |
| update | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useElementBounding/)
