# useTimeoutPoll

使用超时轮询某项内容。在最后一个任务完成后将触发回调。

**包：** `@vueuse/core`  
**分类：** 工具函数

## 用法

```ts
import { useTimeoutPoll } from '@vueuse/core'

const count = ref(0)

async function fetchData() {
  await new Promise(resolve => setTimeout(resolve, 1000))
  count.value++
}

// 仅在最后一次获取完成后触发
const { isActive, pause, resume } = useTimeoutPoll(fetchData, 1000)
```

## 选项

| 选项                | 类型      | 默认值   | 描述                                       |
| ------------------- | --------- | -------- | ------------------------------------------ |
| immediate           | `boolean` | true     | 立即启动计时器                             |
| immediateCallback   | `boolean` | false    | 在调用 `resume` 后立即执行回调             |

## 返回值

| 名称     | 类型         |
| -------- | ------------ |
| isActive | `shallowRef` |
| pause    | `Ref`        |
| resume   | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useTimeoutPoll/)
