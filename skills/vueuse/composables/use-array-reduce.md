# useArrayReduce

响应式。

**包：** `@vueuse/shared`  
**类别：** 数组

## 用法

```ts
import { useArrayReduce } from '@vueuse/core'

const sum = useArrayReduce([ref(1), ref(2), ref(3)], (sum, val) => sum + val)
// sum.value: 6
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayReduce/)
