# useTextSelection

基于 `@vueuse/core` 的 Reactivity 文本选择跟踪器。

**包:** `@vueuse/core`  
**分类:** 传感器

## 用法

```ts
<script setup lang="ts">
import { useTextSelection } from '@vueuse/core'

const state = useTextSelection()
</script>

<template>
  <p>{{ state.text }}</p>
</template>
```

## 返回值

| 名称      | 类型                                  |
| --------- | ------------------------------------- |
| text      | `computed`                            |
| rects     | `computed`                            |
| ranges    | `computed<Range[]>`                   |
| selection | `shallowRef<Selection \| null>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useTextSelection/)
