# usePointerSwipe

基于 PointerEvents 的响应式滑动手势检测。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
<script setup lang="ts">
import { usePointerSwipe } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const { isSwiping, direction } = usePointerSwipe(el)
</script>

<template>
  <div ref="el">
    在此处滑动
  </div>
</template>
```

## 配置项

| 配置项            | 类型                                                         | 默认值  | 描述                         |
| ----------------- | ------------------------------------------------------------ | ------- | ---------------------------- |
| threshold         | `number`                                                     | 50      | @default 50                  |
| onSwipeStart      | `(e: PointerEvent) =&gt; void`                               | -       | 滑动手势开始时的回调函数。   |
| onSwipe           | `(e: PointerEvent) =&gt; void`                               | -       | 滑动手势移动时的回调函数。   |
| onSwipeEnd        | `(e: PointerEvent, direction: UseSwipeDirection) =&gt; void` | -       | 滑动手势结束时的回调函数。   |
| pointerTypes      | `PointerType[]`                                              | [       | 监听的指针类型。             |
| disableTextSelect | `boolean`                                                    | false   | 滑动时禁用文本选择。         |

## 返回值

| 名称        | 类型                       |
| ----------- | -------------------------- |
| isSwiping   | `shallowRef`               |
| direction   | `computed`                 |
| posStart    | `reactive&lt;Position&gt;` |
| posEnd      | `reactive&lt;Position&gt;` |
| distanceX   | `computed`                 |
| distanceY   | `computed`                 |
| stop        | `Ref`                      |

## 参考资料

[VueUse 文档](https://vueuse.org/core/usePointerSwipe/)
