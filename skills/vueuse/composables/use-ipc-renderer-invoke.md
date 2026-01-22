# useIpcRendererInvoke

响应式 ipcRenderer.invoke API 结果。使异步操作看起来像同步操作。

**包：** `@vueuse/electron`  
**类别：** '@Electron'

## 用法

```ts
import { useIpcRendererInvoke } from '@vueuse/electron'
import { computed } from 'vue'

// 如果你不显式提供 ipcRenderer，请启用 nodeIntegration
// 请参阅：https://www.electronjs.org/docs/api/webview-tag#nodeintegration
// Ref 结果将返回
const result = useIpcRendererInvoke<string>('custom-channel', 'some data')
const msg = computed(() => result.value?.msg)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useIpcRendererInvoke/)
