# reactify

将普通函数转换为响应式函数。转换后的函数接受 refs 作为参数并返回一个 ComputedRef，具备正确的类型标注。

**包名：** `@vueuse/shared`  
**分类：** 响应式

## 用法

```ts
import { reactify } from '@vueuse/core'
import { shallowRef } from 'vue'

// 一个普通函数
function add(a: number, b: number): number {
  return a + b
}

// 现在它接受 refs 并返回一个计算型 ref
// (a: number | Ref<number>, b: number | Ref<number>) => ComputedRef<number>
const reactiveAdd = reactify(add)

const a = shallowRef(1)
const b = shallowRef(2)
const sum = reactiveAdd(a, b)

console.log(sum.value) // 3

a.value = 5

console.log(sum.value) // 7
```

## 选项

| 选项           | 类型 | 默认值  | 描述                                       |
| -------------- | ---- | ------- | ------------------------------------------ |
| computedGetter | `T`  | true    | 支持传递一个函数作为响应式 getter         |

## 参考

[VueUse 文档](https://vueuse.org/core/reactify/)
