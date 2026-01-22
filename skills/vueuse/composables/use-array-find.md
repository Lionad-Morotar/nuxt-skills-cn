# useArrayFind

响应式。

**包：** `@vueuse/shared`  
**分类：** 数组

## 用法

```ts
import { useArrayFind } from '@vueuse/core'

const list = [ref(1), ref(-1), ref(2)]
const positive = useArrayFind(list, val => val > 0)
// positive.value: 1
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayFind/)
