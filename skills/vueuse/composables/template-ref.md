# templateRef

**包：** `@vueuse/core`
**分类：** 组件

## 用法

```ts
<script lang="ts">
import { templateRef } from '@vueuse/core'

export default {
  setup() {
    const target = templateRef('target')

    // 无需返回 `target`，它会神奇地绑定到 ref
  },
}
</script>

<template>
  <div ref="target" />
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/templateRef/)
