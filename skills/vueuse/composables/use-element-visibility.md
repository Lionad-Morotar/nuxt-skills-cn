# useElementVisibility

跟踪元素在视口内的可见性。

**包：** `@vueuse/core`  
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useElementVisibility } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const target = useTemplateRef('target')
const targetIsVisible = useElementVisibility(target)
</script>

<template>
  <div ref="target">
    <h1>Hello world</h1>
  </div>
</template>
```

## 选项

| 选项         | 类型                                     | 默认值  | 描述                                                                           |
| ------------ | ---------------------------------------- | ------- | ------------------------------------------------------------------------------ |
| initialValue | `boolean`                                | false   | 初始值。                                                                       |
| scrollTarget | `UseIntersectionObserverOptions['root']` | -       | 用于检查目标可见性的视口元素。                                                 |
| once         | `boolean`                                | false   | 元素可见性首次改变时停止跟踪                                                   |

## 参考

[VueUse 文档](https://vueuse.org/core/useElementVisibility/)
