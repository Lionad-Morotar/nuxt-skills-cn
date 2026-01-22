# useMath

响应式方法。

**包：** `@vueuse/math`
**分类：** '@Math'

## 用法

```ts
import { useMath } from '@vueuse/math'

const base = ref(2)
const exponent = ref(3)
const result = useMath('pow', base, exponent) // Ref<8>

const num = ref(2)
const root = useMath('sqrt', num) // Ref<1.4142135623730951>

num.value = 4
console.log(root.value) // 2
```

## 参考

[VueUse 文档](https://vueuse.org/core/useMath/)
