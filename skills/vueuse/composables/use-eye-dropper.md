# useEyeDropper

响应式 EyeDropper API

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useEyeDropper } from '@vueuse/core'

const { isSupported, open, sRGBHex } = useEyeDropper()
```

## 选项

| 选项         | 类型     | 默认值  | 描述             |
| ------------ | -------- | ------- | ---------------- |
| initialValue | `string` | -       | 初始 sRGBHex。   |

## 返回值

| 名称          | 类型           |
| ------------- | -------------- |
| isSupported   | `useSupported` |
| sRGBHex       | `shallowRef`   |
| open          | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useEyeDropper/)
