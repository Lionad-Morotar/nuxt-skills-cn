# useChangeCase

. 的响应式封装。

**包：** `@vueuse/integrations`
**类别：** '@Integrations'

## 用法

```ts
import { useChangeCase } from '@vueuse/integrations/useChangeCase'

// `changeCase` 将是一个计算属性
const changeCase = useChangeCase('hello world', 'camelCase')
changeCase.value // helloWorld
changeCase.value = 'vue use'
changeCase.value // vueUse
// 支持的方法
// export {
//   camelCase,
//   capitalCase,
//   constantCase,
//   dotCase,
//   headerCase,
//   noCase,
//   paramCase,
//   pascalCase,
//   pathCase,
//   sentenceCase,
//   snakeCase,
// } from 'change-case'
```

## 参考

[VueUse 文档](https://vueuse.org/core/useChangeCase/)
