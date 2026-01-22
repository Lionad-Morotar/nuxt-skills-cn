# onStartTyping

当用户在不可编辑元素上开始输入时触发。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
<script setup lang="ts">
import { onStartTyping } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const input = useTemplateRef('input')

onStartTyping(() => {
  if (!input.value.active)
    input.value.focus()
})
</script>

<template>
  <input ref="input" type="text" placeholder="开始输入以获得焦点">
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/onStartTyping/)
