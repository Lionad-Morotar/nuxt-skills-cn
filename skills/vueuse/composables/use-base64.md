# useBase64

响应式 Base64 转换。支持纯文本、缓冲区、文件、画布、对象、映射、集合和图像。

**包：** `@vueuse/core`  
**类别：** 工具

## 用法

```ts
import { useBase64 } from '@vueuse/core'
import { shallowRef } from 'vue'

const text = shallowRef('')

const { base64 } = useBase64(text)
```

## 选项

| 选项    | 类型      | 默认值  | 描述                     |
| ------- | --------- | ------- | ------------------------ |
| dataUrl | `boolean` | true    | 以 Data URL 格式输出     |

## 返回值

| 名称    | 类型         |
| ------- | ------------ |
| base64  | `shallowRef` |
| promise | `Ref`        |
| execute | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useBase64/)
