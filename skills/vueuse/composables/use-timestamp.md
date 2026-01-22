# useTimestamp

响应式当前时间戳

**包：** `@vueuse/core`
**分类：** 动画

## 用法

```ts
import { useTimestamp } from '@vueuse/core'

const timestamp = useTimestamp({ offset: 0 })
```

## 选项

| 选项      | 类型                                | 默认值                | 描述                                         |
| --------- | ----------------------------------- | --------------------- | -------------------------------------------- |
| controls  | `Controls`                          | false                 | 暴露更多控制选项                             |
| offset    | `number`                            | 0                     | 添加到值上的偏移量                           |
| immediate | `boolean`                           | true                  | 立即更新时间戳                               |
| interval  | `'requestAnimationFrame' \| number` | requestAnimationFrame | 更新间隔，或使用 requestAnimationFrame       |
| callback  | `(timestamp: number) =&gt; void`    | -                     | 每次更新时的回调函数                         |

## 返回值

| 名称      | 类型  |
| --------- | ----- |
| timestamp | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/useTimestamp/)
