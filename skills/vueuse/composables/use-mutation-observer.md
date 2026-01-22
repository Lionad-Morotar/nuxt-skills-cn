# useMutationObserver

监听 DOM 树发生的变更。MutationObserver MDN

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useMutationObserver } from '@vueuse/core'
import { ref, useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const messages = ref([])

useMutationObserver(el, (mutations) => {
  if (mutations[0])
    messages.value.push(mutations[0].attributeName)
}, {
  attributes: true,
})
</script>

<template>
  <div ref="el">
    Hello VueUse
  </div>
</template>
```

## 返回值

| 名称        | 类型           |
| ----------- | -------------- |
| isSupported | `useSupported` |
| stop        | `Ref`          |
| takeRecords | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useMutationObserver/)
