# useTimeAgo

响应式的时间 ago 功能。当时间发生变化时，自动更新 time ago 字符串。

**包：** `@vueuse/core`  
**类别：** 时间

## 用法

```ts
import { useTimeAgo } from '@vueuse/core'

const timeAgo = useTimeAgo(new Date(2021, 0, 1))
```

## 选项

| 选项             | 类型       | 默认值   | 描述                             |
| ---------------- | ---------- | -------- | -------------------------------- |
| controls         | `Controls` | false    | 暴露更多控制选项                 |
| updateInterval   | `number`   | 30_000   | 更新间隔，设为 0 以禁用自动更新 |

## 返回值

| 名称    | 类型       |
| ------- | ---------- |
| timeAgo | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useTimeAgo/)
