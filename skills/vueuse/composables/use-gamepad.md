# useGamepad

为 Gamepad API 提供响应式绑定。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
<script lang="ts" setup>
import { useGamepad } from '@vueuse/core'
import { computed } from 'vue'

const { isSupported, gamepads } = useGamepad()
const gamepad = computed(() => gamepads.value.find(g => g.mapping === 'standard'))
</script>

<template>
  <span>
    {{ gamepad.id }}
  </span>
</template>
```

## 返回值

| 名称             | 类型                       |
| ---------------- | -------------------------- |
| isSupported      | `useSupported`             |
| onConnected      | `Ref`                      |
| onDisconnected   | `Ref`                      |
| gamepads         | `deepRef<Gamepad[]>`       |
| pause            | `Ref`                      |
| resume           | `Ref`                      |
| isActive         | `Ref`                      |

## 参考

[VueUse 文档](https://vueuse.org/core/useGamepad/)
