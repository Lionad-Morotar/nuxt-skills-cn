# TypeScript 类型

## 模块别名

从模块别名导入类型：

```ts
import type { AuthUser, AuthSession, ServerAuthContext, AppAuthClient } from '#nuxt-better-auth'
```

## 核心类型

### AuthUser

由 `useUserSession()` 和 `requireUserSession()` 返回的用户对象：

```ts
interface AuthUser {
  id: string
  email: string
  name?: string
  image?: string
  emailVerified: boolean
  createdAt: Date
  updatedAt: Date
  // 加上插件中的任何字段（角色等）
}
```

### AuthSession

会话对象：

```ts
interface AuthSession {
  id: string
  userId: string
  expiresAt: Date
  // token 从暴露的数据中过滤掉
}
```

## 类型推断

类型会自动从服务器配置中推断。该模块使用 Better Auth 中的 `InferUser` 和 `InferSession`：

```ts
// 从 server/auth.config.ts 推断
type AuthUser = InferUser<typeof authConfig>
type AuthSession = InferSession<typeof authConfig>
```

## 插件类型扩展

使用插件时，类型会自动扩展：

```ts
// 使用 admin 插件
interface AuthUser {
  // ... 基础字段
  role: 'user' | 'admin'
}

// 使用双因素认证插件
interface AuthUser {
  // ... 基础字段
  twoFactorEnabled: boolean
}
```

## ServerAuthContext

在 `defineServerAuth()` 回调中可用：

```ts
interface ServerAuthContext {
  runtimeConfig: RuntimeConfig
  db?: DrizzleDatabase  // 当启用 NuxtHub 时
}
```

## 在组件中使用类型

```vue
<script setup lang="ts">
import type { AuthUser } from '#nuxt-better-auth'

const { user } = useUserSession()
// user 是 Ref<AuthUser | null>

function greet(u: AuthUser) {
  return `Hello, ${u.name}`
}
</script>
```

## 在服务器中使用类型

```ts
// server/utils/helpers.ts
import type { AuthUser, AuthSession } from '#nuxt-better-auth'

export function isAdmin(user: AuthUser): boolean {
  return user.role === 'admin'
}
```

## 自定义用户字段

通过 Better Auth 配置扩展用户类型：

```ts
// server/auth.config.ts
export default defineServerAuth(() => ({
  user: {
    additionalFields: {
      plan: { type: 'string' },
      credits: { type: 'number' }
    }
  }
}))
```

类型会自动包含这些字段：

```ts
// AuthUser 现在包括：
interface AuthUser {
  // ... 基础字段
  plan: string
  credits: number
}
```

## 类型安全的用户匹配

```ts
// 完全类型化
await requireUserSession(event, {
  user: { role: 'admin' }  // TypeScript 知道有效的字段
})
```
