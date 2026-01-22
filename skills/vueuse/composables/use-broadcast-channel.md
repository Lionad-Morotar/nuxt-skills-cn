# useBroadcastChannel

响应式 BroadcastChannel API。

**包：** `@vueuse/core`
**分类：** 浏览器

## 用法

```ts
import { useBroadcastChannel } from '@vueuse/core'
import { shallowRef } from 'vue'

const {
  isSupported,
  channel,
  post,
  close,
  error,
  isClosed,
} = useBroadcastChannel({ name: 'vueuse-demo-channel' })

const message = shallowRef('')

message.value = 'Hello, VueUse World!'

// 将消息发送到广播频道：
post(message.value)

// 如需关闭频道，可选操作：
close()
```

## 选项

| 选项 | 类型     | 默认值  | 描述               |
| ---- | -------- | ------- | ------------------ |
| name | `string` | -       | 频道的名称。       |

## 返回值

| 名称        | 类型                                           |
| ----------- | ---------------------------------------------- |
| isSupported | `useSupported`                                 |
| channel     | `deepRef< BroadcastChannel \| undefined >`     |
| data        | `deepRef`                                      |
| post        | `Ref`                                          |
| close       | `Ref`                                          |
| error       | `shallowRef< Event \| null >`                 |
| isClosed    | `shallowRef`                                   |

## 参考

[VueUse 文档](https://vueuse.org/core/useBroadcastChannel/)
