# useIpcRenderer

提供 ipcRenderer 及其所有 API。

**包：** `@vueuse/electron`  
**分类：** '@Electron'

## 用法

```ts
import { useIpcRenderer } from '@vueuse/electron'
import { computed } from 'vue'

// 如果你不显式提供 ipcRenderer，则启用 nodeIntegration
// 请参见：https://www.electronjs.org/docs/api/webview-tag#nodeintegration
const ipcRenderer = useIpcRenderer()

// Ref 结果将被返回
const result = ipcRenderer.invoke<string>('custom-channel', 'some data')
const msg = computed(() => result.value?.msg)

// 在卸载时自动移除监听器
ipcRenderer.on('custom-event', (event, ...args) => {
  console.log(args)
})
```

## 返回值

| 名称               | 类型  |
| ------------------ | ----- |
| on                 | `Ref` |
| listener           | `Ref` |
| once               | `Ref` |
| removeListener     | `Ref` |
| removeAllListeners | `Ref` |
| send               | `Ref` |
| invoke             | `Ref` |
| channel            | `Ref` |
| sendSync           | `Ref` |
| postMessage        | `Ref` |
| sendTo             | `Ref` |
| sendToHost         | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/useIpcRenderer/)
