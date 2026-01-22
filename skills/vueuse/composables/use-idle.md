# useIdle

追踪用户是否处于非活动状态。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
import { useIdle } from '@vueuse/core'

const { idle, lastActive } = useIdle(5 * 60 * 1000) // 5 分钟

console.log(idle.value) // true 或 false
```

## 选项

| 选项                      | 类型                | 默认值  | 描述                                             |
| ------------------------- | ------------------- | ------- | ------------------------------------------------ |
| events                    | `WindowEventName[]` | [       | 用于检测用户活动的事件名称                       |
| listenForVisibilityChange | `boolean`           | true    | 监听文档可见性变化                               |
| initialState              | `boolean`           | false   | ref idle 的初始状态                              |

## 返回值

| 名称       | 类型         |
| ---------- | ------------ |
| idle       | `shallowRef` |
| lastActive | `shallowRef` |
| reset      | `Ref`        |
| stop       | `Ref`        |
| start      | `Ref`        |
| isPending  | `shallowRef` |

## 参考

[VueUse 文档](https://vueuse.org/core/useIdle/)
