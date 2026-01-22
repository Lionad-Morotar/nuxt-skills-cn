# 服务端认证

## serverAuth()

获取 Better Auth 实例以进行高级操作：

```ts
// server/api/custom.ts
export default defineEventHandler(async (event) => {
  const auth = serverAuth()
  // 访问完整的 Better Auth API
  const sessions = await auth.api.listSessions({ headers: event.headers })
  return sessions
})
```

模块级单例（可多次调用——返回缓存实例）。

### 可用的服务端方法

通过 `serverAuth().api`：

```ts
const auth = serverAuth()

// 会话管理
await auth.api.listSessions({ headers: event.headers })
await auth.api.revokeSession({ sessionId: 'xxx' }, { headers: event.headers })
await auth.api.revokeOtherSessions({ headers: event.headers })
await auth.api.revokeSessions({ headers: event.headers })

// 用户管理（配合管理员插件）
await auth.api.setRole({ userId: 'xxx', role: 'admin' }, { headers: event.headers })
```

## getUserSession()

获取当前会话而不抛出异常（未认证时返回 null）：

```ts
export default defineEventHandler(async (event) => {
  const result = await getUserSession(event)
  if (!result) {
    return { guest: true }
  }
  return { user: result.user }
})
```

返回 `{ user: AuthUser, session: AuthSession } | null`。

## requireUserSession()

强制认证——未认证时抛出异常：

```ts
export default defineEventHandler(async (event) => {
  const { user, session } = await requireUserSession(event)
  // 用户和会话保证存在
  return { userId: user.id }
})
```

- 若未认证则抛出 `401`
- 若用户匹配失败则抛出 `403`

## 用户匹配

基于用户属性限制访问：

```ts
// 单一值——精确匹配
await requireUserSession(event, {
  user: { role: 'admin' }
})

// 数组——OR 逻辑（任意值匹配）
await requireUserSession(event, {
  user: { role: ['admin', 'moderator'] }
})

// 多字段——AND 逻辑（全部必须匹配）
await requireUserSession(event, {
  user: { role: 'admin', verified: true }
})
```

## 自定义规则

用于复杂的验证逻辑：

```ts
await requireUserSession(event, {
  rule: ({ user, session }) => {
    return user.subscription?.active && user.points > 100
  }
})

// 与用户匹配结合使用
await requireUserSession(event, {
  user: { verified: true },
  rule: ({ user }) => user.subscription?.plan === 'pro'
})
```

## 模式示例

```ts
// 仅管理员端点
export default defineEventHandler(async (event) => {
  const { user } = await requireUserSession(event, {
    user: { role: 'admin' }
  })
  return getAdminData()
})

// 高级功能
export default defineEventHandler(async (event) => {
  await requireUserSession(event, {
    rule: ({ user }) => ['pro', 'enterprise'].includes(user.plan)
  })
  return getPremiumContent()
})

// 仅所有者资源
export default defineEventHandler(async (event) => {
  const id = getRouterParam(event, 'id')
  const { user } = await requireUserSession(event)
  const resource = await getResource(id)
  if (resource.ownerId !== user.id) {
    throw createError({ statusCode: 403 })
  }
  return resource
})
```
