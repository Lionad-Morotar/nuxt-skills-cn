# useRouteQuery

响应式路由查询参数的简写形式。

**包：** `@vueuse/router`  
**分类：** '@Router'

## 用法

```ts
import { useRouteQuery } from '@vueuse/router'

const search = useRouteQuery('search')

const search = useRouteQuery('search', 'foo') // 或带有默认值

const page = useRouteQuery('page', '1', { transform: Number }) // 或转换值

console.log(search.value) // route.query.search
search.value = 'foobar' // router.replace({ query: { search: 'foobar' } })
```

## 参考

[VueUse 文档](https://vueuse.org/core/useRouteQuery/)
