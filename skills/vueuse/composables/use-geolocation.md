# useGeolocation

响应式地理定位 API。如果用户愿意，它允许用户向网页应用程序提供其位置信息。出于隐私保护原因，系统会请求用户授权以报告位置信息。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
import { useGeolocation } from '@vueuse/core'

const { coords, locatedAt, error, resume, pause } = useGeolocation()
```

## 返回值

| 名称         | 类型                                                   |
| ------------ | ------------------------------------------------------ |
| isSupported  | `useSupported`                                         |
| coords       | `Ref`                                                  |
| locatedAt    | `shallowRef<number \| null>`                           |
| error        | `shallowRef<GeolocationPositionError \| null>`         |
| resume       | `Ref`                                                  |
| pause        | `Ref`                                                  |

## 参考

[VueUse 文档](https://vueuse.org/core/useGeolocation/)
