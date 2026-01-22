# watchTriggerable

可手动触发的监听器

**包：** `@vueuse/shared`  
**类别：** 监听

## 用法

```ts
import { watchTriggerable } from '@vueuse/core'
import { nextTick, shallowRef } from 'vue'

const source = shallowRef(0)

const { trigger, ignoreUpdates } = watchTriggerable(
  source,
  v => console.log(`Changed to ${v}!`),
)

source.value = 'bar'
await nextTick() // 输出：Changed to bar!

// 通过 `trigger` 执行 WatchCallback 无需等待
trigger() // 输出：Changed to bar!
```

## 返回值

| 名称      | 类型    |
| --------- | ------- |
| trigger   | `Ref`   |

## 参考

[VueUse 文档](https://vueuse.org/core/watchTriggerable/)
