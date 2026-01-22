# 更好的认证插件

该模块支持所有 Better Auth 插件。在服务器和客户端配置中进行设置。

## 服务器插件设置

```ts
// server/auth.config.ts
import { defineServerAuth } from '#auth/server'

export default defineServerAuth(({ runtimeConfig }) => ({
  emailAndPassword: { enabled: true },
  plugins: [
    admin(),
    twoFactor({ issuer: 'MyApp' }),
    passkey(),
    multiSession()
  ]
}))
```

## 客户端插件设置

```ts
// app/auth.config.ts
import { createAppAuthClient } from '#auth/client'
import { adminClient, twoFactorClient, passkeyClient, multiSessionClient } from 'better-auth/client/plugins'

export default createAppAuthClient({
  plugins: [
    adminClient(),
    twoFactorClient(),
    passkeyClient(),
    multiSessionClient()
  ]
})
```

## 常用插件

### 管理员

基于角色的访问控制：

```ts
// 服务器端
import { admin } from 'better-auth/plugins'
plugins: [admin()]

// 客户端
import { adminClient } from 'better-auth/client/plugins'
plugins: [adminClient()]
```

使用方法：

```ts
// 保护路由
await requireUserSession(event, { user: { role: 'admin' } })

// 客户端：设置用户角色
await client.admin.setRole({ userId: 'xxx', role: 'admin' })
```

### 双因素认证（2FA）

```ts
// 服务器端
import { twoFactor } from 'better-auth/plugins'
plugins: [twoFactor({ issuer: 'MyApp' })]

// 客户端
import { twoFactorClient } from 'better-auth/client/plugins'
plugins: [twoFactorClient()]
```

使用方法：

```ts
// 启用 2FA
const { totpURI } = await client.twoFactor.enable({ password: 'xxx' })
// 使用 totpURI 显示二维码

// 登录时验证 OTP
await client.twoFactor.verifyTotp({ code: '123456' })
```

### 密钥（Passkey）

WebAuthn/FIDO2 认证：

```ts
// 服务器端
import { passkey } from 'better-auth/plugins'
plugins: [passkey()]

// 客户端
import { passkeyClient } from 'better-auth/client/plugins'
plugins: [passkeyClient()]
```

使用方法：

```ts
// 注册密钥
await client.passkey.addPasskey()

// 使用密钥登录
await signIn.passkey()
```

### 多会话

允许多个并发会话：

```ts
// 服务器端
import { multiSession } from 'better-auth/plugins'
plugins: [multiSession()]

// 客户端
import { multiSessionClient } from 'better-auth/client/plugins'
plugins: [multiSessionClient()]
```

使用方法：

```ts
// 列出所有会话
const sessions = await client.multiSession.listDeviceSessions()

// 撤销特定会话
await client.multiSession.revokeSession({ sessionId: 'xxx' })
```

## 插件类型推断

插件中的类型将自动推断。有关类型增强，请参见 [references/types.md](types.md)。
