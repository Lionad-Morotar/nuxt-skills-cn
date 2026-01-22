# useActiveElement

响应式

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useActiveElement } from '@vueuse/core'
import { watch } from 'vue'

const activeElement = useActiveElement()

watch(activeElement, (el) => {
  console.log('focus changed to', el)
})
</script>
```

## 选项

| 选项             | 类型      | 默认值  | 描述                                                |
| ---------------- | --------- | ------- | --------------------------------------------------- |
| deep             | `boolean` | true    | 在 shadow dom 内深度搜索活动元素                    |
| triggerOnRemoval | `boolean` | false   | 当活动元素从 DOM 中移除时跟踪其状态                 |

## 参考

[VueUse 文档](https://vueuse.org/core/useActiveElement/)
