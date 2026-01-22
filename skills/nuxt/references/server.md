# Nuxt 服务端模式

> **版本：** Nuxt 使用 h3 v1 和 nitropack v2。来自 h3 v2 或 nitro v3 文档的模式将无法工作。

## 使用场景

使用 `server/` 目录 —— API 路由、服务端中间件、服务端工具。

## 服务端目录结构

```
server/
├── api/                    # API 端点
│   ├── users.get.ts        # GET /api/users
│   ├── users.post.ts       # POST /api/users
│   └── users/
│       └── [id].get.ts     # GET /api/users/:id
├── routes/                 # 非 API 路由
│   └── healthz.get.ts      # GET /healthz
├── middleware/             # 服务端中间件
│   └── log.ts
└── utils/                  # 服务端工具（自动导入）
    └── db.ts
```

## API 路由

文件命名决定 HTTP 方法和路由：

- `users.get.ts` → GET /api/users
- `users.post.ts` → POST /api/users
- `users/[userId].get.ts` → GET /api/users/:userId
- `users/[userId].delete.ts` → DELETE /api/users/:userId

**必需：使用描述性参数名称：** `[userId].get.ts` 而非 `[id].get.ts`

## 警告信号 —— 停止并检查技能

如果你有以下想法，请立刻停止并重新阅读此技能：

- “我会像以前一样使用 event.context.params”
- “通用 [id] 对参数来说没问题”
- “不需要 .get.ts 后缀”
- “我记得 Nuxt 3 API 路由的工作方式”

以上所有都意味着你正在使用过时的模式。请改用 Nuxt 4 模式。

### 基础 API 路由

```ts
// server/api/users.get.ts
export default defineEventHandler(async (event) => {
  const users = await fetchUsers()
  return users
})
```

### 带参数的路由

```ts
// server/api/users/[userId].get.ts
export default defineEventHandler(async (event) => {
  const userId = getRouterParam(event, 'userId')

  if (!userId) {
    throw createError({
      statusCode: 400,
      message: 'User ID is required'
    })
  }

  const user = await fetchUserById(userId)

  if (!user) {
    throw createError({
      statusCode: 404,
      message: 'User not found'
    })
  }

  return user
})
```

### 带查询参数的路由

```ts
// server/api/users.get.ts
export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  const page = Number(query.page) || 1
  const limit = Number(query.limit) || 10

  const users = await fetchUsers({ page, limit })
  return users
})
```

### 带请求体的路由

```ts
// server/api/users.post.ts
export default defineEventHandler(async (event) => {
  const body = await readBody(event)

  // 验证请求体
  if (!body.name || !body.email) {
    throw createError({
      statusCode: 400,
      message: 'Missing required fields: name, email'
    })
  }

  const user = await createUser(body)
  setResponseStatus(event, 201)
  return user
})
```

### 使用 Zod 验证

使用 `readValidatedBody` 和 `getValidatedQuery` 进行模式验证：

```ts
// server/api/users.post.ts
import { z } from 'zod'

const userSchema = z.object({
  name: z.string().min(1),
  email: z.string().email()
})

export default defineEventHandler(async (event) => {
  const body = await readValidatedBody(event, userSchema.parse)
  // body 被类型化为 { name: string, email: string }
  const user = await createUser(body)
  setResponseStatus(event, 201)
  return user
})
```

```ts
// server/api/users.get.ts
import { z } from 'zod'

const querySchema = z.object({
  page: z.coerce.number().default(1),
  limit: z.coerce.number().default(10)
})

export default defineEventHandler(async (event) => {
  const { page, limit } = await getValidatedQuery(event, querySchema.parse)
  return fetchUsers({ page, limit })
})
```

## 错误处理

使用 `createError` 处理 HTTP 错误：

```ts
throw createError({
  statusCode: 400,
  statusMessage: 'Bad Request',
  message: 'Invalid input',
  data: { field: 'email' } // 可选的附加数据
})
```

## 服务端中间件

在每个服务端请求上运行：

```ts
// server/middleware/log.ts
export default defineEventHandler((event) => {
  console.log(`${event.method} ${event.path}`)
})
```

命名中间件用于特定模式：

```ts
// server/middleware/auth.ts
export default defineEventHandler((event) => {
  const token = getRequestHeader(event, 'authorization')

  if (!token) {
    throw createError({
      statusCode: 401,
      message: 'Unauthorized'
    })
  }

  // 将用户附加到事件上下文中
  event.context.user = await verifyToken(token)
})
```

## 服务端工具

可复用的服务端函数（自动导入）：

```ts
// server/utils/db.ts
import { db } from './database'

export async function fetchUsers(options: { page: number, limit: number }) {
  return await db.select().from('users').limit(options.limit).offset((options.page - 1) * options.limit)
}

export async function fetchUserById(id: string) {
  return await db.select().from('users').where({ id }).first()
}
```

在所有服务端路由和中间件中自动导入。

## 请求辅助函数

```ts
// 获取参数
const userId = getRouterParam(event, 'userId')

// 获取查询参数
const query = getQuery(event)

// 获取请求体
const body = await readBody(event)

// 获取请求头
const auth = getRequestHeader(event, 'authorization')

// 获取 Cookie
const token = getCookie(event, 'token')

// 获取请求方法
const method = getMethod(event)

// 获取 IP 地址
const ip = getRequestIP(event)
```

## 响应辅助函数

```ts
// 设置状态码
setResponseStatus(event, 201)

// 设置响应头
setResponseHeader(event, 'X-Custom', 'value')
setResponseHeaders(event, { 'X-Custom': 'value', 'X-Another': 'value' })

// 设置 Cookie
setCookie(event, 'token', 'value', {
  httpOnly: true,
  secure: true,
  sameSite: 'lax',
  maxAge: 60 * 60 * 24 * 7 // 1 周
})

// 重定向
return sendRedirect(event, '/login', 302)

// 流式响应
return sendStream(event, stream)

// 无内容响应
return sendNoContent(event)
```

## 最佳实践

- **使用描述性参数名称** —— `[userId]` 而非 `[id]`
- **保持路由简洁** —— 将逻辑委托给服务端工具
- **在路由层验证输入**
- **使用类型化的错误** 并配合 `createError`
- **优雅地处理错误** —— 不要暴露内部信息
- **使用服务端工具** 处理数据库或外部 API
- **不要在响应中暴露敏感数据**
- **设置正确的状态码** —— 创建时返回 201，无内容时返回 204

## 常见错误

| ❌ 错误                    | ✅ 正确                        |
| -------------------------- | ----------------------------- |
| `event.context.params.id`  | `getRouterParam(event, 'id')` |
| `return res.json(data)`    | `return data`                 |
| `[id].get.ts`              | `[userId].get.ts`             |
| `users-id.get.ts`          | `users/[id].get.ts`           |
| 抛出通用错误               | 使用带状态码的 `createError`  |

## WebSocket

```ts
// server/routes/_ws.ts
export default defineWebSocketHandler({
  open(peer) {
    console.log('Client connected:', peer.id)
  },
  message(peer, message) {
    peer.send(`Echo: ${message.text()}`)
    // 广播到所有客户端: peer.publish('channel', message)
  },
  close(peer) {
    console.log('Client disconnected:', peer.id)
  }
})
```

在配置中启用：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  nitro: {
    experimental: { websocket: true }
  }
})
```

## 服务端事件（实验性）

```ts
// server/api/stream.get.ts
export default defineEventHandler(async (event) => {
  const stream = createEventStream(event)

  const interval = setInterval(async () => {
    await stream.push({ data: JSON.stringify({ time: Date.now() }) })
  }, 1000)

  stream.onClosed(() => {
    clearInterval(interval)
  })

  return stream.send()
})
```

## 资源

- Nuxt 服务端：https://nuxt.com/docs/guide/directory-structure/server
- h3（Nitro 引擎）：https://v1.h3.dev/
- Nitro：https://nitro.build/

> **对于数据库/存储 API：** 请参见 `nuxthub` 技能
