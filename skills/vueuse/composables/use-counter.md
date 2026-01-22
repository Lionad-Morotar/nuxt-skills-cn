# useCounter

带有工具函数的基本计数器。

**包：** `@vueuse/shared`  
**分类：** 工具函数

## 用法

```ts
import { useCounter } from '@vueuse/core'

const { count, inc, dec, set, reset } = useCounter()
```

## 返回值

| 名称  | 类型         |
| ----- | ------------ |
| count | `shallowRef` |
| inc   | `Ref`        |
| dec   | `Ref`        |
| get   | `Ref`        |
| set   | `Ref`        |
| reset | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useCounter/)
