# useIntervalFn

带控制功能的封装器

**包：** `@vueuse/shared`  
**分类：** 动画

## 用法

```ts
import { useIntervalFn } from '@vueuse/core'

const { pause, resume, isActive } = useIntervalFn(() => {
  /* 你的函数 */
}, 1000)
```

## 配置项

| 配置项            | 类型      | 默认值  | 描述                                             |
| ----------------- | --------- | ------- | ------------------------------------------------ |
| immediate         | `boolean` | true    | 立即启动计时器                                   |
| immediateCallback | `boolean` | false   | 在调用 `resume` 后立即执行回调                   |

## 返回值

| 名称     | 类型         |
| -------- | ------------ |
| isActive | `shallowRef` |
| pause    | `Ref`        |
| resume   | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useIntervalFn/)
