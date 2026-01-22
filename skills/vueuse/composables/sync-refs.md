# syncRefs

保持目标引用与源引用同步

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { syncRefs } from '@vueuse/core'
import { shallowRef } from 'vue'

const source = shallowRef('hello')
const target = shallowRef('target')

const stop = syncRefs(source, target)

console.log(target.value) // hello

source.value = 'foo'

console.log(target.value) // foo
```

## 选项

| 选项      | 类型      | 默认值  | 描述                   |
| --------- | --------- | ------- | ---------------------- |
| deep      | `boolean` | false   | 深度监听               |
| immediate | `boolean` | true    | 立即同步值             |

## 参考

[VueUse 文档](https://vueuse.org/core/syncRefs/)
