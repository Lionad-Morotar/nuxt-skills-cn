# createProjection

一种从一个域到另一个域的响应式数值投影。

**包：** `@vueuse/math`  
**分类：** '@Math'

## 用法

```ts
import { createProjection } from '@vueuse/math'

const useProjector = createProjection([0, 10], [0, 100])
const input = ref(0)
const projected = useProjector(input) // projected.value === 0

input.value = 5 // projected.value === 50
input.value = 10 // projected.value === 100
```

## 参考

[VueUse 文档](https://vueuse.org/core/createProjection/)
