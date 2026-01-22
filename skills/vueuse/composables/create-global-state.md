# createGlobalState

将状态保留在全局作用域中，以便在多个 Vue 实例间复用。

**包:** `@vueuse/shared`  
**类别:** 状态

## 用法

```ts
// store.ts
import { createGlobalState } from '@vueuse/core'
import { shallowRef } from 'vue'

export const useGlobalState = createGlobalState(
  () => {
    const count = shallowRef(0)
    return { count }
  }
)
```

## 参考

[VueUse 文档](https://vueuse.org/core/createGlobalState/)
