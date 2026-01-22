# useWebWorker

简单的 Web Workers 注册与通信。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
import { useWebWorker } from '@vueuse/core'

const { data, post, terminate, worker } = useWebWorker('/path/to/worker.js')
```

## 返回值

| 名称      | 类型                       |
| --------- | -------------------------- |
| data      | `Ref`                      |
| post      | `Ref`                      |
| terminate | `Ref`                      |
| worker    | `shallowRef<Worker>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useWebWorker/)
