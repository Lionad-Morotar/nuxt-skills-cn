# useArrayJoin

响应式

**包：** `@vueuse/shared`  
**类别：** 数组

## 用法

```ts
import { useArrayJoin } from '@vueuse/core'

const item1 = ref('foo')
const item2 = ref(0)
const item3 = ref({ prop: 'val' })
const list = [item1, item2, item3]
const result = useArrayJoin(list)
// result.value: foo,0,[object Object]
item1.value = 'bar'
// result.value: bar,0,[object Object]
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayJoin/)
