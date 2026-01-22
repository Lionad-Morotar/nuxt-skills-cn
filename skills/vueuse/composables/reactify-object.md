# reactifyObject

应用于对象

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { reactifyObject } from '@vueuse/core'

const reactifiedConsole = reactifyObject(console)

const a = ref('42')

reactifiedConsole.log(a) // 无需再使用 `.value`
```

## 选项

| 选项                   | 类型      | 默认值  | 描述                                       |
| ---------------------- | --------- | ------- | ------------------------------------------ |
| includeOwnProperties   | `boolean` | true    | 包含来自 Object.getOwnPropertyNames 的名称 |

## 参考

[VueUse 文档](https://vueuse.org/core/reactifyObject/)
