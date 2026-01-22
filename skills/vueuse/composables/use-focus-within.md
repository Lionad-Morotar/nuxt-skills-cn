# useFocusWithin

响应式工具，用于跟踪元素或其后代是否获得焦点。其行为旨在与 CSS 伪类一致。常见用法是在表单元素上，以检测其任何输入框当前是否获得焦点。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useFocusWithin } from '@vueuse/core'
import { ref, watch } from 'vue'

const target = ref()
const { focused } = useFocusWithin(target)

watch(focused, (focused) => {
  if (focused)
    console.log('Target contains the focused element')
  else
    console.log('Target does NOT contain the focused element')
})
</script>

<template>
  <form ref="target">
    <input type="text" placeholder="First Name">
    <input type="text" placeholder="Last Name">
    <input type="text" placeholder="Email">
    <input type="text" placeholder="Password">
  </form>
</template>
```

## 返回值

| 名称    | 类型       |
| ------- | ---------- |
| focused | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useFocusWithin/)
