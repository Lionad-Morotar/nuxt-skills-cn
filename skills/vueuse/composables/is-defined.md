# isDefined

用于 Ref 的非空检查类型保护。

**包：** `@vueuse/shared`  
**类别：** 工具函数

## 用法

```ts
import { isDefined } from '@vueuse/core'

const example = ref(Math.random() ? 'example' : undefined) // Ref<string | undefined>

if (isDefined(example))
  example // Ref<string>
```

## 参考

[VueUse 文档](https://vueuse.org/core/isDefined/)
