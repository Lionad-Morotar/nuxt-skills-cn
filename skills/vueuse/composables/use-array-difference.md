# useArrayDifference

响应式获取两个数组的差集。

**包：** `@vueuse/shared`  
**分类：** 数组

## 用法

```ts
import { useArrayDifference } from '@vueuse/core'

const list1 = ref([0, 1, 2, 3, 4, 5])
const list2 = ref([4, 5, 6])
const result = useArrayDifference(list1, list2)
// result.value: [0, 1, 2, 3]
list2.value = [0, 1, 2]
// result.value: [3, 4, 5]
```

## 选项

| 选项      | 类型      | 默认值  | 描述                         |
| --------- | --------- | ------- | ---------------------------- |
| symmetric | `boolean` | false   | 返回非对称差集               |

## 参考

[VueUse 文档](https://vueuse.org/core/useArrayDifference/)
