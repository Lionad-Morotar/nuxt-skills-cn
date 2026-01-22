# useSSRWidth

用于设置全局视口宽度，该宽度将在渲染依赖于视口宽度的 SSR 组件（如 or）时使用。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { provideSSRWidth } from '@vueuse/core'

const app = CreateApp(App)

provideSSRWidth(500, app)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useSSRWidth/)
