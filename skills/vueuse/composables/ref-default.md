# refDefault

将默认值应用于 ref。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { refDefault, useStorage } from '@vueuse/core'

const raw = useStorage('key')
const state = refDefault(raw, 'default')

raw.value = 'hello'
console.log(state.value) // hello

raw.value = undefined
console.log(state.value) // default
```

## 参考

[VueUse 文档](https://vueuse.org/core/refDefault/)
