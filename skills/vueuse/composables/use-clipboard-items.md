# useClipboardItems

响应式剪贴板 API。提供对剪贴板命令（剪切、复制和粘贴）的响应能力，以及异步读取和写入系统剪贴板的功能。访问剪贴板内容需通过权限 API 控制。未经用户授权，不得读取或更改剪贴板内容。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useClipboardItems } from '@vueuse/core'

const mime = 'text/plain'
const source = ref([
  new ClipboardItem({
    [mime]: new Blob(['plain text'], { type: mime }),
  })
])

const { content, copy, copied, isSupported } = useClipboardItems({ source })
</script>

<template>
  <div v-if="isSupported">
    <button @click="copy(source)">
      <!-- 默认情况下，`copied` 将在 1.5 秒后重置 -->
      <span v-if="!copied">Copy</span>
      <span v-else>Copied!</span>
    </button>
    <p>
      当前已复制：<code>{{ content || 'none' }}</code>
    </p>
  </div>
  <p v-else>
    您的浏览器不支持剪贴板 API
  </p>
</template>
```

## 配置项

| 配置项       | 类型      | 默认值  | 描述                                     |
| ------------ | --------- | ------- | ---------------------------------------- |
| read         | `boolean` | false   | 启用剪贴板读取功能                       |
| source       | `Source`  | -       | 复制源                                   |
| copiedDuring | `number`  | 1500    | 重置 `copied` 引用状态的毫秒数           |

## 返回值

| 名称        | 类型                            |
| ----------- | ------------------------------- |
| isSupported | `useSupported`                  |
| content     | `deepRef<ClipboardItems>`       |
| copied      | `shallowRef`                    |
| copy        | `Ref`                           |
| read        | `Ref`                           |

## 参考

[VueUse 文档](https://vueuse.org/core/useClipboardItems/)
