# useArrayIncludes

响应式

**包：** `@vueuse/shared`  
**类别：** 数组

## 用法

```ts
import { useArrayIncludes } from '@vueuse/core'

const list = ref([0, 2, 4, 6, 8])
const result = useArrayIncludes(list, 10)
// result.value: false
list.value.push(10)
// result.value: true
list.value.pop()
// result.value: false
```

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayIncludes/)
