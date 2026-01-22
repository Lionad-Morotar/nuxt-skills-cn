# computedWithControl

显式定义 computed 的依赖项。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
// @include: main
// ---cut---
console.log(computedRef.value) // 0

counter.value += 1

console.log(computedRef.value) // 0

source.value = 'bar'

console.log(computedRef.value) // 1
```

## 参考

[VueUse 文档](https://vueuse.org/core/computedWithControl/)
