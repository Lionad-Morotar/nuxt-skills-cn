# useDrauu

drauu 的响应式实例。

**包：** `@vueuse/integrations`  
**分类：** '@Integrations'

## 用法

```ts
<script setup lang="ts">
import { toRefs } from '@vueuse/core'
import { useDrauu } from '@vueuse/integrations/useDrauu'
import { useTemplateRef } from 'vue'

const target = useTemplateRef('target')
const { undo, redo, canUndo, canRedo, brush } = useDrauu(target)
const { color, size } = toRefs(brush)
</script>

<template>
  <svg ref="target" />
</template>
```

## 返回值

| 名称          | 类型                   |
| ------------- | ---------------------- |
| drauuInstance | `deepRef&lt;Drauu&gt;` |
| load          | `Ref`                  |
| dump          | `Ref`                  |
| clear         | `Ref`                  |
| cancel        | `Ref`                  |
| undo          | `Ref`                  |
| redo          | `Ref`                  |
| canUndo       | `shallowRef`           |
| canRedo       | `shallowRef`           |
| brush         | `deepRef&lt;Brush&gt;` |
| onChanged     | `Ref`                  |
| onCommitted   | `Ref`                  |
| onStart       | `Ref`                  |
| onEnd         | `Ref`                  |
| onCanceled    | `Ref`                  |

## 参考

[VueUse 文档](https://vueuse.org/core/useDrauu/)
