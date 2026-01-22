# useVModels

props v-model 绑定的简写形式。可视为 `v-model` 的替代方式，但其变更也会触发 emit。

**包：** `@vueuse/core`  
**分类：** 组件

## 用法

```ts
import { useVModels } from '@vueuse/core'

const props = defineProps({
  foo: String,
  bar: Number,
})

const emit = defineEmits(['update:foo', 'update:bar'])

const { foo, bar } = useVModels(props, emit)
```

## 参考

[VueUse 文档](https://vueuse.org/core/useVModels/)
