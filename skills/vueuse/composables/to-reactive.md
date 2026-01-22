# toReactive

将 ref 转换为响应式对象。同时也支持创建“可替换”的响应式对象。

**包:** `@vueuse/shared`  
**分类:** 响应式

## 用法

```ts
import { toReactive } from '@vueuse/core'
import { ref } from 'vue'

const refState = ref({ foo: 'bar' })

console.log(refState.value.foo) // => 'bar'

const state = toReactive(refState) // <--

console.log(state.foo) // => 'bar'

refState.value = { bar: 'foo' }

console.log(state.foo) // => undefined
console.log(state.bar) // => 'foo'
```

## 返回值

| 名称         | 类型  |
| ------------ | ----- |
| enumerable   | `Ref` |
| configurable | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/toReactive/)
