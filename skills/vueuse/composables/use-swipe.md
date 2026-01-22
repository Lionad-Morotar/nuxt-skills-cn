# useSwipe

基于 的响应式滑动检测。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useSwipe } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const { isSwiping, direction } = useSwipe(el)
</script>

<template>
  <div ref="el">
    在此处滑动
  </div>
</template>
```

## 选项

| 选项         | 类型                                                       | 默认值  | 描述                     |
| ------------ | ---------------------------------------------------------- | ------- | ------------------------ |
| passive      | `boolean`                                                  | true    | 将事件注册为被动事件     |
| threshold    | `number`                                                   | 50      | @default 50              |
| onSwipeStart | `(e: TouchEvent) =&gt; void`                               | -       | 滑动开始时的回调函数     |
| onSwipe      | `(e: TouchEvent) =&gt; void`                               | -       | 滑动过程中的回调函数     |
| onSwipeEnd   | `(e: TouchEvent, direction: UseSwipeDirection) =&gt; void` | -       | 滑动结束时的回调函数     |

## 返回值

| 名称        | 类型                       |
| ----------- | -------------------------- |
| isSwiping   | `shallowRef`               |
| direction   | `computed`                 |
| coordsStart | `reactive&lt;Position&gt;` |
| coordsEnd   | `reactive&lt;Position&gt;` |
| lengthX     | `Ref`                      |
| lengthY     | `Ref`                      |
| stop        | `Ref`                      |

## 参考

[VueUse 文档](https://vueuse.org/core/useSwipe/)
