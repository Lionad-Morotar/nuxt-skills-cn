# useArrayFindLast

响应式。

**包：** `@vueuse/shared`  
**类别：** 数组

## 用法

```ts
import { useArrayFindLast } from '@vueuse/core'

const list = [ref(1), ref(-1), ref(2)]
const positive = useArrayFindLast(list, val => val > 0)
// positive.value: 2
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayFindLast/)
