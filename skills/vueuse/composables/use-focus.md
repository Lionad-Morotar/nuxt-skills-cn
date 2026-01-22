# useFocus

用于跟踪或设置 DOM 元素焦点状态的响应式工具。状态变更用于反映目标元素是否为当前获得焦点的元素。从外部设置响应式值将分别触发 `focus` 和 `blur` 事件。

**包：** `@vueuse/core`  
**分类：** 传感器

## 用法

```ts
import { useFocus } from '@vueuse/core'

const target = shallowRef()
const { focused } = useFocus(target)

watch(focused, (focused) => {
  if (focused)
    console.log('input element has been focused')
  else console.log('input element has lost focus')
})
```

## 选项

| 选项           | 类型      | 默认值  | 描述                                                             |
| -------------- | --------- | ------- | ---------------------------------------------------------------- |
| initialValue   | `boolean` | false   | 初始值。若设为 true，则会在目标元素上设置焦点                   |
| focusVisible   | `boolean` | false   | 复现 CSS 中的 `:focus-visible` 行为                             |
| preventScroll  | `boolean` | false   | 当元素获得焦点时，防止页面滚动至该元素                          |

## 返回值

| 名称    | 类型       |
| ------- | ---------- |
| focused | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useFocus/)
