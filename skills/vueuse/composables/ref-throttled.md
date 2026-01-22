# refThrottled

控制 ref 值的变更速率。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { refThrottled } from '@vueuse/core'
import { shallowRef } from 'vue'

const input = shallowRef('')
const throttled = refThrottled(input, 1000)
```

## 参考

[VueUse 文档](https://vueuse.org/core/refThrottled/)
