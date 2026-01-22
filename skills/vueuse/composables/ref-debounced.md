# refDebounced

防抖 ref 值的执行。

**包：** `@vueuse/shared`  
**类别：** 响应式

## 用法

```ts
import { refDebounced } from '@vueuse/core'
import { shallowRef } from 'vue'

const data = shallowRef({
  name: 'foo',
  age: 18,
})
const debounced = refDebounced(data, 1000)

function update() {
  data.value = {
    ...data.value,
    name: 'bar',
  }
}

console.log(debounced.value) // { name: 'foo', age: 18 }
update()
await sleep(1100)

console.log(debounced.value) // { name: 'bar', age: 18 }
```

## 参考

[VueUse 文档](https://vueuse.org/core/refDebounced/)
