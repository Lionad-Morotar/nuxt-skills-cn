# watchWithFilter

带有额外 EventFilter 控制。

**包：** `@vueuse/shared`  
**类别：** Watch

## 用法

```ts
import { debounceFilter, watchWithFilter } from '@vueuse/core'

watchWithFilter(
  source,
  () => { console.log('changed!') }, // 回调将以 500ms 的防抖方式被调用
  {
    eventFilter: debounceFilter(500), // throttledFilter、pausableFilter 或自定义过滤器
  },
)
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchWithFilter/)
