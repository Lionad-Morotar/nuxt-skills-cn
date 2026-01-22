# useMousePressed

响应式鼠标按下状态。由目标元素触发，由窗口释放。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
import { useMousePressed } from '@vueuse/core'

const { pressed } = useMousePressed()
```

## 返回值

| 名称       | 类型                                   |
| ---------- | -------------------------------------- |
| pressed    | `shallowRef`                           |
| sourceType | `shallowRef<UseMouseSourceType>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useMousePressed/)
