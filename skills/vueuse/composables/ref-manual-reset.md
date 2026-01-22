# refManualReset

创建一个具有手动重置功能的引用。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { refManualReset } from '@vueuse/core'

const message = refManualReset('default message')

message.value = 'message has set'

message.reset()

console.log(message.value) // 'default message'
```

## 参考

[VueUse 文档](https://vueuse.org/core/refManualReset/)
