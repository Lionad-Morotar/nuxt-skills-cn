# useVModel

v-model 绑定的简写形式，props + emit -> ref

**包：** `@vueuse/core`
**分类：** 组件

## 用法

```ts
import { useVModel } from '@vueuse/core'

const props = defineProps<{
  modelValue: string
}>()
const emit = defineEmits(['update:modelValue'])

const data = useVModel(props, 'modelValue', emit)
```

## 选项

| 选项         | 类型                          | 默认值    | 描述                                                                             |
| ------------ | ----------------------------- | --------- | -------------------------------------------------------------------------------- |
| passive      | `Passive`                     | false     | 当 passive 设置为 `true` 时，将使用 `watch` 来同步 props 和 ref。                |
| eventName    | `string`                      | undefined | 当设置了 eventName 时，其值将用于覆盖 emit 事件名称。                            |
| deep         | `boolean`                     | false     | 尝试检测嵌套对象或数组中属性的变化。                                             |
| defaultValue | `T`                           | undefined | 当未传递值时，为返回的 ref 定义默认值。                                          |
| clone        | `boolean \| CloneFn&lt;T&gt;` | false     | 克隆 props。                                                                     |
| shouldEmit   | `(v: T) =&gt; boolean`        | undefined | 在触发 emit 事件之前调用的钩子，可用于表单验证。                                 |

## 参考

[VueUse 文档](https://vueuse.org/core/useVModel/)
