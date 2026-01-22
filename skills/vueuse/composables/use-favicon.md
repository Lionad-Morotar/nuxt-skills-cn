# useFavicon

响应式网站图标

**包：** `@vueuse/core`
**分类：** 浏览器

## 用法

```ts
import { useFavicon } from '@vueuse/core'
// ---cut---
const source = shallowRef('icon.png')
const icon = useFavicon(source)

console.log(icon === source) // true
```

## 参考

[VueUse 文档](https://vueuse.org/core/useFavicon/)
