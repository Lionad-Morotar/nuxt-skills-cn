# useMagicKeys

响应式按键按下状态，支持魔法键组合。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
import { useMagicKeys } from '@vueuse/core'

const { shift, space, a /* 要监控的按键 */ } = useMagicKeys()

watch(space, (v) => {
  if (v)
    console.log('space 已被按下')
})

watchEffect(() => {
  if (shift.value && a.value)
    console.log('Shift + A 已被按下')
})
```

## 选项

| 选项     | 类型                                  | 默认值  | 描述                                                   |
| -------- | ------------------------------------- | ------- | ------------------------------------------------------ |
| reactive | `Reactive`                            | false   | 返回一个响应式对象，而非引用对象                       |
| target   | `MaybeRefOrGetter&lt;EventTarget&gt;` | window  | 监听事件的目标                                         |

## 参考

[VueUse 文档](https://vueuse.org/core/useMagicKeys/)
