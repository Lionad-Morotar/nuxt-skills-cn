# reactiveOmit

响应式地从响应式对象中排除字段。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { reactiveOmit } from '@vueuse/core'

const obj = reactive({
  x: 0,
  y: 0,
  elementX: 0,
  elementY: 0,
})

const picked = reactiveOmit(obj, 'x', 'elementX') // { y: number, elementY: number }
```

## 参考

[VueUse 文档](https://vueuse.org/core/reactiveOmit/)
