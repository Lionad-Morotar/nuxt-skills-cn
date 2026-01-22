# 客户端模式（外部认证后端）

当 Better Auth 运行在独立的后端（微服务、独立服务器）上时，使用 `clientOnly` 模式。

## 配置

### 1. 在 nuxt.config.ts 中启用

```ts
export default defineNuxtConfig({
  modules: ['@onmax/nuxt-better-auth'],
  auth: {
    clientOnly: true,
  },
})
```

### 2. 将客户端指向外部服务器

```ts [app/auth.config.ts]
import { createAuthClient } from 'better-auth/vue'

export function createAppAuthClient(_baseURL: string) {
  return createAuthClient({
    baseURL: 'https://auth.example.com', // 外部认证服务器
  })
}
```

### 3. 设置前端 URL

```ini [.env]
NUXT_PUBLIC_SITE_URL="https://your-frontend.com"
```

## 变更说明

| 功能                                                                          | 完整模式        | 客户端模式         |
| ----------------------------------------------------------------------------- | --------------- | ------------------ |
| `server/auth.config.ts`                                                       | 必需            | 无需             |
| `/api/auth/**` 处理程序                                                       | 自动注册        | 跳过               |
| `NUXT_BETTER_AUTH_SECRET`                                                     | 必需            | 无需             |
| 服务器工具（`serverAuth()`、`getUserSession()`、`requireUserSession()`）     | 可用            | **不可用**         |
| SSR 会话初始化                                                                | 服务端          | 仅客户端           |
| `useUserSession()`、路由保护、`<BetterAuthState>`                             | 正常工作        | 正常工作           |

## CORS 要求

确保外部认证服务器：

- 允许来自前端的请求（CORS 配置 `credentials: true`）
- 使用 `SameSite=None; Secure` 的 Cookie（需 HTTPS）
- 将前端 URL 包含在 `trustedOrigins` 中

## SSR 注意事项

会话仅从客户端获取：

- 服务端渲染的页面初始显示为“未认证”
- 客户端加载时用会话数据初始化
- 使用 `<BetterAuthState>` 处理加载状态

```vue
<BetterAuthState v-slot="{ isLoading, user }">
  <div v-if="isLoading">Loading...</div>
  <div v-else-if="user">Welcome, {{ user.name }}</div>
  <div v-else>Please log in</div>
</BetterAuthState>
```

## 使用场景

- **微服务架构**：认证服务为独立部署
- **共享认证**：多个前端共享一个认证后端
- **已有后端**：已在别处运行 Better Auth 服务器

## 架构示例

```
┌─────────────────┐     ┌─────────────────┐
│   Nuxt App      │────▶│  Auth Server    │
│  (clientOnly)   │     │ (Better Auth)   │
│                 │◀────│                 │
└─────────────────┘     └────────┬────────┘
                                 │
                        ┌────────▼────────┐
                        │    Database     │
                        └─────────────────┘
```
