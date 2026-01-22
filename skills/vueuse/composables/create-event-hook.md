# createEventHook

用于创建事件钩子的工具函数

**包:** `@vueuse/shared`  
**分类:** 工具函数

## 用法

```ts
import { createEventHook } from '@vueuse/core'

export function useMyFetch(url) {
  const fetchResult = createEventHook<Response>()
  const fetchError = createEventHook<any>()

  fetch(url)
    .then(result => fetchResult.trigger(result))
    .catch(error => fetchError.trigger(error.message))

  return {
    onResult: fetchResult.on,
    onError: fetchError.on,
  }
}
```

## 返回值

| 名称    | 类型  |
| ------- | ----- |
| on      | `Ref` |
| off     | `Ref` |
| trigger | `Ref` |
| clear   | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/createEventHook/)
