# useOffsetPagination

响应式偏移分页。

**包：** `@vueuse/core`
**分类：** 工具函数

## 用法

```ts
import { useOffsetPagination } from '@vueuse/core'

function fetchData({ currentPage, currentPageSize }: { currentPage: number, currentPageSize: number }) {
  fetch(currentPage, currentPageSize).then((responseData) => {
    data.value = responseData
  })
}

const {
  currentPage,
  currentPageSize,
  pageCount,
  isFirstPage,
  isLastPage,
  prev,
  next,
} = useOffsetPagination({
  total: database.value.length,
  page: 1,
  pageSize: 10,
  onPageChange: fetchData,
  onPageSizeChange: fetchData,
})
```

## 选项

| 选项              | 类型                                                                             | 默认值  | 描述                                     |
| ----------------- | -------------------------------------------------------------------------------- | ------- | ---------------------------------------- |
| total             | `MaybeRefOrGetter&lt;number&gt;`                                                 | -       | 项目总数。                               |
| pageSize          | `MaybeRefOrGetter&lt;number&gt;`                                                 | 10      | 每页显示的项目数量。                     |
| page              | `MaybeRef&lt;number&gt;`                                                         | 1       | 当前页码。                               |
| onPageChange      | `(returnValue: UnwrapNestedRefs&lt;UseOffsetPaginationReturn&gt;) =&gt; unknown` | -       | 当 `page` 变化时的回调函数。             |
| onPageSizeChange  | `(returnValue: UnwrapNestedRefs&lt;UseOffsetPaginationReturn&gt;) =&gt; unknown` | -       | 当 `pageSize` 变化时的回调函数。         |
| onPageCountChange | `(returnValue: UnwrapNestedRefs&lt;UseOffsetPaginationReturn&gt;) =&gt; unknown` | -       | 当 `pageCount` 变化时的回调函数。        |

## 参考

[VueUse 文档](https://vueuse.org/core/useOffsetPagination/)
