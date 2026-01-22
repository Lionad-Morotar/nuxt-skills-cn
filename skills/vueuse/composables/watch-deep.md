# watchDeep

`watchDeep` 的简写形式，用于监听值的变化。

**包：** `@vueuse/shared`  
**类别：** 监听（Watch）

## 用法

```ts
import { watchDeep } from '@vueuse/core'

const nestedObject = ref({ foo: { bar: { deep: 5 } } })

watchDeep(nestedObject, (updated) => {
  console.log(updated)
})

onMounted(() => {
  nestedObject.value.foo.bar.deep = 10
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/watchDeep/)
