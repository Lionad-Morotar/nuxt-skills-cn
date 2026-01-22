# useEventListener

轻松使用 EventListener。在组件挂载时通过 addEventListener 注册，并在组件卸载时自动调用 removeEventListener。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { useEventListener } from '@vueuse/core'

useEventListener(document, 'visibilitychange', (evt) => {
  console.log(evt)
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/useEventListener/)
