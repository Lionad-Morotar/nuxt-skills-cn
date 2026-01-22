# reactivePick

从响应式对象中响应式地选取字段。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { reactivePick } from '@vueuse/core'

const obj = reactive({
  x: 0,
  y: 0,
  elementX: 0,
  elementY: 0,
})

const picked = reactivePick(obj, 'x', 'elementX') // { x: number, elementX: number }
```

## 参考

[VueUse 文档](https://vueuse.org/core/reactivePick/)
