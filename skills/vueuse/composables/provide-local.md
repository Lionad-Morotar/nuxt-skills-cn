# provideLocal

扩展功能，允许调用以在同一组件中获取值。

**包：** `@vueuse/shared`  
**类别：** 状态

## 用法

```ts
<script setup>
import { injectLocal, provideLocal } from '@vueuse/core'

provideLocal('MyInjectionKey', 1)
const injectedValue = injectLocal('MyInjectionKey') // injectedValue === 1
</script>
```

## 参考

[VueUse 文档](https://vueuse.org/core/provideLocal/)
