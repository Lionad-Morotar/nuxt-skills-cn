# usePointer

响应式指针状态。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
import { usePointer } from '@vueuse/core'

const { x, y, pressure, pointerType } = usePointer()
```

## 选项

| 选项         | 类型                                                                     | 默认值  | 描述                         |
| ------------ | ------------------------------------------------------------------------ | ------- | ---------------------------- |
| pointerTypes | `PointerType[]`                                                          | [       | 要监听的指针类型。           |
| initialValue | `MaybeRef<Partial<UsePointerState>>`                                     | -       | 初始值                       |
| target       | `MaybeRef<EventTarget \| null \| undefined> \| Document \| Window`       | window  | @default window              |

## 返回值

| 名称     | 类型         |
| -------- | ------------ |
| isInside | `shallowRef` |

## 参考

[VueUse 文档](https://vueuse.org/core/usePointer/)
