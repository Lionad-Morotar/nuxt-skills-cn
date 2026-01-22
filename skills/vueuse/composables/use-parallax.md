# useParallax

轻松创建视差效果。当不支持方向传感器时，会使用备用方案。

**包名：** `@vueuse/core`  
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useParallax } from '@vueuse/core'

const container = ref(null)
const { tilt, roll, source } = useParallax(container)
</script>

<template>
  <div ref="container" />
</template>
```

## 返回值

| 名称   | 类型       |
| ------ | ---------- |
| roll   | `computed` |
| tilt   | `computed` |
| source | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useParallax/)
