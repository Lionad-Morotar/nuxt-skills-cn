# useCycleList

循环遍历项目列表。

**包：** `@vueuse/core`
**类别：** 工具函数

## 用法

```ts
import { useCycleList } from '@vueuse/core'

const { state, next, prev, go } = useCycleList([
  'Dog',
  'Cat',
  'Lizard',
  'Shark',
  'Whale',
  'Dolphin',
  'Octopus',
  'Seal',
])

console.log(state.value) // 'Dog'

prev()

console.log(state.value) // 'Seal'

go(3)

console.log(state.value) // 'Shark'
```

## 选项

| 选项          | 类型                                  | 默认值  | 描述                                                   |
| ------------- | ------------------------------------- | ------- | ------------------------------------------------------ |
| initialValue  | `MaybeRef<T>`                         | -       | 状态的初始值。                                         |
| fallbackIndex | `number`                              | -       | 当索引不存在时使用的默认索引。                         |
| getIndexOf    | `(value: T, list: T[]) => number`     | -       | 自定义函数，用于获取当前值的索引。                     |

## 返回值

| 名称  | 类型                      |
| ----- | ------------------------- |
| state | `shallowRef`              |
| index | `computed<number>`        |
| next  | `Ref`                     |
| prev  | `Ref`                     |
| go    | `Ref`                     |

## 参考

[VueUse 文档](https://vueuse.org/core/useCycleList/)
