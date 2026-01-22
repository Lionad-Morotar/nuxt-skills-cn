# useTimeoutFn

带控制功能的封装。

**包：** `@vueuse/shared`  
**分类：** 动画

## 用法

```ts
import { useTimeoutFn } from '@vueuse/core'

const { isPending, start, stop } = useTimeoutFn(() => {
  /* ... */
}, 3000)
```

## 选项

| 选项              | 类型      | 默认值  | 描述                                       |
| ----------------- | --------- | ------- | ------------------------------------------ |
| immediate         | `boolean` | true    | 立即启动计时器                             |
| immediateCallback | `boolean` | false   | 调用 `start` 后立即执行回调函数            |

## 返回值

| 名称      | 类型         |
| --------- | ------------ |
| isPending | `shallowRef` |
| start     | `Ref`        |
| stop      | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useTimeoutFn/)
