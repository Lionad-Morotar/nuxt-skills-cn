# useRafFn

在每次 . 上调用函数。提供暂停和恢复控制。

**包：** `@vueuse/core`  
**类别：** 动画

## 用法

```ts
import { useRafFn } from '@vueuse/core'
import { shallowRef } from 'vue'

const count = shallowRef(0)

const { pause, resume } = useRafFn(() => {
  count.value++
  console.log(count.value)
})
```

## 选项

| 选项      | 类型                             | 默认值    | 描述                                                                                   |
| --------- | -------------------------------- | --------- | -------------------------------------------------------------------------------------- |
| immediate | `boolean`                        | true      | 创建时立即启动 requestAnimationFrame 循环                                              |
| fpsLimit  | `MaybeRefOrGetter&lt;number&gt;` | undefined | 函数执行的最大帧率。                                                                   |
| once      | `boolean`                        | false     | requestAnimationFrame 循环执行一次后将自动停止。                                       |

## 返回值

| 名称     | 类型         |
| -------- | ------------ |
| isActive | `shallowRef` |
| pause    | `Ref`        |
| resume   | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useRafFn/)
