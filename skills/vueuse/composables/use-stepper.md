# useStepper

提供用于构建多步骤向导界面的辅助工具。

**包：** `@vueuse/core`
**类别：** 工具

## 用法

```ts
import { useStepper } from '@vueuse/core'

const {
  steps,
  stepNames,
  index,
  current,
  next,
  previous,
  isFirst,
  isLast,
  goTo,
  goToNext,
  goToPrevious,
  goBackTo,
  isNext,
  isPrevious,
  isCurrent,
  isBefore,
  isAfter,
} = useStepper([
  'billing-address',
  'terms',
  'payment',
])

// 通过 `current` 访问步骤
console.log(current.value) // 'billing-address'
```

## 返回值

| 名称           | 类型                    |
| -------------- | ----------------------- |
| steps          | `Ref`                   |
| stepNames      | `computed<any[]>`       |
| index          | `deepRef`               |
| current        | `computed`              |
| next           | `computed`              |
| previous       | `computed`              |
| isFirst        | `computed`              |
| isLast         | `computed`              |
| at             | `Ref`                   |
| get            | `Ref`                   |
| goTo           | `Ref`                   |
| goToNext       | `Ref`                   |
| goToPrevious   | `Ref`                   |
| goBackTo       | `Ref`                   |
| isNext         | `Ref`                   |
| isPrevious     | `Ref`                   |
| isCurrent      | `Ref`                   |
| isBefore       | `Ref`                   |
| isAfter        | `Ref`                   |

## 参考

[VueUse 文档](https://vueuse.org/core/useStepper/)
