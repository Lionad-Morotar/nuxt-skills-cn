# refWithControl

对 ref 及其响应性的细粒度控制。

**包：** `@vueuse/shared`  
**类别：** 响应性

## 用法

```ts
import { refWithControl } from '@vueuse/core'

const num = refWithControl(0)
const doubled = computed(() => num.value * 2)

// 与普通 ref 一样使用
num.value = 42
console.log(num.value) // 42
console.log(doubled.value) // 84

// 设置值而不触发响应性
num.set(30, false)
console.log(num.value) // 30
console.log(doubled.value) // 84（未更新）

// 获取值而不追踪响应性
watchEffect(() => {
  console.log(num.peek())
}) // 30

num.value = 50 // 因为未收集任何内容，因此不会触发侦听器
console.log(doubled.value) // 100（由于是响应式设置，再次更新）
```

## 参考

[VueUse 文档](https://vueuse.org/core/refWithControl/)
