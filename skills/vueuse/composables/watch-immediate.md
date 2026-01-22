# watchImmediate

`watchImmediate` 的简写形式，用于监听值的变化。

**包名：** `@vueuse/shared`  
**分类：** 监听器（Watch）

## 用法

```ts
import { watchImmediate } from '@vueuse/core'

const obj = ref('vue-use')

// 从外部存储/组合式函数中更改值
obj.value = 'VueUse'

watchImmediate(obj, (updated) => {
  console.log(updated) // 控制台将输出两次
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchImmediate/)
