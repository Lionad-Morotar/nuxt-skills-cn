# watchThrottled

限流监听。

**包：** `@vueuse/shared`  
**类别：** 监听

## 用法

```ts
import { watchThrottled } from '@vueuse/core'

watchThrottled(
  source,
  () => { console.log('changed!') },
  { throttle: 500 },
)
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchThrottled/)
