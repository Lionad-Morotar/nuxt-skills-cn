# useMediaQuery

响应式媒体查询。创建 MediaQueryList 对象后，您可以检查查询结果，或在查询结果发生变化时接收通知。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { useMediaQuery } from '@vueuse/core'

const isLargeScreen = useMediaQuery('(min-width: 1024px)')
const isPreferredDark = useMediaQuery('(prefers-color-scheme: dark)')
```

## 参考

[VueUse 文档](https://vueuse.org/core/useMediaQuery/)
