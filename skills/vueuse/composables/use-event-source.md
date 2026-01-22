# useEventSource

EventSource 或 Server-Sent-Events 实例与 HTTP 服务器建立持久连接，服务器以 text/event-stream 格式发送事件。

**包：** `@vueuse/core`  
**类别：** 网络

## 用法

```ts
import { useEventSource } from '@vueuse/core'

const { status, data, error, close } = useEventSource('https://event-source-url')
```

## 选项

| 选项          | 类型                           | 默认值  | 描述                             |
| ------------- | ------------------------------ | ------- | -------------------------------- |
| autoReconnect | `boolean \| {`                 | false   | 启用自动重连                     |
| retries       | `number \| (() =&gt; boolean)` | -1      | 最大重试次数。                   |
| delay         | `number`                       | 1000    | 重连延迟，单位为毫秒             |
| onFailed      | `Fn`                           | -       | 达到最大重试次数时的回调函数。   |

## 返回值

| 名称          | 类型                                  |
| ------------- | ------------------------------------- |
| eventSource   | `deepRef&lt;EventSource \| null&gt;`  |
| event         | `Ref`                                 |
| data          | `Ref`                                 |
| status        | `shallowRef&lt;EventSourceStatus&gt;` |
| error         | `shallowRef&lt;Event \| null&gt;`     |
| open          | `Ref`                                 |
| close         | `Ref`                                 |
| lastEventId   | `shallowRef&lt;string \| null&gt;`    |

## 参考

[VueUse 文档](https://vueuse.org/core/useEventSource/)
