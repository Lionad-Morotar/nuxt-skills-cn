# watchPausable

可暂停的监听器

**包：** `@vueuse/shared`  
**分类：** 监听

## 用法

```ts
import { watchPausable } from '@vueuse/core'
import { nextTick, shallowRef } from 'vue'

const source = shallowRef('foo')

const { stop, pause, resume } = watchPausable(
  source,
  v => console.log(`Changed to ${v}!`),
)

source.value = 'bar'
await nextTick() // Changed to bar!

pause()

source.value = 'foobar'
await nextTick() // (无任何反应)

resume()

source.value = 'hello'
await nextTick() // Changed to hello!
```

## 返回值

| 名称     | 类型              |
| -------- | ----------------- |
| stop     | `watchWithFilter` |
| pause    | `Ref`             |
| resume   | `Ref`             |
| isActive | `Ref`             |

## 参考

[VueUse 文档](https://vueuse.org/core/watchPausable/)
