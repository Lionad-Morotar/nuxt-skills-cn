# onClickOutside

监听元素外部的点击事件。适用于模态框或下拉菜单。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { onClickOutside } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const target = useTemplateRef('target')

onClickOutside(target, event => console.log(event))
</script>

<template>
  <div ref="target">
    Hello world
  </div>
  <div>Outside element</div>
</template>
```

## 选项

| 选项         | 类型                                                    | 默认值  | 描述                                               |
| ------------ | ------------------------------------------------------- | ------- | -------------------------------------------------- |
| ignore       | `MaybeRefOrGetter<(MaybeElementRef \| string)[]>`       | -       | 不应触发事件的元素列表。                           |
| capture      | `boolean`                                               | true    | 对内部事件监听器使用捕获阶段。                     |
| detectIframe | `boolean`                                               | false   | 如果焦点移动到 iframe 中则运行处理函数。           |
| controls     | `Controls`                                              | false   | 使用 controls 来取消/触发监听器。                  |

## 返回值

| 名称   | 类型  |
| ------ | ----- |
| stop   | `Ref` |
| cancel | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/onClickOutside/)
