# useClipboard

响应式剪贴板 API。提供对剪贴板命令（剪切、复制和粘贴）的响应能力，以及异步读取和写入系统剪贴板的功能。对剪贴板内容的访问受权限 API 限制。未经用户许可，不得读取或更改剪贴板内容。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useClipboard } from '@vueuse/core'

const source = ref('Hello')
const { text, copy, copied, isSupported } = useClipboard({ source })
</script>

<template>
  <div v-if="isSupported">
    <button @click="copy(source)">
      <!-- 默认情况下，`copied` 将在 1.5 秒后重置 -->
      <span v-if="!copied">Copy</span>
      <span v-else>Copied!</span>
    </button>
    <p>当前已复制：<code>{{ text || 'none' }}</code></p>
  </div>
  <p v-else>
    您的浏览器不支持剪贴板 API
  </p>
</template>
```

## 选项

| 选项         | 类型      | 默认值  | 描述                                                         |
| ------------ | --------- | ------- | ------------------------------------------------------------ |
| read         | `boolean` | false   | 启用剪贴板读取功能                                           |
| source       | `Source`  | -       | 复制源                                                       |
| copiedDuring | `number`  | 1500    | 重置 `copied` 引用状态的毫秒数                               |
| legacy       | `boolean` | false   | 如果剪贴板未定义，是否回退到使用 document.execCommand('copy') |

## 返回值

| 名称        | 类型         |
| ----------- | ------------ |
| isSupported | `computed`   |
| text        | `shallowRef` |
| copied      | `shallowRef` |
| copy        | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useClipboard/)
