# useTimeout

在指定时间后更新值并提供控制选项。

**包：** `@vueuse/shared`  
**分类：** 动画

## 用法

```ts
import { useTimeout } from '@vueuse/core'

const ready = useTimeout(1000)
```

## 选项

| 选项     | 类型       | 默认值  | 描述               |
| -------- | ---------- | ------- | ------------------ |
| controls | `Controls` | false   | 提供更多控制选项   |
| callback | `Fn`       | -       | 超时后的回调函数   |

## 返回值

| 名称  | 类型       |
| ----- | ---------- |
| ready | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useTimeout/)
