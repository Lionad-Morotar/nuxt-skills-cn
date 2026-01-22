# until

承诺的一次性监听变化

**包：** `@vueuse/shared`
**类别：** 监听

## 用法

```ts
import { until, useAsyncState } from '@vueuse/core'

const { state, isReady } = useAsyncState(
  fetch('https://jsonplaceholder.typicode.com/todos/1').then(t => t.json()),
  {},
)

;(async () => {
  await until(isReady).toBe(true)

  console.log(state) // 状态现已就绪！
})()
```

## 参考

[VueUse 文档](https://vueuse.org/core/until/)
