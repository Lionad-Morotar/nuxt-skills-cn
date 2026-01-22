# useProjection

一种从一个域到另一个域的响应式数值投影。

**包：** `@vueuse/math`  
**分类：** '@Math'

## 用法

```ts
import { useProjection } from '@vueuse/math'

const input = ref(0)
const projected = useProjection(input, [0, 10], [0, 100])

input.value = 5 // projected.value === 50
input.value = 10 // projected.value === 100
```

## 参考

[VueUse 文档](https://vueuse.org/core/useProjection/)
