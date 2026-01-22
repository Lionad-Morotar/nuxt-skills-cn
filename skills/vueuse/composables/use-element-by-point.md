# useElementByPoint

通过点获取响应式元素。

**包：** `@vueuse/core`  
**分类：** 传感器

## 用法

```ts
import { useElementByPoint, useMouse } from '@vueuse/core'

const { x, y } = useMouse({ type: 'client' })
const { element } = useElementByPoint({ x, y })
```

## 返回值

| 名称          | 类型                    |
| ------------- | ----------------------- |
| isSupported   | `useSupported`          |
| element       | `shallowRef<any>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useElementByPoint/)
