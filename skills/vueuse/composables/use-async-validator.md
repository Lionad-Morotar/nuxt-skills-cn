# useAsyncValidator

用于异步验证的封装函数。

**包名：** `@vueuse/integrations`
**分类：** '@Integrations'

## 用法

```ts
import { useAsyncValidator } from '@vueuse/integrations/useAsyncValidator'
```

## 配置项

| 配置项         | 类型             | 默认值  | 描述                                                                |
| -------------- | ---------------- | ------- | ------------------------------------------------------------------- |
| validateOption | `ValidateOption` | -       | @see https://github.com/yiminghe/async-validator#options            |
| immediate      | `boolean`        | true    | 首次调用时将立即触发验证。                                          |
| manual         | `boolean`        | -       | 若设为 true，则不会自动触发验证。                                   |

## 参考资料

[VueUse 文档](https://vueuse.org/core/useAsyncValidator/)
