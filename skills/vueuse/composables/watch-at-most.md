# watchAtMost

触发次数限制。

**包：** `@vueuse/shared`  
**分类：** 监听

## 用法

```ts
import { watchAtMost } from '@vueuse/core'

watchAtMost(
  source,
  () => { console.log('trigger!') }, // 最多触发 3 次
  {
    count: 3, // 触发次数
  },
)
```

## 返回值

| 名称   | 类型  |
| ------ | ----- |
| count  | `Ref` |
| stop   | `Ref` |
| resume | `Ref` |
| pause  | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/watchAtMost/)
