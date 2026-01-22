# useAsyncState

响应式异步状态。不会阻塞您的设置函数，并在承诺准备就绪时触发变更。状态默认为只读。

**包：** `@vueuse/core`  
**类别：** 状态

## 用法

```ts
import { useAsyncState } from '@vueuse/core'
import axios from 'axios'

const { state, isReady, isLoading } = useAsyncState(
  axios
    .get('https://jsonplaceholder.typicode.com/todos/1')
    .then(t => t.data),
  { id: null },
)
```

## 选项

| 选项      | 类型                      | 默认值  | 描述                                                                                     |
| --------- | ------------------------- | ------- | ---------------------------------------------------------------------------------------- |
| delay     | `number`                  | 0       | 当 "immediate" 为 true 时，承诺首次执行的延迟时间。以毫秒为单位。                       |
| immediate | `boolean`                 | true    | 函数调用后立即执行承诺。                                                                 |
| onError   | `(e: unknown) =&gt; void` | -       | 捕获错误时的回调函数。                                                                   |

## 参考

[VueUse 文档](https://vueuse.org/core/useAsyncState/)
