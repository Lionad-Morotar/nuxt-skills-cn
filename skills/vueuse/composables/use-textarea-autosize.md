# useTextareaAutosize

根据内容自动更新文本区域的高度。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useTextareaAutosize } from '@vueuse/core'

const { textarea, input } = useTextareaAutosize()
</script>

<template>
  <textarea
    ref="textarea"
    v-model="input"
    class="resize-none"
    placeholder="What's on your mind?"
  />
</template>
```

## 选项

| 选项        | 类型                                                       | 默认值  | 描述 |
| ----------- | ---------------------------------------------------------- | ------- | ----------- |
| element     | `MaybeRef&lt;HTMLTextAreaElement \| undefined \| null&gt;` | -       |             |
| input       | `MaybeRef&lt;string&gt;`                                   | -       |             |
| watch       | `WatchSource \| MultiWatchSources`                         | -       |             |
| onResize    | `() =&gt; void`                                            | -       |             |
| styleTarget | `MaybeRef&lt;HTMLElement \| undefined&gt;`                 | -       |             |
| styleProp   | `'height' \| 'minHeight'`                                  | -       |             |

## 返回值

| 名称          | 类型    |
| ------------- | ------- |
| textarea      | `toRef` |
| input         | `toRef` |
| triggerResize | `Ref`   |

## 参考

[VueUse 文档](https://vueuse.org/core/useTextareaAutosize/)
