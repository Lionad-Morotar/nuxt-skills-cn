# computedEager

无需惰性求值的即时计算属性。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { computedEager } from '@vueuse/core'

const todos = ref([])
const hasOpenTodos = computedEager(() => !!todos.length)

console.log(hasOpenTodos.value) // false
toTodos.value.push({ title: 'Learn Vue' })
console.log(hasOpenTodos.value) // true
```

## 参考

[VueUse 文档](https://vueuse.org/core/computedEager/)
