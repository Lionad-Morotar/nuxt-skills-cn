# useAxios

`@vueuse/integrations` 的封装库。
**包名：** `@vueuse/integrations`
**分类：** '@Integrations'

## 用法

```ts
import { useAxios } from '@vueuse/integrations/useAxios'

const { data, isFinished } = useAxios('/api/posts')
```

## 选项

| 选项           | 类型                      | 默认值  | 描述                                                         |
| -------------- | ------------------------- | ------- | ------------------------------------------------------------ |
| immediate      | `boolean`                 | -       | 在使用 `useAxios` 时自动运行 axios 请求                     |
| shallow        | `boolean`                 | true    | 使用 shallowRef。                                            |
| abortPrevious  | `boolean`                 | true    | 当发起新请求时中止之前的请求。                               |
| onError        | `(e: unknown) => void`    | -       | 捕获错误时的回调函数。                                       |
| onSuccess      | `(data: T) => void`       | -       | 捕获成功时的回调函数。                                       |
| resetOnExecute | `boolean`                 | -       | 在执行 Promise 前将状态重置为 initialState。                 |
| onFinish       | `() => void`              | -       | 请求完成时的回调函数。                                       |

## 参考

[VueUse 文档](https://vueuse.org/core/useAxios/)
