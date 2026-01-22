# createSharedComposable

创建一个可组合函数，可在多个 Vue 实例中使用。

**包：** `@vueuse/shared`  
**类别：** 状态

## 用法

```ts
import { createSharedComposable, useMouse } from '@vueuse/core'

const useSharedMouse = createSharedComposable(useMouse)

// CompA.vue
const { x, y } = useSharedMouse()

// CompB.vue - 将复用之前的状态，且不会注册新的事件监听器
const { x, y } = useSharedMouse()
```

## 参考

[VueUse 文档](https://vueuse.org/core/createSharedComposable/)
