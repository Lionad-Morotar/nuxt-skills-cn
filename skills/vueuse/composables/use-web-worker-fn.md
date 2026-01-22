# useWebWorkerFn

在不阻塞 UI 的情况下运行耗时函数，使用简单的语法并利用 Promise。这是 alewin/useWorker 的移植版本。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { useWebWorkerFn } from '@vueuse/core'

const { workerFn } = useWebWorkerFn(() => {
  // 在 Web Worker 中执行的一些繁重工作
})
```

## 返回值

| 名称            | 类型                                |
| --------------- | ----------------------------------- |
| workerFn        | `Ref`                               |
| workerStatus    | `shallowRef<WebWorkerStatus>`       |
| workerTerminate | `Ref`                               |

## 参考

[VueUse 文档](https://vueuse.org/core/useWebWorkerFn/)
