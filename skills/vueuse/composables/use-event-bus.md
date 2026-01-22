# useEventBus

一个基础事件总线。

**包：** `@vueuse/core`
**分类：** 工具

## 用法

```ts
import { useEventBus } from '@vueuse/core'

const bus = useEventBus<string>('news')

function listener(event: string) {
  console.log(`news: ${event}`)
}

// 监听一个事件
const unsubscribe = bus.on(listener)

// 触发一个事件
bus.emit('The Tokyo Olympics has begun')

// 取消注册监听器
unsubscribe()
// 或者
bus.off(listener)

// 清除所有监听器
bus.reset()
```

## 返回值

| 名称  | 类型  |
| ----- | ----- |
| on    | `Ref` |
| once  | `Ref` |
| off   | `Ref` |
| emit  | `Ref` |
| reset | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/useEventBus/)
