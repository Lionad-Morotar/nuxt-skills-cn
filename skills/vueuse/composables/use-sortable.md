# useSortable

用于 `@vueuse/integrations` 的封装组件。

**包:** `@vueuse/integrations`
**分类:** '@Integrations'

## 用法

```ts
<script setup lang="ts">
import { useSortable } from '@vueuse/integrations/useSortable'
import { shallowRef, useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const list = shallowRef([{ id: 1, name: 'a' }, { id: 2, name: 'b' }, { id: 3, name: 'c' }])

useSortable(el, list)
</script>

<template>
  <div ref="el">
    <div v-for="item in list" :key="item.id">
      {{ item.name }}
    </div>
  </div>
</template>
```

## 配置项

| 配置项       | 类型      | 默认值  | 描述                                                                           |
| ------------ | --------- | ------- | ------------------------------------------------------------------------------ |
| watchElement | `boolean` | false   | 监听元素引用的变化并自动重新初始化 Sortable                                  |

## 返回值

| 名称   | 类型  |
| ------ | ----- |
| stop   | `Ref` |
| start  | `Ref` |
| option | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/useSortable/)
