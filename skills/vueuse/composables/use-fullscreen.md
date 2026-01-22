# useFullscreen

响应式全屏 API。它添加了方法以将特定元素（及其后代）呈现为全屏模式，并在不再需要时退出全屏模式。这使得可以使用用户的整个屏幕呈现所需内容——例如在线游戏——从屏幕上移除所有浏览器用户界面元素和其他应用程序，直到全屏模式关闭。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
import { useFullscreen } from '@vueuse/core'

const { isFullscreen, enter, exit, toggle } = useFullscreen()
```

## 选项

| 选项       | 类型      | 默认值  | 描述                                               |
| ---------- | --------- | ------- | -------------------------------------------------- |
| autoExit   | `boolean` | false   | 组件卸载时自动退出全屏模式                         |

## 返回值

| 名称         | 类型           |
| ------------ | -------------- |
| isSupported  | `useSupported` |
| isFullscreen | `shallowRef`   |
| enter        | `Ref`          |
| exit         | `Ref`          |
| toggle       | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useFullscreen/)
