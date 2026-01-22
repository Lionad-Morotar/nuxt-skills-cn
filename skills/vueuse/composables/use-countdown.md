# useCountdown

用于提供倒计时器的封装。

**包：** `@vueuse/core`
**类别：** 时间

## 用法

```ts
import { useCountdown } from '@vueuse/core'

const countdownSeconds = 5
const { remaining, start, stop, pause, resume } = useCountdown(countdownSeconds, {
  onComplete() {

  },
  onTick() {

  }
})
```

## 选项

| 选项       | 类型                             | 默认值  | 描述                                                         |
| ---------- | -------------------------------- | ------- | ------------------------------------------------------------ |
| interval   | `MaybeRefOrGetter<number>`       | -       | 倒计时的间隔，单位为毫秒。默认值为 1000 毫秒。               |
| onComplete | `() => void`                     | -       | 倒计时归零时调用的回调函数。                                 |
| onTick     | `() => void`                     | -       | 倒计时每次更新时调用的回调函数。                             |
| immediate  | `boolean`                        | false   | 是否立即启动倒计时。                                         |

## 返回值

| 名称      | 类型         |
| --------- | ------------ |
| remaining | `shallowRef` |
| reset     | `Ref`        |
| stop      | `Ref`        |
| start     | `Ref`        |
| pause     | `Ref`        |
| resume    | `Ref`        |
| isActive  | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useCountdown/)
