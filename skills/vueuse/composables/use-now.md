# useNow

响应式当前日期实例。

**包：** `@vueuse/core`
**分类：** 动画

## 用法

```ts
import { useNow } from '@vueuse/core'

const now = useNow()
```

## 选项

| 选项      | 类型                                | 默认值                | 描述                                               |
| --------- | ----------------------------------- | --------------------- | -------------------------------------------------- |
| controls  | `Controls`                          | false                 | 暴露更多控制选项                                   |
| immediate | `boolean`                           | true                  | 立即启动计时器                                     |
| interval  | `'requestAnimationFrame' \| number` | requestAnimationFrame | 更新间隔，单位为毫秒，或使用 requestAnimationFrame |

## 返回值

| 名称 | 类型      |
| ---- | --------- |
| now  | `deepRef` |

## 参考

[VueUse 文档](https://vueuse.org/core/useNow/)
