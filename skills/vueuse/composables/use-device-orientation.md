# useDeviceOrientation

响应式 DeviceOrientationEvent。为网页开发者提供设备物理方向信息。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
import { useDeviceOrientation } from '@vueuse/core'

const {
  isAbsolute,
  alpha,
  beta,
  gamma,
} = useDeviceOrientation()
```

## 返回值

| 名称        | 类型           |
| ----------- | -------------- |
| isSupported | `useSupported` |
| isAbsolute  | `shallowRef`   |
| alpha       | `Ref`          |
| beta        | `Ref`          |
| gamma       | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useDeviceOrientation/)
