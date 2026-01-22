# useArrayFilter

响应式

**包：** `@vueuse/shared`  
**分类：** 数组

## 用法

```ts
import { useArrayFilter } from '@vueuse/core'

const item1 = ref(0)
const item2 = ref(2)
const item3 = ref(4)
const item4 = ref(6)
const item5 = ref(8)
const list = [item1, item2, item3, item4, item5]
const result = useArrayFilter(list, i => i % 2 === 0)
// result.value: [0, 2, 4, 6, 8]
item2.value = 1
// result.value: [0, 4, 6, 8]
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayFilter/)
