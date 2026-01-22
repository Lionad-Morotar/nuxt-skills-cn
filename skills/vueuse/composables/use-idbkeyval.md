# useIDBKeyval

`.`
**包：** `@vueuse/integrations`  
**分类：** '@Integrations'

## 用法

```ts
import { useIDBKeyval } from '@vueuse/integrations/useIDBKeyval'

// 绑定对象
const { data: storedObject, isFinished } = useIDBKeyval('my-idb-keyval-store', { hello: 'hi', greeting: 'Hello' })

// 更新对象
storedObject.value.hello = 'hola'

// 绑定布尔值
const flag = useIDBKeyval('my-flag', true) // 返回 Ref<boolean>

// 绑定数字
const count = useIDBKeyval('my-count', 0) // 返回 Ref<number>

// 等待 IDB 事务完成
await count.set(10)
console.log('IDB 事务已完成!')

// 从 IDB 存储中删除数据
storedObject.value = null
```

## 返回值

| 名称       | 类型         |
| ---------- | ------------ |
| set        | `Ref`        |
| isFinished | `shallowRef` |
| data       | `Ref`        |

## 参考

[VueUse 文档](https://vueuse.org/core/useIDBKeyval/)
