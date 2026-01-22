# useTextDirection

元素文本的响应式方向。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useTextDirection } from '@vueuse/core'

const dir = useTextDirection() // Ref<'ltr' | 'rtl' | 'auto'>
```

## 选项

| 选项         | 类型                    | 默认值  | 描述                                                                     |
| ------------ | ----------------------- | ------- | ------------------------------------------------------------------------ |
| selector     | `string`                | html    | 应用于目标元素的 CSS 选择器                                              |
| observe      | `boolean`               | false   | 使用 MutationObserver 监听 `document.querySelector(selector)` 的变化      |
| initialValue | `UseTextDirectionValue` | ltr     | 初始值                                                                   |

## 参考

[VueUse 文档](https://vueuse.org/core/useTextDirection/)
