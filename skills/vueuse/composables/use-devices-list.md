# useDevicesList

响应式 enumerateDevices，用于列出可用的输入/输出设备。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
import { useDevicesList } from '@vueuse/core'

const {
  devices,
  videoInputs: cameras,
  audioInputs: microphones,
  audioOutputs: speakers,
} = useDevicesList()
```

## 选项

| 选项               | 类型      | 默认值  | 描述                                                   |
| ------------------ | --------- | ------- | ------------------------------------------------------ |
| requestPermissions | `boolean` | false   | 如果未授予权限，则立即请求权限。                       |

## 返回值

| 名称              | 类型           |
| ----------------- | -------------- |
| devices           | `deepRef`      |
| ensurePermissions | `Ref`          |
| permissionGranted | `shallowRef`   |
| videoInputs       | `computed`     |
| audioInputs       | `computed`     |
| audioOutputs      | `computed`     |
| isSupported       | `useSupported` |

## 参考

[VueUse 文档](https://vueuse.org/core/useDevicesList/)
