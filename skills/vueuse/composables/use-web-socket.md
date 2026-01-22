# useWebSocket

响应式 WebSocket 客户端。

**包：** `@vueuse/core`
**类别：** 网络

## 用法

```ts
import { useWebSocket } from '@vueuse/core'

const { status, data, send, open, close } = useWebSocket('ws://websocketurl')
```

## 选项

| 选项            | 类型                                                | 默认值  | 描述                                                                      |
| --------------- | --------------------------------------------------- | ------- | ------------------------------------------------------------------------- |
| heartbeat       | `boolean \| {`                                      | false   | 每隔 x 毫秒发送一次心跳                                                   |
| message         | `MaybeRefOrGetter<WebSocketHeartbeatMessage>`       | ping    | 心跳消息                                                                  |
| responseMessage | `MaybeRefOrGetter<WebSocketHeartbeatMessage>`       | -       | 心跳响应消息，若未定义则使用消息本身                                      |
| interval        | `number`                                            | 1000    | 心跳间隔，单位为毫秒                                                      |
| pongTimeout     | `number`                                            | 1000    | 心跳响应超时时间，单位为毫秒                                              |

## 返回值

| 名称   | 类型                                |
| ------ | ----------------------------------- |
| data   | `Ref`                               |
| status | `shallowRef<WebSocketStatus>`       |
| close  | `Ref`                               |
| send   | `Ref`                               |
| open   | `Ref`                               |
| ws     | `Ref`                               |

## 参考

[VueUse 文档](https://vueuse.org/core/useWebSocket/)
