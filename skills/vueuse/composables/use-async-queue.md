# useAsyncQueue

按顺序执行每个异步任务，并将当前任务的结果传递给下一个任务

**包：** `@vueuse/core`
**分类：** 工具函数

## 用法

```ts
import { useAsyncQueue } from '@vueuse/core'

function p1() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(1000)
    }, 10)
  })
}

function p2(result: number) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(1000 + result)
    }, 20)
  })
}

const { activeIndex, result } = useAsyncQueue([p1, p2])

console.log(activeIndex.value) // 当前待处理任务的索引

console.log(result) // 任务的结果
```

## 选项

| 选项       | 类型            | 默认值  | 描述                                         |
| ---------- | --------------- | ------- | -------------------------------------------- |
| interrupt  | `boolean`       | true    | 当前任务失败时中断后续任务。                 |
| onError    | `() => void`    | -       | 任务失败时触发。                             |
| onFinished | `() => void`    | -       | 任务结束时触发。                             |
| signal     | `AbortSignal`   | -       | 可用于中止任务的 AbortSignal。               |

## 返回值

| 名称        | 类型                       |
| ----------- | -------------------------- |
| activeIndex | `shallowRef<number>`       |
| result      | `reactive`                 |

## 参考

[VueUse 文档](https://vueuse.org/core/useAsyncQueue/)
