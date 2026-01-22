# useColorMode

响应式颜色模式（深色/浅色/自定义），支持自动数据持久化。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { useColorMode } from '@vueuse/core'

const mode = useColorMode() // Ref<'dark' | 'light'>
```

## 选项

| 选项              | 类型                                                                                               | 默认值              | 描述                                                      |
| ----------------- | -------------------------------------------------------------------------------------------------- | ------------------- | --------------------------------------------------------- |
| selector          | `string \| MaybeElementRef`                                                                        | html                | 应用于目标元素的 CSS 选择器                               |
| attribute         | `string`                                                                                           | class               | 目标元素应用的 HTML 属性                                  |
| initialValue      | `MaybeRefOrGetter<T \| BasicColorSchema>`                                                          | auto                | 初始颜色模式                                              |
| modes             | `Partial<Record<T \| BasicColorSchema, string>>`                                                   | -                   | 向属性添加值时使用的前缀                                  |
| onChanged         | `(mode: T \| BasicColorMode, defaultHandler: ((mode: T \| BasicColorMode) => void)) => void`       | undefined           | 自定义处理程序，用于处理更新                              |
| storageRef        | `Ref<T \| BasicColorSchema>`                                                                       | -                   | 自定义存储引用                                            |
| storageKey        | `string \| null`                                                                                   | vueuse-color-scheme | 持久化数据到 localStorage/sessionStorage 的键             |
| storage           | `StorageLike`                                                                                      | localStorage        | 存储对象，可以是 localStorage 或 sessionStorage           |
| emitAuto          | `boolean`                                                                                          | undefined           | 从状态中发出 `auto` 模式                                  |
| disableTransition | `boolean`                                                                                          | true                | 切换时禁用过渡效果                                        |

## 参考

[VueUse 文档](https://vueuse.org/core/useColorMode/)
