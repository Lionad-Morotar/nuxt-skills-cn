# useWakeLock

响应式屏幕唤醒锁 API。提供一种方法，使应用程序在需要持续运行时能够防止设备屏幕变暗或锁定。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { useWakeLock } from '@vueuse/core'

const { isSupported, isActive, forceRequest, request, release } = useWakeLock()
```

## 返回值

| 名称         | 类型                                         |
| ------------ | -------------------------------------------- |
| sentinel     | `shallowRef<WakeLockSentinel \| null>`       |
| isSupported  | `useSupported`                               |
| isActive     | `computed`                                   |
| request      | `Ref`                                        |
| forceRequest | `Ref`                                        |
| release      | `Ref`                                        |

## 参考

[VueUse 文档](https://vueuse.org/core/useWakeLock/)
