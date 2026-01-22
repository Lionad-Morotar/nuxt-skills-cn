# useTransition

值之间的过渡

**包：** `@vueuse/core`  
**类别：** 动画

## 用法

```ts
import { TransitionPresets, useTransition } from '@vueuse/core'
import { shallowRef } from 'vue'

const source = shallowRef(0)

const output = useTransition(source, {
  duration: 1000,
  easing: TransitionPresets.easeInOutCubic,
})
```

## 选项

| 选项       | 类型                      | 默认值  | 描述                                            |
| ---------- | ------------------------- | ------- | ----------------------------------------------- |
| delay      | `MaybeRef<number>`        | -       | 启动过渡前等待的毫秒数                          |
| disabled   | `MaybeRef<boolean>`       | -       | 禁用过渡                                        |
| onFinished | `() => void`              | -       | 过渡完成后执行的回调函数                        |
| onStarted  | `() => void`              | -       | 过渡开始后执行的回调函数                        |

## 参考

[VueUse 文档](https://vueuse.org/core/useTransition/)
