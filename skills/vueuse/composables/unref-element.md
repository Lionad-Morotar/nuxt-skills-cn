# unrefElement

从 Vue ref 或组件实例中获取底层 DOM 元素

**包：** `@vueuse/core`
**类别：** 组件

## 用法

```ts
<script setup lang="ts">
import { unrefElement } from '@vueuse/core'
import { onMounted, useTemplateRef } from 'vue'

const div = useTemplateRef('div') // 将绑定到 <div> 元素
const hello = useTemplateRef('hello') // 将绑定到 HelloWorld 组件

onMounted(() => {
  console.log(unrefElement(div)) // <div> 元素
  console.log(unrefElement(hello)) // HelloWorld 组件的根元素
})
</script>

<template>
  <div ref="div" />
  <HelloWorld ref="hello" />
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/unrefElement/)
