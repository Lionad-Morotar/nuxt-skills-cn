# usePrecision

反应式地设置数字的精度。

**包：** `@vueuse/math`  
**分类：** '@Math'

## 用法

```ts
import { usePrecision } from '@vueuse/math'

const value = ref(3.1415)
const result = usePrecision(value, 2) // 3.14

const ceilResult = usePrecision(value, 2, {
  math: 'ceil'
}) // 3.15

const floorResult = usePrecision(value, 3, {
  math: 'floor'
}) // 3.141
```

## 选项

| 选项   | 类型                           | 默认值  | 描述                     |
| ------ | ------------------------------ | ------- | ------------------------ |
| math   | `'floor' \| 'ceil' \| 'round'` | round   | 用于四舍五入的方法       |

## 参考

[VueUse 文档](https://vueuse.org/core/usePrecision/)
