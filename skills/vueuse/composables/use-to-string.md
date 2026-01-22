# useToString

将引用转换为字符串的响应式方法。

**包:** `@vueuse/shared`  
**类别:** 工具函数

## 用法

```ts
import { useToString } from '@vueuse/core'
import { shallowRef } from 'vue'

const number = shallowRef(3.14)
const str = useToString(number)

str.value // '3.14'
```

## 参考

[VueUse 文档](https://vueuse.org/core/useToString/)
