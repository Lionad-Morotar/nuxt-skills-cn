# useCssVar

操作 CSS 变量

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useCssVar } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const color1 = useCssVar('--color', el)

const elv = useTemplateRef('elv')
const key = ref('--color')
const colorVal = useCssVar(key, elv)

const someEl = useTemplateRef('someEl')
const color2 = useCssVar('--color', someEl, { initialValue: '#eee' })
```

## 选项

| 选项    | 类型      | 默认值  | 描述                                         |
| ------- | --------- | ------- | -------------------------------------------- |
| observe | `boolean` | false   | 使用 MutationObserver 监控变量变化           |

## 参考

[VueUse 文档](https://vueuse.org/core/useCssVar/)
