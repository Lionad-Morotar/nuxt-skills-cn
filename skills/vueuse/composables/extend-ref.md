# extendRef

为 Ref 添加额外属性。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { extendRef } from '@vueuse/core'
import { shallowRef } from 'vue'

const myRef = shallowRef('content')

const extended = extendRef(myRef, { foo: 'extra data' })

extended.value === 'content'
extended.foo === 'extra data'
```

## 选项

| 选项       | 类型      | 默认值  | 描述                               |
| ---------- | --------- | ------- | ---------------------------------- |
| enumerable | `boolean` | false   | 扩展属性是否可枚举                 |
| unwrap     | `Unwrap`  | true    | Ref 属性的解包方式                 |

## 参考

[VueUse 文档](https://vueuse.org/core/extendRef/)
