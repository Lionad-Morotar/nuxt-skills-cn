# useStorageAsync

支持异步操作的响应式存储。

**包：** `@vueuse/core`
**类别：** 状态

## 用法

```ts
import { useStorageAsync } from '@vueuse/core'

const accessToken = useStorageAsync('access.token', '', SomeAsyncStorage)

// 在异步存储准备就绪之前，accessToken.value 可能为空
console.log(accessToken.value) // ""

setTimeout(() => {
  // 经过一段时间后，异步存储准备就绪
  console.log(accessToken.value) // "存储中实际保存的值"
}, 500)
```

## 选项

| 选项       | 类型                       | 默认值  | 描述                        |
| ---------- | -------------------------- | ------- | --------------------------- |
| serializer | `SerializerAsync<T>`       | -       | 自定义数据序列化            |
| onReady    | `(value: T) => void`       | -       | 首次加载值时的钩子函数。    |

## 参考

[VueUse 文档](https://vueuse.org/core/useStorageAsync/)
