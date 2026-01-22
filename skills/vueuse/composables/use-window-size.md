# useWindowSize

响应式窗口大小

**包：** `@vueuse/core`
**类别：** 元素

## 用法

```ts
<script setup lang="ts">
import { useWindowSize } from '@vueuse/core'

const { width, height } = useWindowSize()
</script>

<template>
  <div>
    Width: {{ width }}
    Height: {{ height }}
  </div>
</template>
```

## 选项

| 选项              | 类型                             | 默认值  | 描述                                                                      |
| ----------------- | -------------------------------- | ------- | ------------------------------------------------------------------------- |
| listenOrientation | `boolean`                        | true    | 监听窗口 `orientationchange` 事件                                         |
| includeScrollbar  | `boolean`                        | true    | 是否将滚动条包含在宽度和高度中                                            |
| type              | `'inner' \| 'outer' \| 'visual'` | inner   | 使用 `window.innerWidth` 或 `window.outerWidth` 或 `window.visualViewport` |

## 返回值

| 名称   | 类型         |
| ------ | ------------ |
| width  | `shallowRef` |
| height | `shallowRef` |

## 参考

[VueUse 文档](https://vueuse.org/core/useWindowSize/)
