# createInjectionState

创建可注入组件的全局状态。

**包：** `@vueuse/shared`  
**分类：** 状态

## 用法

```ts
<!-- RootComponent.vue -->
<script setup lang="ts">
// @filename: useCounterStore.ts
// @include: useCounterStore
// ---cut---
import { useProvideCounterStore } from './useCounterStore'

useProvideCounterStore(0)
</script>

<template>
  <div>
    <slot />
  </div>
</template>
```

## 选项

| 选项         | 类型                                   | 默认值  | 描述                             |
| ------------ | -------------------------------------- | ------- | -------------------------------- |
| injectionKey | `string \| InjectionKey<Return>`       | -       | 自定义注入键，用于 InjectionState |
| defaultValue | `Return`                               | -       | InjectionState 的默认值          |

## 参考

[VueUse 文档](https://vueuse.org/core/createInjectionState/)
