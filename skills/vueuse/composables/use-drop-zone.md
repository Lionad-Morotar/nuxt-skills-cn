# useDropZone

创建一个可以放置文件的区域。

**包：** `@vueuse/core`  
**分类：** 元素

## 用法

```ts
<script setup lang="ts">
import { useDropZone } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const dropZoneRef = useTemplateRef('dropZoneRef')

function onDrop(files: File[] | null) {
  // 当文件被放置到区域时调用
}

const { isOverDropZone } = useDropZone(dropZoneRef, {
  onDrop,
  // 指定可接收的数据类型。
  dataTypes: ['image/jpeg'],
  // 控制多文件放置
  multiple: true,
  // 是否阻止未处理事件的默认行为
  preventDefaultForUnhandled: false,
})
</script>

<template>
  <div ref="dropZoneRef">
    在此处放置文件
  </div>
</template>
```

## 选项

| 选项                       | 类型                                                                              | 默认值  | 描述                                                                             |
| -------------------------- | --------------------------------------------------------------------------------- | ------- | -------------------------------------------------------------------------------- |
| dataTypes                  | `MaybeRef&lt;readonly string[]&gt; \| ((types: readonly string[]) =&gt; boolean)` | -       | 允许的数据类型，若未设置，则允许所有数据类型。                                   |
| checkValidity              | `(items: DataTransferItemList) =&gt; boolean`                                     | -       | 与 dataTypes 类似，但提供 DataTransferItemList 用于自定义验证。                   |
| multiple                   | `boolean`                                                                         | -       | 允许放置多个文件。默认为 true。                                                  |
| preventDefaultForUnhandled | `boolean`                                                                         | -       | 阻止未处理事件的默认行为。默认为 false。                                         |

## 返回值

| 名称           | 类型                               |
| -------------- | ---------------------------------- |
| files          | `shallowRef&lt;File[] \| null&gt;` |
| isOverDropZone | `shallowRef`                       |

## 参考

[VueUse 文档](https://vueuse.org/core/useDropZone/)
