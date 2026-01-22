# useStyleTag

在 head 中注入响应式元素。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
import { useStyleTag } from '@vueuse/core'

const {
  id,
  css,
  load,
  unload,
  isLoaded,
} = useStyleTag('.foo { margin-top: 32px; }')

// 后续可修改样式
css.value = '.foo { margin-top: 64px; }'
```

## 选项

| 选项      | 类型      | 默认值           | 描述                                               |
| --------- | --------- | ---------------- | -------------------------------------------------- |
| media     | `string`  | -                | 应用样式的媒体查询                                 |
| immediate | `boolean` | true             | 立即加载样式                                       |
| manual    | `boolean` | false            | 手动控制加载和卸载的时机                           |
| id        | `string`  | 自增编号         | style 标签的 DOM ID                                |
| nonce     | `string`  | undefined        | CSP（内容安全策略）的 nonce 值                     |

## 返回值

| 名称     | 类型         |
| -------- | ------------ |
| id       | `Ref`        |
| css      | `Ref`        |
| unload   | `Ref`        |
| load     | `Ref`        |
| isLoaded | `shallowRef` |

## 参考

[VueUse 文档](https://vueuse.org/core/useStyleTag/)
