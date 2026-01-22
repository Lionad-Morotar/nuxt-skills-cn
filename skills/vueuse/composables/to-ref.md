# toRef

将 value/ref/getter 统一规范化为 ref。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { toRef } from '@vueuse/core'

const foo = ref('hi')

const a = toRef(0) // Ref<number>
const b = toRef(foo) // Ref<string>
const c = toRef(() => 'hi') // ComputedRef<string>
```

## 参考

[VueUse 文档](https://vueuse.org/core/toRef/)
