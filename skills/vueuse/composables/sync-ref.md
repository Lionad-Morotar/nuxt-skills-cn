# syncRef

双向引用同步。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { syncRef } from '@vueuse/core'

const a = ref('a')
const b = ref('b')

const stop = syncRef(a, b)

console.log(a.value) // a

b.value = 'foo'

console.log(a.value) // foo

a.value = 'bar'

console.log(b.value) // bar
```

## 参考

[VueUse 文档](https://vueuse.org/core/syncRef/)
