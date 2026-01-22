# whenever

用于监听值变为真值的简写形式。

**包：** `@vueuse/shared`  
**分类：** 监听

## 用法

```ts
import { useAsyncState, whenever } from '@vueuse/core'

const { state, isReady } = useAsyncState(
  fetch('https://jsonplaceholder.typicode.com/todos/1').then(t => t.json()),
  {},
)

whenever(isReady, () => console.log(state))
```

## 选项

| 选项 | 类型      | 默认值 | 描述                                   |
| ---- | --------- | ------ | -------------------------------------- |
| once | `boolean` | false  | 条件满足时仅触发一次                   |

## 参考

[VueUse 文档](https://vueuse.org/core/whenever/)
