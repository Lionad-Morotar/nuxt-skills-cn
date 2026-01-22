# useFocusTrap

用于 `@vueuse/integrations` 的响应式包装器。

**包：** `@vueuse/integrations`
**分类：** '@Integrations'

## 用法

```ts
<script setup lang="ts">
import { useFocusTrap } from '@vueuse/integrations/useFocusTrap'
import { useTemplateRef } from 'vue'

const target = useTemplateRef('target')
const { hasFocus, activate, deactivate } = useFocusTrap(target)
</script>

<template>
  <div>
    <button @click="activate()">
      启用
    </button>
    <div ref="target">
      <span>拥有焦点：{{ hasFocus }}</span>
      <input type="text">
      <button @click="deactivate()">
        禁用
      </button>
    </div>
  </div>
</template>
```

## 选项

| 选项      | 类型      | 默认值  | 描述                         |
| --------- | --------- | ------- | ---------------------------- |
| immediate | `boolean` | -       | 立即激活焦点陷阱             |

## 返回值

| 名称       | 类型         |
| ---------- | ------------ |
| hasFocus   | `shallowRef` |
| isPaused   | `shallowRef` |
| activate   | `Ref`        |
| deactivate | `Ref`        |
| pause      | `Ref`        |
| unpause    | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useFocusTrap/)
