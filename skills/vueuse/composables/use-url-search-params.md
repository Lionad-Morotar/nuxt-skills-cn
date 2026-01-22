# useUrlSearchParams

响应式 URL 查询参数

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useUrlSearchParams } from '@vueuse/core'

const params = useUrlSearchParams('history')

console.log(params.foo) // 'bar'

params.foo = 'bar'
params.vueuse = 'awesome'
// URL 更新为 `?foo=bar&vueuse=awesome`
```

## 选项

| 选项                  | 类型      | 默认值  | 描述           |
| --------------------- | --------- | ------- | -------------- |
| removeNullishValues   | `boolean` | true    | @default true  |
| removeFalsyValues     | `boolean` | false   | @default false |

## 参考

[VueUse 文档](https://vueuse.org/core/useUrlSearchParams/)
