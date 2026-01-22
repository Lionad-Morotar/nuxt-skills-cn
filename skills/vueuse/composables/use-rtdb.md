# useRTDB

响应式 Firebase 实时数据库绑定。使本地数据与远程数据库保持同步变得简单明了。

**包：** `@vueuse/firebase`  
**分类：** '@Firebase'

## 用法

```ts
import { useRTDB } from '@vueuse/firebase/useRTDB'
import { initializeApp } from 'firebase/app'
import { getDatabase } from 'firebase/database'

const app = initializeApp({ /* config */ })
const db = getDatabase(app)

// 在 setup() 中
const todos = useRTDB(db.ref('todos'))
```

## 参考

[VueUse 文档](https://vueuse.org/core/useRTDB/)
