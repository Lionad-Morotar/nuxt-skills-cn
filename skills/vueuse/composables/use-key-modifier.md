# useKeyModifier

响应式修饰键状态。跟踪任何支持的修饰键的状态——参见浏览器兼容性说明。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
import { useKeyModifier } from '@vueuse/core'

const capsLockState = useKeyModifier('CapsLock')

console.log(capsLockState.value)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useKeyModifier/)
