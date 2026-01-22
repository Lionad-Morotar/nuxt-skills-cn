# logicNot

ref 的条件

**包：** `@vueuse/math`  
**类别：** '@Math'

## 用法

```ts
import { whenever } from '@vueuse/core'
import { logicNot } from '@vueuse/math'

const a = ref(true)

whenever(logicNot(a), () => {
  console.log('a 现在为假值！')
})
```

## 参考

[VueUse 文档](https://vueuse.org/core/logicNot/)
