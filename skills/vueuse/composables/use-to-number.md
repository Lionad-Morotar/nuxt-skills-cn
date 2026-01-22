# useToNumber

响应式地将字符串引用转换为数字。

**包：** `@vueuse/shared`  
**类别：** 工具函数

## 用法

```ts
import { useToNumber } from '@vueuse/core'
import { shallowRef } from 'vue'

const str = shallowRef('123')
const number = useToNumber(str)

number.value // 123
```

## 选项

| 选项      | 类型                                                                     | 默认值     | 描述                                                           |
| --------- | ------------------------------------------------------------------------ | ---------- | -------------------------------------------------------------- |
| method    | `'parseFloat' \| 'parseInt' \| ((value: string \| number) =&gt; number)` | parseFloat | 用于将值转换为数字的方法。                                     |
| radix     | `number`                                                                 | -          | 传递给 `parseInt` 的数学数字系统中的基数。                     |
| nanToZero | `boolean`                                                                | false      | 将 NaN 替换为零                                                |

## 参考

[VueUse 文档](https://vueuse.org/core/useToNumber/)
