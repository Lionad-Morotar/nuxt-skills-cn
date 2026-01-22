# useScroll

响应式滚动位置与状态。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useScroll } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const { x, y, isScrolling, arrivedState, directions } = useScroll(el)
</script>

<template>
  <div ref="el" />
</template>
```

## 选项

| 选项     | 类型     | 默认值  | 描述                                                   |
| -------- | -------- | ------- | ------------------------------------------------------ |
| throttle | `number` | 0       | 滚动事件的节流时间，默认禁用。                         |
| idle     | `number` | 200     | 滚动结束时的检测时间。                                 |
| offset   | `{`      | -       | 按照 x 像素偏移到达状态。                              |

## 返回值

| 名称         | 类型         |
| ------------ | ------------ |
| x            | `computed`   |
| y            | `computed`   |
| isScrolling  | `shallowRef` |
| arrivedState | `reactive`   |
| directions   | `reactive`   |

## 参考

[VueUse 文档](https://vueuse.org/core/useScroll/)
