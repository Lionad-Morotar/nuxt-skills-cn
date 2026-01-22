# useParentElement

获取指定元素的父级元素

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useParentElement } from '@vueuse/core'

const parentEl = useParentElement()

onMounted(() => {
  console.log(parentEl.value)
})
</script>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useParentElement/)
