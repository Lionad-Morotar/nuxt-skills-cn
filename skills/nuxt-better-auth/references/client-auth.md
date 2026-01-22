# 客户端认证

## useUserSession()

用于认证状态和方法的主要组合式函数。

```ts
const {
  user,           // Ref<AuthUser | null>
  session,        // Ref<AuthSession | null>
  loggedIn,       // ComputedRef<boolean>
  ready,          // ComputedRef<boolean> - 会话获取完成
  client,         // Better Auth 客户端（仅客户端）
  signIn,         // 调用 client.signIn 的代理
  signUp,         // 调用 client.signUp 的代理
  signOut,        // 登出并清除会话
  fetchSession,   // 手动刷新会话
  updateUser      // 乐观式本地用户更新
} = useUserSession()
```

## 登录

```ts
// 邮箱/密码
await signIn.email({
  email: 'user@example.com',
  password: 'password123'
}, {
  onSuccess: () => navigateTo('/dashboard')
})

// OAuth
await signIn.social({ provider: 'github' })
```

## 注册

```ts
await signUp.email({
  email: 'user@example.com',
  password: 'password123',
  name: 'John Doe'
}, {
  onSuccess: () => navigateTo('/welcome')
})
```

## 登出

```ts
await signOut()
// 或带重定向
await signOut({ redirect: '/login' })
```

## 检查认证状态

```vue
<script setup>
const { user, loggedIn, ready } = useUserSession()
</script>

<template>
  <div v-if="!ready">加载中...</div>
  <div v-else-if="loggedIn">欢迎，{{ user?.name }}</div>
  <div v-else>请登录</div>
</template>
```

## 安全重定向

始终验证来自查询参数的重定向 URL，以防止开放重定向：

```ts
function getSafeRedirect() {
  const redirect = route.query.redirect as string
  // 必须以 / 开头且不为 //（防止协议相关 URL）
  if (!redirect?.startsWith('/') || redirect.startsWith('//')) {
    return '/'
  }
  return redirect
}

await signIn.email({
  email, password
}, {
  onSuccess: () => navigateTo(getSafeRedirect())
})
```

## 等待会话

在渲染前需要会话时非常有用：

```ts
await waitForSession() // 5秒超时
if (loggedIn.value) {
  // 会话已准备就绪
}
```

## 手动刷新会话

```ts
// 从服务器重新获取
await fetchSession({ force: true })
```

## 会话管理

通过 Better Auth 客户端进行额外的会话管理：

```ts
const { client } = useUserSession()

// 列出当前用户的所有活动会话
const sessions = await client.listSessions()

// 撤销特定会话
await client.revokeSession({ sessionId: 'xxx' })

// 撤销除当前会话外的所有会话
await client.revokeOtherSessions()

// 撤销所有会话（在所有地方登出）
await client.revokeSessions()
```

这些方法需要用户已认证。

## BetterAuthState 组件

在会话初始化完成（`ready === true`）后渲染一次，支持加载占位符。

```vue
<BetterAuthState>
  <template #default="{ loggedIn, user, session, signOut }">
    <p v-if="loggedIn">你好 {{ user?.name }}</p>
    <button v-else @click="navigateTo('/login')">登录</button>
  </template>
  <template #placeholder>
    <p>加载中…</p>
  </template>
</BetterAuthState>
```

**插槽：**

- `default` - 当 `ready === true` 时渲染，提供 `{ loggedIn, user, session, signOut }`
- `placeholder` - 在会话初始化期间渲染

在 clientOnly 模式或优雅的 SSR 加载状态中很有用。
