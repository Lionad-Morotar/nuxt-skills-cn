# reactiveComputed

计算后的响应式对象。与返回 ref 的方式不同，它直接返回一个响应式对象。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { reactiveComputed } from '@vueuse/core'

const state = reactiveComputed(() => {
  return {
    foo: 'bar',
    bar: 'baz',
  }
})

state.bar // 'baz'
```

## 参考

[VueUse 文档](https://vueuse.org/core/reactiveComputed/)
