# useAnimate

响应式 Web 动画 API。

**包：** `@vueuse/core`
**分类：** 动画

## 用法

```ts
<script setup lang="ts">
import { useAnimate } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const {
  isSupported,
  animate,

  // 操作
  play,
  pause,
  reverse,
  finish,
  cancel,

  // 状态
  pending,
  playState,
  replaceState,
  startTime,
  currentTime,
  timeline,
  playbackRate,
} = useAnimate(el, { transform: 'rotate(360deg)' }, 1000)
</script>

<template>
  <span ref="el" style="display:inline-block">useAnimate</span>
</template>
```

## 选项

| 选项         | 类型                              | 默认值  | 描述                                                                                   |
| ------------ | --------------------------------- | ------- | -------------------------------------------------------------------------------------- |
| immediate    | `boolean`                         | true    | 在使用 `useAnimate` 时自动运行 play                                                    |
| commitStyles | `boolean`                         | false   | 是否将动画结束时的样式状态提交到被动画化的元素                                         |
| persist      | `boolean`                         | false   | 是否保留动画                                                                           |
| onReady      | `(animate: Animation) =&gt; void` | -       | 动画初始化后执行                                                                       |
| onError      | `(e: unknown) =&gt; void`         | -       | 捕获错误时的回调函数                                                                   |

## 返回值

| 名称         | 类型                                             |
| ------------ | ------------------------------------------------ |
| isSupported  | `useSupported`                                   |
| animate      | `shallowRef&lt;Animation \| undefined&gt;`       |
| pause        | `Ref`                                            |
| reverse      | `Ref`                                            |
| finish       | `Ref`                                            |
| cancel       | `Ref`                                            |
| playState    | `computed`                                       |
| replaceState | `computed`                                       |
| startTime    | `computed&lt;CSSNumberish \| number \| null&gt;` |
| currentTime  | `computed`                                       |
| timeline     | `computed`                                       |
| playbackRate | `computed`                                       |

## 参考

[VueUse 文档](https://vueuse.org/core/useAnimate/)
