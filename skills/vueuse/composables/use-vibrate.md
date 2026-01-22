# useVibrate

响应式振动 API

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
import { useVibrate } from '@vueuse/core'

// 此操作会使设备振动 300 毫秒，
// 然后暂停 100 毫秒，再使设备振动 300 毫秒：
const { vibrate, stop, isSupported } = useVibrate({ pattern: [300, 100, 300] })

// 启动振动，当模式完成后会自动停止：
vibrate()

// 如果你希望手动停止，可以：
stop()
```

## 选项

| 选项     | 类型                                         | 默认值  | 描述                         |
| -------- | -------------------------------------------- | ------- | ---------------------------- |
| pattern  | `MaybeRefOrGetter<number[] \| number>`       | []      | * 振动模式                   |
| interval | `number`                                     | 0       | 持续振动的间隔，单位为毫秒   |

## 返回值

| 名称             | 类型           |
| ---------------- | -------------- |
| isSupported      | `useSupported` |
| pattern          | `Ref`          |
| intervalControls | `Ref`          |
| vibrate          | `Ref`          |
| stop             | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useVibrate/)
