# useFuse

通过 Fuse.js 轻松实现可组合的模糊搜索。

**包：** `@vueuse/integrations`  
**类别：** '@Integrations'

## 用法

```ts
import { useFuse } from '@vueuse/integrations/useFuse'
import { shallowRef } from 'vue'

const data = [
  'John Smith',
  'John Doe',
  'Jane Doe',
  'Phillip Green',
  'Peter Brown',
]

const input = shallowRef('Jhon D')

const { results } = useFuse(input, data)

/*
 * 结果：
 *
 * { "item": "John Doe", "index": 1 }
 * { "item": "John Smith", "index": 0 }
 * { "item": "Jane Doe", "index": 2 }
 *
 */
```

## 返回值

| 名称    | 类型      |
| ------- | --------- |
| fuse    | `deepRef` |
| results | `Ref`     |

## 参考

[VueUse 文档](https://vueuse.org/core/useFuse/)
