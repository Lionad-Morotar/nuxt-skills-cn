# useDraggable

使元素可拖拽。

**包：** `@vueuse/core`
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useDraggable } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')

// `style` 将是用于 `left: ?px; top: ?px;` 的辅助计算属性
const { x, y, style } = useDraggable(el, {
  initialValue: { x: 40, y: 40 },
})
</script>

<template>
  <div ref="el" :style="style" style="position: fixed">
    拖拽我！我位于 {{ x }}, {{ y }}
  </div>
</template>
```

## 选项

| 选项             | 类型                                                                                           | 默认值    | 描述                                                                         |
| ---------------- | ---------------------------------------------------------------------------------------------- | --------- | ---------------------------------------------------------------------------- |
| exact            | `MaybeRefOrGetter&lt;boolean&gt;`                                                              | false     | 仅在直接点击元素时开始拖拽                                                   |
| preventDefault   | `MaybeRefOrGetter&lt;boolean&gt;`                                                              | false     | 阻止事件默认行为                                                             |
| stopPropagation  | `MaybeRefOrGetter&lt;boolean&gt;`                                                              | false     | 阻止事件冒泡                                                                 |
| capture          | `boolean`                                                                                      | true      | 是否在捕获阶段分发事件                                                       |
| draggingElement  | `MaybeRefOrGetter&lt;HTMLElement \| SVGElement \| Window \| Document \| null \| undefined&gt;` | window    | 附加 `pointermove` 和 `pointerup` 事件的元素。                               |
| containerElement | `MaybeRefOrGetter&lt;HTMLElement \| SVGElement \| null \| undefined&gt;`                       | undefined | 用于计算边界元素（若未设置，则使用事件的目标元素）。                         |
| handle           | `MaybeRefOrGetter&lt;HTMLElement \| SVGElement \| null \| undefined&gt;`                       | target    | 触发拖拽事件的句柄                                                           |
| pointerTypes     | `PointerType[]`                                                                                | [         | 监听的指针类型。                                                             |

## 返回值

| 名称       | 类型                      |
| ---------- | ------------------------- |
| position   | `deepRef&lt;Position&gt;` |
| isDragging | `Ref`                     |
| style      | `Ref`                     |

## 参考

[VueUse 文档](https://vueuse.org/core/useDraggable/)
