# watchDebounced

防抖监听

**包:** `@vueuse/shared`  
**类别:** 监听

## 用法

```ts
import { watchDebounced } from '@vueuse/core'

watchDebounced(
  source,
  () => { console.log('changed!') },
  { debounce: 500, maxWait: 1000 },
)
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchDebounced/)
