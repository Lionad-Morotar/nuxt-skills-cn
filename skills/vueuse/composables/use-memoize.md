# useMemoize

根据参数缓存函数的执行结果并保持响应性。它也可用于异步函数，并会复用现有的 Promise，以避免同时获取相同数据。

**包：** `@vueuse/core`  
**类别：** 工具

## 用法

```ts
import { useMemoize } from '@vueuse/core'

const getUser = useMemoize(
  async (userId: number): Promise<UserData> =>
    axios.get(`users/${userId}`).then(({ data }) => data),
)

const user1 = await getUser(1) // 请求 users/1
const user2 = await getUser(2) // 请求 users/2
// ...
const user1 = await getUser(1) // 从缓存中获取

// ...
const user1 = await getUser.load(1) // 请求 users/1

// ...
getUser.delete(1) // 删除用户 1 的缓存
getUser.clear() // 清空全部缓存
```

## 参考

[VueUse 文档](https://vueuse.org/core/useMemoize/)
