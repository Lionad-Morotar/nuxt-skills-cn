# useIpcRendererOn

轻松使用 ipcRenderer.on，并在组件卸载时自动移除 ipcRenderer.removeListener。

**包名：** `@vueuse/electron`  
**分类：** '@Electron'

## 用法

```ts
import { useIpcRendererOn } from '@vueuse/electron'

// 如果你不显式提供 ipcRenderer，请启用 nodeIntegration
// 参见：https://www.electronjs.org/docs/api/webview-tag#nodeintegration
// 在组件卸载时自动移除监听器
useIpcRendererOn('custom-event', (event, ...args) => {
  console.log(args)
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/useIpcRendererOn/)
