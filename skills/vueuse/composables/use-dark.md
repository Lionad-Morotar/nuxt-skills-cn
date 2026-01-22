# useDark

带有自动数据持久化的响应式深色模式。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useDark, useToggle } from '@vueuse/core'

const isDark = useDark()
const toggleDark = useToggle(isDark)
```

## 选项

| 选项       | 类型                                                                                                          | 默认值    | 描述                                                   |
| ---------- | ------------------------------------------------------------------------------------------------------------- | --------- | ------------------------------------------------------ |
| valueDark  | `string`                                                                                                      | dark      | 当 isDark 为 true 时应用于目标元素的值                 |
| valueLight | `string`                                                                                                      | -         | 当 isDark 为 false 时应用于目标元素的值                |
| onChanged  | `(isDark: boolean, defaultHandler: ((mode: BasicColorSchema) =&gt; void), mode: BasicColorSchema) =&gt; void` | undefined | 自定义处理更新的处理器                                 |

## 参考

[VueUse 文档](https://vueuse.org/core/useDark/)
