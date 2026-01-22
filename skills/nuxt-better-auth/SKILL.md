---
name: nuxt-better-auth
description: 在 Nuxt 应用中使用 @onmax/nuxt-better-auth 实现认证时使用——提供 useUserSession 组合式函数、服务器认证助手、路由保护以及 Better Auth 插件集成。
license: MIT
---

# Nuxt Better Auth

基于 [Better Auth](https://www.better-auth.com/) 构建的 Nuxt 4+ 认证模块。提供组合式函数、服务器工具和路由保护。

> **Alpha 状态**：此模块目前处于 Alpha 版本（v0.0.2-alpha.14），不建议用于生产环境。API 可能会发生变更。

## 使用场景

- 安装/配置 `@onmax/nuxt-better-auth`
- 实现登录/注册/登出流程
- 路由保护（客户端和服务器）
- 在 API 路由中访问用户会话
- 集成 Better Auth 插件（管理、passkey、双因素认证）
- 使用 NuxtHub 设置数据库
- 使用 clientOnly 模式处理外部认证后端

**对于 Nuxt 模式**：使用 `nuxt` 技能  
**对于 NuxtHub 数据库**：使用 `nuxthub` 技能

## 可用指导

| 文件                                                                 | 主题                                                                 |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| **[references/installation.md](references/installation.md)**         | 模块设置、环境变量、配置文件                                           |
| **[references/client-auth.md](references/client-auth.md)**           | useUserSession、signIn/signUp/signOut、BetterAuthState、安全重定向     |
| **[references/server-auth.md](references/server-auth.md)**           | serverAuth、getUserSession、requireUserSession                         |
| **[references/route-protection.md](references/route-protection.md)** | routeRules、definePageMeta、中间件                                     |
| **[references/plugins.md](references/plugins.md)**                   | Better Auth 插件（管理、passkey、双因素认证）                          |
| **[references/database.md](references/database.md)**                 | NuxtHub 集成、Drizzle 模式、带外键的自定义表                           |
| **[references/client-only.md](references/client-only.md)**           | 外部认证后端、clientOnly 模式、CORS                                   |
| **[references/types.md](references/types.md)**                       | AuthUser、AuthSession、类型扩展                                       |

## 使用模式

**根据上下文加载：**

- 安装模块？→ [references/installation.md](references/installation.md)  
- 登录/注册表单？→ [references/client-auth.md](references/client-auth.md)  
- API 路由保护？→ [references/server-auth.md](references/server-auth.md)  
- 路由规则/页面元数据？→ [references/route-protection.md](references/route-protection.md)  
- 使用插件？→ [references/plugins.md](references/plugins.md)  
- 数据库设置？→ [references/database.md](references/database.md)  
- 外部认证后端？→ [references/client-only.md](references/client-only.md)  
- TypeScript 类型？→ [references/types.md](references/types.md)  

**不要一次性阅读所有文件。** 根据上下文加载。

## 关键概念

| 概念                   | 描述                                                             |
| ---------------------- | ---------------------------------------------------------------- |
| `useUserSession()`     | 客户端组合式函数 — 用户、会话、登录状态、signIn/Out 方法         |
| `requireUserSession()` | 服务器助手 — 若未认证则抛出 401/403 错误                         |
| `auth` 路由模式        | `'user'`、`'guest'`、`{ user: {...} }` 或 `false`                |
| `serverAuth()`         | 在服务器路由中获取 Better Auth 实例                              |

## 快速参考

```ts
// 客户端：useUserSession()
const { user, loggedIn, signIn, signOut } = useUserSession()
await signIn.email({ email, password }, { onSuccess: () => navigateTo('/') })
```

```ts
// 服务器：requireUserSession()
const { user } = await requireUserSession(event, { user: { role: 'admin' } })
```

```ts
// nuxt.config.ts：路由保护
routeRules: {
  '/admin/**': { auth: { user: { role: 'admin' } } },
  '/login': { auth: 'guest' },
  '/app/**': { auth: 'user' }
}
```

## 资源

- [模块文档](https://github.com/onmax/nuxt-better-auth)
- [Better Auth 文档](https://www.better-auth.com/)

---

_令牌效率：主技能约 300 个 token，每个子文件约 800-1200 个 token_
