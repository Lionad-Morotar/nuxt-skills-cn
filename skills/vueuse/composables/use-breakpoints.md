# useBreakpoints

响应式视口断点。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { breakpointsTailwind, useBreakpoints } from '@vueuse/core'

const breakpoints = useBreakpoints(breakpointsTailwind)

const smAndLarger = breakpoints.greaterOrEqual('sm') // sm 及以上
const largerThanSm = breakpoints.greater('sm') // 仅大于 sm
const lgAndSmaller = breakpoints.smallerOrEqual('lg') // lg 及以下
const smallerThanLg = breakpoints.smaller('lg') // 仅小于 lg
```

## 选项

| 选项     | 类型                         | 默认值    | 描述                                                                    |
| -------- | ---------------------------- | --------- | ----------------------------------------------------------------------- |
| strategy | `'min-width' \| 'max-width'` | min-width | 生成的快捷方法（如 `.lg`）所使用的查询策略                              |

## 参考

[VueUse 文档](https://vueuse.org/core/useBreakpoints/)
