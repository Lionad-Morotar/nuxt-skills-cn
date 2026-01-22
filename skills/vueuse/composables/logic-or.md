# logicOr

引用条件。

**包：** `@vueuse/math`  
**分类：** '@Math'

## 用法

```ts
import { whenever } from '@vueuse/core'
import { logicOr } from '@vueuse/math'

const a = ref(true)
const b = ref(false)

whenever(logicOr(a, b), () => {
  console.log('either a or b is truthy!')
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/logicOr/)
