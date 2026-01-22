# useZoomLevel

响应式 WebFrame 缩放级别。

**包：** `@vueuse/electron`
**类别：** '@Electron'

## 用法

```ts
import { useZoomLevel } from '@vueuse/electron'

// 如果未显式提供 webFrame，则启用 nodeIntegration
// 请参阅：https://www.electronjs.org/docs/api/webview-tag#nodeintegration
// Ref 结果将返回
const level = useZoomLevel()
console.log(level.value) // 输出当前缩放级别
level.value = 2 // 更改当前缩放级别
```

## 参考

[VueUse 文档](https://vueuse.org/core/useZoomLevel/)
