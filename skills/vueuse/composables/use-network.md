# useNetwork

响应式网络状态。网络信息 API 提供有关系统连接的信息，以通用连接类型（例如“wifi”、“cellular”等）为准。这可用于根据用户的连接选择高清内容或标清内容。整个 API 由 NetworkInformation 接口的添加以及 Navigator 接口上的一个属性组成：Navigator.connection。

**包名：** `@vueuse/core`  
**分类：** 传感器

## 用法

```ts
import { useNetwork } from '@vueuse/core'

const { isOnline, offlineAt, downlink, downlinkMax, effectiveType, saveData, type } = useNetwork()

console.log(isOnline.value)
```

## 返回值

| 名称          | 类型                                     |
| ------------- | ---------------------------------------- |
| isSupported   | `useSupported`                           |
| isOnline      | `shallowRef`                             |
| saveData      | `shallowRef`                             |
| offlineAt     | `shallowRef<number \| undefined>`        |
| onlineAt      | `shallowRef<number \| undefined>`        |
| downlink      | `shallowRef<number \| undefined>`        |
| downlinkMax   | `shallowRef<number \| undefined>`        |
| effectiveType | `shallowRef<NetworkEffectiveType>`       |
| rtt           | `shallowRef<number \| undefined>`        |
| type          | `shallowRef<NetworkType>`                |

## 参考

[VueUse 文档](https://vueuse.org/core/useNetwork/)
