# useNavigatorLanguage

响应式 navigator.language。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
import { useNavigatorLanguage } from '@vueuse/core'

const { language } = useNavigatorLanguage()

watch(language, () => {
  // 监听值的变化
})
```

## 返回值

| 名称        | 类型                                    |
| ----------- | --------------------------------------- |
| isSupported | `useSupported`                          |
| language    | `shallowRef<string \| undefined>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useNavigatorLanguage/)
