# useThrottledRefHistory

节流过滤器的简写。

**包：** `@vueuse/core`
**分类：** 状态

## 用法

```ts
import { useThrottledRefHistory } from '@vueuse/core'
import { shallowRef } from 'vue'

const counter = shallowRef(0)
const { history, undo, redo } = useThrottledRefHistory(counter, { deep: true, throttle: 1000 })
```

## 参考

[VueUse 文档](https://vueuse.org/core/useThrottledRefHistory/)
