# useClamp

在两个其他值之间动态限制一个值。

**包：** `@vueuse/math`  
**分类：** '@Math'

## 用法

```ts
import { useClamp } from '@vueuse/math'

const min = shallowRef(0)
const max = shallowRef(10)
const value = useClamp(0, min, max)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useClamp/)
