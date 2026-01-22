# useTimeAgoIntl

支持国际化（i18n）的响应式时间戳显示组件。当时间发生变化时，自动更新时间戳字符串。基于 [VueUse](https://vueuse.org/core/useTimeAgoIntl/) 构建。

**包名：** `@vueuse/core`  
**分类：** 时间处理

## 用法

```ts
import { useTimeAgoIntl } from '@vueuse/core'

const timeAgoIntl = useTimeAgoIntl(new Date(2021, 0, 1))
```

## 配置项

| 配置项         | 类型       | 默认值  | 描述                                                         |
| -------------- | ---------- | ------- | ------------------------------------------------------------ |
| controls       | `Controls` | false   | 提供更多控制选项及原始 `parts` 结果。                        |
| updateInterval | `number`   | 30_000  | 更新间隔（毫秒），设为 0 可禁用自动更新                      |

## 返回值

| 名称           | 类型       |
| -------------- | ---------- |
| resolvedLocale | `Ref`      |
| parts          | `computed` |

## 参考资料

[VueUse 文档](https://vueuse.org/core/useTimeAgoIntl/)
