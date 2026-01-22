# useInterval

响应式计数器在每个间隔内递增

**包：** `@vueuse/shared`  
**类别：** 动画

## 用法

```ts
import { useInterval } from '@vueuse/core'

// count 将每 200ms 递增一次
const counter = useInterval(200)
```

## 选项

| 选项      | 类型                         | 默认值  | 描述                                  |
| --------- | ---------------------------- | ------- | ------------------------------------- |
| controls  | `Controls`                   | false   | 暴露更多控制项                        |
| immediate | `boolean`                    | true    | 调用时立即执行更新                    |
| callback  | `(count: number) =&gt; void` | -       | 每个间隔触发的回调函数                |

## 返回值

| 名称    | 类型         |
| ------- | ------------ |
| counter | `shallowRef` |
| reset   | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useInterval/)
