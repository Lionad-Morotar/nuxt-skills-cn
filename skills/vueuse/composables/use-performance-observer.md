# usePerformanceObserver

观察性能指标。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
import { usePerformanceObserver } from '@vueuse/core'

const entrys = ref<PerformanceEntry[]>([])
usePerformanceObserver({
  entryTypes: ['paint'],
}, (list) => {
  entrys.value = list.getEntries()
})
```

## 返回值

| 名称        | 类型           |
| ----------- | -------------- |
| isSupported | `useSupported` |
| start       | `Ref`          |
| stop        | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/usePerformanceObserver/)
