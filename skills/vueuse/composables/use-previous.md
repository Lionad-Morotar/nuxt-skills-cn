# usePrevious

保存 ref 的前一个值。

**包：** `@vueuse/core`  
**分类：** 工具函数

## 用法

```ts
import { usePrevious } from '@vueuse/core'
import { shallowRef } from 'vue'

const counter = shallowRef('Hello')
const previous = usePrevious(counter)

console.log(previous.value) // undefined

counter.value = 'World'

console.log(previous.value) // Hello
```

## 参考

[VueUse 文档](https://vueuse.org/core/usePrevious/)
