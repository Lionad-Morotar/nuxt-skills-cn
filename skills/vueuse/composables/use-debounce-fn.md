# useDebounceFn

防抖函数执行。

**包：** `@vueuse/shared`  
**类别：** 工具函数

## 用法

```ts
import { useDebounceFn, useEventListener } from '@vueuse/core'

const debouncedFn = useDebounceFn(() => {
  // 执行某些操作
}, 1000)

useEventListener(window, 'resize', debouncedFn)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useDebounceFn/)
