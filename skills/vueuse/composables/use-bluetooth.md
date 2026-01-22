# useBluetooth

响应式 Web Bluetooth API。提供连接和交互蓝牙低功耗外设的能力。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useBluetooth } from '@vueuse/core'

const {
  isSupported,
  isConnected,
  device,
  requestDevice,
  server,
} = useBluetooth({
  acceptAllDevices: true,
})
</script>

<template>
  <button @click="requestDevice()">
    请求蓝牙设备
  </button>
</template>
```

## 选项

| 选项             | 类型      | 默认值  | 描述                                                                               |
| ---------------- | --------- | ------- | ---------------------------------------------------------------------------------- |
| acceptAllDevices | `boolean` | false   | \* 一个布尔值，表示请求脚本可以接受所有蓝牙设备                                   |

## 返回值

| 名称          | 类型           |
| ------------- | -------------- |
| isSupported   | `useSupported` |
| isConnected   | `shallowRef`   |
| requestDevice | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useBluetooth/)
