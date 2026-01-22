# useFirestore

响应式 Firestore 绑定。使本地数据与远程数据库始终保持同步变得简单明了。

**包：** `@vueuse/firebase`  
**分类：** '@Firebase'

## 用法

```ts
import { useFirestore } from '@vueuse/firebase/useFirestore'
import { collection } from 'firebase/firestore'
// ---cut---
const todos = useFirestore(collection(db, 'todos'), undefined, { autoDispose: false })
```

## 参考

[VueUse 文档](https://vueuse.org/core/useFirestore/)
