# useConfirmDialog

创建事件钩子以支持模态框和确认对话框链。

**包：** `@vueuse/core`  
**类别：** 工具函数

## 用法

```ts
<script setup lang="ts">
import { useConfirmDialog } from '@vueuse/core'

const { isRevealed, reveal, confirm, cancel, onReveal, onConfirm, onCancel }
  = useConfirmDialog()
</script>

<template>
  <button @click="reveal">
    显示模态框
  </button>

  <teleport to="body">
    <div v-if="isRevealed" class="modal-bg">
      <div class="modal">
        <h2>确认？</h2>
        <button @click="confirm">
          是
        </button>
        <button @click="cancel">
          取消
        </button>
      </div>
    </div>
  </teleport>
</template>
```

## 返回值

| 名称       | 类型  |
| ---------- | ----- |
| isRevealed | `Ref` |
| reveal     | `Ref` |
| confirm    | `Ref` |
| cancel     | `Ref` |
| onReveal   | `Ref` |
| onConfirm  | `Ref` |
| onCancel   | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/useConfirmDialog/)
