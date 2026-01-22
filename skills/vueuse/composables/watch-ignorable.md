# watchIgnorable

可忽略的监听器

**包名:** `@vueuse/shared`  
**分类:** 监听

## 用法

```ts
import { watchIgnorable } from '@vueuse/core'
import { nextTick, shallowRef } from 'vue'

const source = shallowRef('foo')

const { stop, ignoreUpdates } = watchIgnorable(
  source,
  v => console.log(`Changed to ${v}!`),
)

source.value = 'bar'
await nextTick() // 输出: Changed to bar!

ignoreUpdates(() => {
  source.value = 'foobar'
})
await nextTick() // (无输出)

source.value = 'hello'
await nextTick() // 输出: Changed to hello!

ignoreUpdates(() => {
  source.value = 'ignored'
})
source.value = 'logged'

await nextTick() // 输出: Changed to logged!
```

## 返回值

| 名称                   | 类型  |
| ---------------------- | ----- |
| stop                   | `Ref` |
| ignoreUpdates          | `Ref` |
| ignorePrevAsyncUpdates | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/watchIgnorable/)
