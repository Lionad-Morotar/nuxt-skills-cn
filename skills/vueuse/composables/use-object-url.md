# useObjectUrl

表示对象的响应式 URL。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useObjectUrl } from '@vueuse/core'
import { shallowRef } from 'vue'

const file = shallowRef()
const url = useObjectUrl(file)

function onFileChange(event) {
  file.value = event.target.files[0]
}
</script>

<template>
  <input type="file" @change="onFileChange">

  <a :href="url">打开文件</a>
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useObjectUrl/)
