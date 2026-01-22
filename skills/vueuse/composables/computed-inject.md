# computedInject

组合计算属性与注入

**包：** `@vueuse/core`
**分类：** 组件

## 用法

```ts
// @filename: provider.ts
// @include: main
// ---cut---
import { computedInject } from '@vueuse/core'

import { ArrayKey } from './provider'

const computedArray = computedInject(ArrayKey, (source) => {
  const arr = [...source.value]
  arr.unshift({ key: 0, value: 'all' })
  return arr
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/computedInject/)
