# createUnrefFn

创建一个普通函数，接受 ref 和原始值作为参数。返回与未转换函数相同的值，并具有正确的类型。

**包：** `@vueuse/core`  
**分类：** 工具函数

## 用法

```ts
import { createUnrefFn } from '@vueuse/core'
import { shallowRef } from 'vue'

const url = shallowRef('https://httpbin.org/post')
const data = shallowRef({ foo: 'bar' })

function post(url, data) {
  return fetch(url, { data })
}
const unrefPost = createUnrefFn(post)

post(url, data) /* ❌ 由于参数为 ref，将抛出错误 */
unrefPost(url, data) /* ✔️ 将正常工作，因为参数将被自动解引用 */
```

## 参考

[VueUse 文档](https://vueuse.org/core/createUnrefFn/)
