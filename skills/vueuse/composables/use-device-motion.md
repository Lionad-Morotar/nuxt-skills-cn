# useDeviceMotion

响应式 DeviceMotionEvent。为 Web 开发者提供有关设备位置和方向变化速度的信息。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
import { useDeviceMotion } from '@vueuse/core'

const {
  acceleration,
  accelerationIncludingGravity,
  rotationRate,
  interval,
} = useDeviceMotion()
```

## 返回值

| 名称                         | 类型           |
| ---------------------------- | -------------- |
| acceleration                 | `Ref`          |
| accelerationIncludingGravity | `Ref`          |
| rotationRate                 | `Ref`          |
| interval                     | `shallowRef`   |
| isSupported                  | `useSupported` |
| requirePermissions           | `useSupported` |
| ensurePermissions            | `Ref`          |
| permissionGranted            | `shallowRef`   |

## 参考

[VueUse 文档](https://vueuse.org/core/useDeviceMotion/)
