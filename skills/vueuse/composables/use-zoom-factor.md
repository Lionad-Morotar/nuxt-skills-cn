# useZoomFactor

响应式 WebFrame 缩放因子。

**包：** `@vueuse/electron`
**分类：** '@Electron'

## 用法

```ts
import { useZoomFactor } from '@vueuse/electron'

// 如果未显式提供 webFrame，请启用 nodeIntegration
// 参见：https://www.electronjs.org/docs/api/webview-tag#nodeintegration
// Ref 结果将返回
const factor = useZoomFactor()
console.log(factor.value) // 打印当前缩放因子
factor.value = 2 // 更改当前缩放因子
```

## 参考

[VueUse 文档](https://vueuse.org/core/useZoomFactor/)
