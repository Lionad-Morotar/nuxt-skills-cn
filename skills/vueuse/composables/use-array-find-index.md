# useArrayFindIndex

响应式

**包：** `@vueuse/shared`  
**类别：** 数组

## 用法

```ts
import { useArrayFindIndex } from '@vueuse/core'

const item1 = ref(0)
const item2 = ref(2)
const item3 = ref(4)
const item4 = ref(6)
const item5 = ref(8)
const list = [item1, item2, item3, item4, item5]
const result = useArrayFindIndex(list, i => i % 2 === 0)
// result.value: 0
item1.value = 1
// result.value: 1
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayFindIndex/)
