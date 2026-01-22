# useVirtualList

**包:** `@vueuse/core`  
**分类:** 组件

## 用法

```ts
import { useVirtualList } from '@vueuse/core'

const { list, containerProps, wrapperProps } = useVirtualList(
  Array.from(Array.from({ length: 99999 }).keys()),
  {
    // 保持 `itemHeight` 与项的行高同步。
    itemHeight: 22,
  },
)
```

## 选项

| 选项     | 类型     | 默认值  | 描述                                       |
| -------- | -------- | ------- | ------------------------------------------ |
| overscan | `number` | 5       | 视图区域外额外缓冲的项数                   |

## 返回值

| 名称           | 类型                                    |
| -------------- | --------------------------------------- |
| calculateRange | `createCalculateRange`                  |
| scrollTo       | `createScrollTo`                        |
| containerStyle | `Ref`                                   |
| wrapperProps   | `computed`                              |
| currentList    | `Ref`                                   |
| containerRef   | `shallowRef<HTMLElement \| null>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useVirtualList/)
