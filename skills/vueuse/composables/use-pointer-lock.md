# usePointerLock

响应式指针锁定。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
import { usePointerLock } from '@vueuse/core'

const {
  isSupported,
  lock,
  unlock,
  element,
  triggerElement
} = usePointerLock()
```

## 返回值

| 名称           | 类型                             |
| -------------- | -------------------------------- |
| isSupported    | `useSupported`                   |
| element        | `shallowRef&lt;MaybeElement&gt;` |
| triggerElement | `shallowRef&lt;MaybeElement&gt;` |
| lock           | `Ref`                            |
| unlock         | `Ref`                            |

## 参考

[VueUse 文档](https://vueuse.org/core/usePointerLock/)
