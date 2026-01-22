# watchOnce

用于监听值变化的简写形式。一旦回调函数触发一次，监听器将被停止。详情请参见 Vue 文档。

**包**：`@vueuse/shared`  
**类别**：监听

## 用法

```ts
import { watchOnce } from '@vueuse/core'

watchOnce(source, () => {
  // 只会触发一次
  console.log('source changed!')
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchOnce/)
