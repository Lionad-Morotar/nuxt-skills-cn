# useTemplateRefsList

用于将 ref 绑定到模板元素和组件内部的简写形式。

**包：** `@vueuse/core`  
**分类：** 组件

## 用法

```ts
<script setup lang="ts">
import { useTemplateRefsList } from '@vueuse/core'
import { onUpdated } from 'vue'

const refs = useTemplateRefsList<HTMLDivElement>()

onUpdated(() => {
  console.log(refs)
})
</script>

<template>
  <div v-for="i of 5" :key="i" :ref="refs.set" />
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useTemplateRefsList/)
