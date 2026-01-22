# useFileDialog

轻松打开文件对话框。

**包：** `@vueuse/core`
**分类：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useFileDialog } from '@vueuse/core'

const { files, open, reset, onCancel, onChange } = useFileDialog({
  accept: 'image/*', // 仅接受图像文件
  directory: true, // 如果设置为 true，则选择目录而非文件
})

onChange((files) => {
  /** 对文件执行某些操作 */
})

onCancel(() => {
  /** 取消时执行某些操作 */
})
</script>

<template>
  <button type="button" @click="open">
    选择文件
  </button>
</template>
```

## 选项

| 选项         | 类型                                      | 默认值                  | 描述                                         |
| ------------ | ----------------------------------------- | ----------------------- | -------------------------------------------- |
| multiple     | `MaybeRef&lt;boolean&gt;`                 | true                    | @default true                                |
| accept       | `MaybeRef&lt;string&gt;`                  | -                       | @default '\*'                                |
| capture      | `MaybeRef&lt;string&gt;`                  | -                       | 选择用于捕获文件的输入源。                   |
| reset        | `MaybeRef&lt;boolean&gt;`                 | false                   | 打开文件对话框时重置。                       |
| directory    | `MaybeRef&lt;boolean&gt;`                 | false                   | 选择目录而非文件。                           |
| initialFiles | `Array&lt;File&gt; \| FileList`           | null                    | 要设置的初始文件。                           |
| input        | `MaybeElementRef&lt;HTMLInputElement&gt;` | document.createElement( | 用于文件对话框的输入元素。                   |

## 返回值

| 名称     | 类型                              |
| -------- | --------------------------------- |
| files    | `deepRef&lt;FileList \| null&gt;` |
| open     | `Ref`                             |
| reset    | `Ref`                             |
| onCancel | `Ref`                             |
| onChange | `Ref`                             |

## 参考

[VueUse 文档](https://vueuse.org/core/useFileDialog/)
