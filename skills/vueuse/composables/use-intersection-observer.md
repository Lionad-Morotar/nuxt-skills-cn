# useIntersectionObserver

检测目标元素的可见性。

**包：** `@vueuse/core`
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'
import { shallowRef, useTemplateRef } from 'vue'

const target = useTemplateRef('target')
const targetIsVisible = shallowRef(false)

const { stop } = useIntersectionObserver(
  target,
  ([entry], observerElement) => {
    targetIsVisible.value = entry?.isIntersecting || false
  },
)
</script>

<template>
  <div ref="target">
    <h1>Hello world</h1>
  </div>
</template>
```

## 选项

| 选项       | 类型                                  | 默认值  | 描述                                                                                                         |
| ---------- | ------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------ |
| immediate  | `boolean`                             | true    | 创建时立即启动 IntersectionObserver                                                                          |
| root       | `MaybeComputedElementRef \| Document` | -       | 测试相交时用作边界框的元素或文档。                                                                           |
| rootMargin | `MaybeRefOrGetter<string>`            | -       | 用于在计算相交时添加到根元素边界框的一组偏移量字符串。                                                       |
| threshold  | `number \| number[]`                  | 0       | 一个介于 0.0 和 1.0 之间的数字，或该范围内的数字数组。                                                       |

## 返回值

| 名称        | 类型           |
| ----------- | -------------- |
| isSupported | `useSupported` |
| isActive    | `shallowRef`   |

## 参考

[VueUse 文档](https://vueuse.org/core/useIntersectionObserver/)
