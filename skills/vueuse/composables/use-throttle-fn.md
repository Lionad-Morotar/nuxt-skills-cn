# useThrottleFn

限制函数的执行频率。特别适用于对如 resize 和 scroll 等事件的处理程序进行速率限制。

**包:** `@vueuse/shared`  
**类别:** 工具函数

## 用法

```ts
import { useThrottleFn } from '@vueuse/core'

const throttledFn = useThrottleFn(() => {
  // 执行某些操作，每秒最多调用一次
}, 1000)

useEventListener(window, 'resize', throttledFn)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useThrottleFn/)
