# useScreenOrientation

响应式屏幕方向 API。它为 Web 开发者提供有关用户当前屏幕方向的信息。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { useScreenOrientation } from '@vueuse/core'

const {
  isSupported,
  orientation,
  angle,
  lockOrientation,
  unlockOrientation,
} = useScreenOrientation()
```

## 返回值

| 名称              | 类型                                          |
| ----------------- | --------------------------------------------- |
| isSupported       | `useSupported`                                |
| orientation       | `deepRef<OrientationType \| undefined>`       |
| angle             | `shallowRef`                                  |
| lockOrientation   | `Ref`                                         |
| unlockOrientation | `Ref`                                         |

## 参考

[VueUse 文档](https://vueuse.org/core/useScreenOrientation/)
