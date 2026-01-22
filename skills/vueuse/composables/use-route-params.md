# useRouteParams

响应式路由参数的简写形式。

**包：** `@vueuse/router`  
**类别：** '@Router'

## 用法

```ts
import { useRouteParams } from '@vueuse/router'

const userId = useRouteParams('userId')

const userId = useRouteParams('userId', '-1') // 或带有默认值

const userId = useRouteParams('page', '1', { transform: Number }) // 或转换值

console.log(userId.value) // route.params.userId
userId.value = '100' // router.replace({ params: { userId: '100' } })
```

## 参考

[VueUse 文档](https://vueuse.org/core/useRouteParams/)
