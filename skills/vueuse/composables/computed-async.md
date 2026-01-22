# computedAsync

为异步函数计算值

**包：** `@vueuse/core`  
**分类：** 响应式

## 用法

```ts
import { computedAsync } from '@vueuse/core'
import { shallowRef } from 'vue'

const name = shallowRef('jack')

const userInfo = computedAsync(
  async () => {
    return await mockLookUp(name.value)
  },
  null, /* 初始状态 */
)
```

## 参考

[VueUse 文档](https://vueuse.org/core/computedAsync/)
