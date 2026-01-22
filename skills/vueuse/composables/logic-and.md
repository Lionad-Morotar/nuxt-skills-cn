# logicAnd

引用条件。

**包：** `@vueuse/math`  
**类别：** '@Math'

## 用法

```ts
import { whenever } from '@vueuse/core'
import { logicAnd } from '@vueuse/math'

const a = ref(true)
const b = ref(false)

whenever(logicAnd(a, b), () => {
  console.log('both a and b are now truthy!')
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/logicAnd/)
