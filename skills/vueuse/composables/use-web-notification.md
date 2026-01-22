# useWebNotification

响应式通知

**包：** `@vueuse/core`
**分类：** 浏览器

## 用法

```ts
import { useWebNotification } from '@vueuse/core'

const {
  isSupported,
  notification,
  permissionGranted,
  show,
  close,
  onClick,
  onShow,
  onError,
  onClose,
} = useWebNotification({
  title: '你好，VueUse 世界！',
  dir: 'auto',
  lang: 'en',
  renotify: true,
  tag: 'test',
})

if (isSupported.value && permissionGranted.value)
  show()
```

## 选项

| 选项               | 类型      | 默认值  | 描述                                                   |
| ------------------ | --------- | ------- | ------------------------------------------------------ |
| requestPermissions | `boolean` | true    | 如果未授予权限，则在 mounted 时请求权限。              |

## 返回值

| 名称              | 类型           |
| ----------------- | -------------- |
| isSupported       | `useSupported` |
| notification      | `Ref`          |
| ensurePermissions | `Ref`          |
| permissionGranted | `shallowRef`   |
| show              | `Ref`          |
| close             | `Ref`          |
| onClick           | `Ref`          |
| onShow            | `Ref`          |
| onError           | `Ref`          |
| onClose           | `Ref`          |

## 参考

[VueUse 文档](https://vueuse.org/core/useWebNotification/)
