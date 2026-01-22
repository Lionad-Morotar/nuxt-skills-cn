# usePermission

响应式权限 API。权限 API 提供了工具，使开发者能够实现更佳的用户体验，特别是在权限管理方面。

**包：** `@vueuse/core`  
**类别：** 浏览器

## 用法

```ts
import { usePermission } from '@vueuse/core'

const microphoneAccess = usePermission('microphone')
```

## 选项

| 选项     | 类型       | 默认值  | 描述               |
| -------- | ---------- | ------- | ------------------ |
| controls | `Controls` | false   | 更多地暴露控制选项 |

## 返回值

| 名称        | 类型                                             |
| ----------- | ------------------------------------------------ |
| state       | `shallowRef<PermissionState \| undefined>`       |
| isSupported | `useSupported`                                   |
| query       | `createSingletonPromise`                         |

## 参考

[VueUse 文档](https://vueuse.org/core/usePermission/)
