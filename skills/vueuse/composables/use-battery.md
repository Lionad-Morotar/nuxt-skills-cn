# useBattery

响应式电池状态 API，通常称为电池 API，提供有关系统电池充电水平的信息，并允许您通过事件通知了解电池电量或充电状态发生变化。这可用于在电池电量较低时调整应用程序的资源使用以减少电池耗电，或在电池耗尽前保存更改以防止数据丢失。

**包：** `@vueuse/core`  
**分类：** 传感器

## 用法

```ts
import { useBattery } from '@vueuse/core'

const { charging, chargingTime, dischargingTime, level } = useBattery()
```

## 返回值

| 名称            | 类型           |
| --------------- | -------------- |
| isSupported     | `useSupported` |
| charging        | `shallowRef`   |
| chargingTime    | `shallowRef`   |
| dischargingTime | `shallowRef`   |
| level           | `shallowRef`   |

## 参考

[VueUse 文档](https://vueuse.org/core/useBattery/)
