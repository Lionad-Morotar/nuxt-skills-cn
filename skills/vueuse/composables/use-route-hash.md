# useRouteHash

响应式路由哈希的简写。

**包：** `@vueuse/router`  
**分类：** '@Router'

## 用法

```ts
import { useRouteHash } from '@vueuse/router'

const search = useRouteHash()

console.log(search.value) // route.hash
search.value = 'foobar' // router.replace({ hash: 'foobar' })
```

## 参考

[VueUse 文档](https://vueuse.org/core/useRouteHash/)
