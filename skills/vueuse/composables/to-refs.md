# toRefs

扩展功能，也可接受对象的引用。

**包：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { toRefs } from '@vueuse/core'
import { reactive, ref } from 'vue'

const objRef = ref({ a: 'a', b: 0 })
const arrRef = ref(['a', 0])

const { a, b } = toRefs(objRef)
const [a, b] = toRefs(arrRef)

const obj = reactive({ a: 'a', b: 0 })
const arr = reactive(['a', 0])

const { a, b } = toRefs(obj)
const [a, b] = toRefs(arr)
```

## 选项

| 选项       | 类型                              | 默认值  | 描述                                                     |
| ---------- | --------------------------------- | ------- | -------------------------------------------------------- |
| replaceRef | `MaybeRefOrGetter<boolean>`       | true    | 在属性更新时，使用副本替换原始引用。                     |

## 参考

[VueUse 文档](https://vueuse.org/core/toRefs/)
