# createTemplatePromise

模板作为 Promise。可用于构建自定义对话框、模态框、Toast 等。

**包：** `@vueuse/core`
**分类：** 组件

## 用法

```ts
<script setup lang="ts">
import { createTemplatePromise } from '@vueuse/core'

const TemplatePromise = createTemplatePromise<ReturnType>()

async function open() {
  const result = await TemplatePromise.start()
  // 点击按钮，result 为 'ok'
}
</script>

<template>
  <TemplatePromise v-slot="{ promise, resolve, reject, args }">
    <!-- 你的 UI -->
    <button @click="resolve('ok')">
      确定
    </button>
  </TemplatePromise>
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/createTemplatePromise/)
