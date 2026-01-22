# useLastChanged

记录最后一次更改的时间戳

**包：** `@vueuse/shared`  
**分类：** 状态

## 用法

```ts
import { useLastChanged } from '@vueuse/core'
import { nextTick } from 'vue'

const a = ref(0)
const lastChanged = useLastChanged(a)

a.value = 1

await nextTick()

console.log(lastChanged.value) // 1704709379457
```

## 参考

[VueUse 文档](https://vueuse.org/core/useLastChanged/)
