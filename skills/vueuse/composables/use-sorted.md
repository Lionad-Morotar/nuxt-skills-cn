# useSorted

响应式排序数组

**包：** `@vueuse/core`
**分类：** 数组

## 用法

```ts
import { useSorted } from '@vueuse/core'

// 通用排序
const source = [10, 3, 5, 7, 2, 1, 8, 6, 9, 4]
const sorted = useSorted(source)
console.log(sorted.value) // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(source) // [10, 3, 5, 7, 2, 1, 8, 6, 9, 4]

// 对象排序
const objArr = [{
  name: 'John',
  age: 40,
}, {
  name: 'Jane',
  age: 20,
}, {
  name: 'Joe',
  age: 30,
}, {
  name: 'Jenny',
  age: 22,
}]
const objSorted = useSorted(objArr, (a, b) => a.age - b.age)
```

## 选项

| 选项      | 类型                          | 默认值  | 描述                             |
| --------- | ----------------------------- | ------- | -------------------------------- |
| sortFn    | `UseSortedFn<T>`              | -       | 排序算法                         |
| compareFn | `UseSortedCompareFn<T>`       | -       | 比较函数                         |
| dirty     | `boolean`                     | false   | 修改源数组的值                   |

## 参考

[VueUse 文档](https://vueuse.org/core/useSorted/)
