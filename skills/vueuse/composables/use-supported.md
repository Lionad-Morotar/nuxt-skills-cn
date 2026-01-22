# useSupported

SSR 兼容性

**包：** `@vueuse/core`
**分类：** 工具函数

## 用法

```ts
import { useSupported } from '@vueuse/core'

const isSupported = useSupported(() => navigator && 'getBattery' in navigator)

if (isSupported.value) {
  // 执行某些操作
  navigator.getBattery
}
```

## 参考

[VueUse 文档](https://vueuse.org/core/useSupported/)
