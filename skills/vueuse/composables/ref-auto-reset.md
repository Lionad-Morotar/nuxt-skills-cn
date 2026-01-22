# refAutoReset

一个在经过一段时间后会重置为默认值的引用。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { refAutoReset } from '@vueuse/core'

const message = refAutoReset('default message', 1000)

function setMessage() {
  // 此处值将更改为 'message has set'，但在 1000 毫秒后会变回 'default message'
  message.value = 'message has set'
}
```

## 参考

[VueUse 文档](https://vueuse.org/core/refAutoReset/)
