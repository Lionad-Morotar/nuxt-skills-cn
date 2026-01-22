# useFetch

响应式 Fetch API 提供了中止请求、在请求发送前拦截请求、当 URL 变化时自动重新发起请求的能力，并且可以使用预设选项创建自定义的 Fetch 实例。

**包名：** `@vueuse/core`  
**类别：** 网络

## 用法

```ts
import { useFetch } from '@vueuse/core'

const { isFetching, error, data } = useFetch(url)
```

## 选项

| 选项              | 类型                                                                                                                                     | 默认值  | 描述                                                                                                      |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------- | --------------------------------------------------------------------------------------------------------- |
| fetch             | `typeof window.fetch`                                                                                                                    | -       | Fetch 函数                                                                                                |
| immediate         | `boolean`                                                                                                                                | true    | 当 `useFetch` 被使用时会自动运行 fetch                                                                    |
| refetch           | `MaybeRefOrGetter< boolean >`                                                                                                            | false   | 当以下情况发生时会自动重新发起请求：                                                                      |
| initialData       | `any`                                                                                                                                    | null    | 请求完成前的初始数据                                                                                      |
| timeout           | `number`                                                                                                                                 | 0       | 在指定毫秒数后中止请求                                                                                    |
| updateDataOnError | `boolean`                                                                                                                                | false   | 在 fetch 出错时允许更新 `data` 引用，无论是否提供，或在 `onFetchError` 回调中被修改                        |
| beforeFetch       | `(ctx: BeforeFetchContext) => Promise<Partial<BeforeFetchContext> \| void> \| Partial<BeforeFetchContext> \| void`                       | -       | 在 fetch 请求被发送前立即运行                                                                             |
| afterFetch        | `(ctx: AfterFetchContext) => Promise<Partial<AfterFetchContext>> \| Partial<AfterFetchContext>`                                          | -       | 在 fetch 请求返回后立即运行                                                                               |
| onFetchError      | `(ctx: OnFetchErrorContext) => Promise<Partial<OnFetchErrorContext>> \| Partial<OnFetchErrorContext>`                                  | -       | 在 fetch 请求返回后立即运行                                                                               |

## 参考

[VueUse 文档](https://vueuse.org/core/useFetch/)
