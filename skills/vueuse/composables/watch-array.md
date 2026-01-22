# watchArray

监听一个数组的新增与删除操作。

**包：** `@vueuse/shared`  
**分类：** 监听器

## 用法

```ts
import { watchArray } from '@vueuse/core'

const list = ref([1, 2, 3])

watchArray(list, (newList, oldList, added, removed) => {
  console.log(newList) // [1, 2, 3, 4]
  console.log(oldList) // [1, 2, 3]
  console.log(added) // [4]
  console.log(removed) // []
})

onMounted(() => {
  list.value = [...list.value, 4]
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchArray/)
