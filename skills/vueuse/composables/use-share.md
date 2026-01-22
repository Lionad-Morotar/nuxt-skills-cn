# useShare

响应式 Web Share API。浏览器提供可分享文本或文件内容的功能。

**包：** `@vueuse/core`
**分类：** 浏览器

## 用法

```ts
import { useShare } from '@vueuse/core'

const { share, isSupported } = useShare()

function startShare() {
  share({
    title: 'Hello',
    text: 'Hello my friend!',
    url: location.href,
  })
}
```

## 返回值

| 名称        | 类型           |
| ----------- | -------------- |
| isSupported | `useSupported` |
| share       | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useShare/)
