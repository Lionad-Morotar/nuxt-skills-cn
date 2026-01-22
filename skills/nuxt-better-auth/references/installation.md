# 安装与配置

## 安装

```bash
pnpm add @onmax/nuxt-better-auth better-auth
```

**版本要求：**

- `@onmax/nuxt-better-auth`: `^0.0.2-alpha.14`（alpha）
- `better-auth`: `^1.0.0`（模块使用 `1.4.7` 测试）
- `@nuxthub/core`: `^0.10.0`（可选，用于数据库）

## 模块设置

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@onmax/nuxt-better-auth'],
  auth: {
    serverConfig: 'server/auth.config',  // 默认值
    clientConfig: 'app/auth.config',     // 默认值
    clientOnly: false,                   // 外部认证后端设为 true
    redirects: {
      login: '/login',  // 认证必需时重定向至
      guest: '/'        // 已登录时重定向至
    }
  }
})
```

## 环境变量

```bash
# 必填（至少 32 个字符）
# 也可通过 runtimeConfig.betterAuthSecret 设置（优先级更高）
BETTER_AUTH_SECRET=your-secret-key-at-least-32-characters

# 生产环境中 OAuth 所需
NUXT_PUBLIC_SITE_URL=https://your-domain.com
```

## 服务器配置

```ts
// server/auth.config.ts
import { defineServerAuth } from '#auth/server'

export default defineServerAuth(({ runtimeConfig, db }) => ({
  emailAndPassword: { enabled: true },
  // OAuth 提供商
  socialProviders: {
    github: {
      clientId: runtimeConfig.github.clientId,
      clientSecret: runtimeConfig.github.clientSecret
    }
  },
  // 会话配置（可选）
  session: {
    expiresIn: 60 * 60 * 24 * 7,      // 7 天（默认）
    updateAge: 60 * 60 * 24,           // 每 24 小时刷新一次（默认）
    freshAge: 60 * 60 * 24,            // 被视为“新鲜”会话持续时间（默认为 24 小时，0 表示从不）
    cookieCache: {
      enabled: true,
      maxAge: 60 * 5                   // Cookie 缓存有效期为 5 分钟
    }
  }
}))
```

`defineServerAuth` 中可用的上下文：

- `runtimeConfig` - Nuxt 运行时配置
- `db` - 数据库适配器（当启用 NuxtHub 时）

### 会话选项

| 选项                      | 默认值             | 描述                                         |
| ------------------------- | ------------------ | -------------------------------------------- |
| `expiresIn`               | `604800`（7 天）   | 会话持续时间（秒）                           |
| `updateAge`               | `86400`（24 小时） | 刷新会话过期时间的频率                       |
| `freshAge`                | `86400`（24 小时） | 被视为“新鲜”的会话时间段（0 表示从不）       |
| `cookieCache.enabled`     | `false`            | 启用 Cookie 缓存以减少数据库查询             |
| `cookieCache.maxAge`      | `300`（5 分钟）    | Cookie 缓存有效期                            |
| `disableSessionRefresh`   | `false`            | 禁用自动会话刷新                             |

## 客户端配置

```ts
// app/auth.config.ts
import { createAppAuthClient } from '#auth/client'

export default createAppAuthClient({
  // 客户端插件选项（例如 passkey、两步验证）
})
```

## NuxtHub 集成

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxthub/core', '@onmax/nuxt-better-auth'],
  hub: { database: true },
  auth: {
    secondaryStorage: true  // 启用 KV 存储用于会话缓存
  }
})
```

参见 [references/database.md](database.md) 查看模式设置。

## 仅客户端模式

对于外部认证后端（微服务、独立服务器）：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  auth: {
    clientOnly: true,  // 不启用本地认证服务器
  }
})
```

参见 [references/client-only.md](client-only.md) 获取完整设置说明。
