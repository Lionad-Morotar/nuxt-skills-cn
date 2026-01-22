# useMemory

响应式内存信息。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useMemory } from '@vueuse/core'

const { isSupported, memory } = useMemory()
```

## 返回值

| 名称        | 类型                        |
| ----------- | --------------------------- |
| isSupported | `useSupported`              |
| memory      | `deepRef<MemoryInfo>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useMemory/)
