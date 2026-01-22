# createRef

根据参数返回 `ref` 或 `shallowRef`。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { createRef } from '@vueuse/core'
import { isShallow, ref } from 'vue'

const initialData = 1

const shallowData = createRef(initialData)
const deepData = createRef(initialData, true)

isShallow(shallowData) // true
isShallow(deepData) // false
```

## 参考

[VueUse 文档](https://vueuse.org/core/createRef/)
