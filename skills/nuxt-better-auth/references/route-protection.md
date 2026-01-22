# 路由保护

三层保护机制：路由规则、页面元数据和服务器中间件。

## 路由规则（全局）

在 `nuxt.config.ts` 中定义认证要求：

```ts
export default defineNuxtConfig({
  routeRules: {
    '/admin/**': { auth: { user: { role: 'admin' } } },
    '/dashboard/**': { auth: 'user' },
    '/login': { auth: 'guest' },
    '/public/**': { auth: false }
  }
})
```

## 认证模式

| 模式              | 行为                                                   |
| ----------------- | ------------------------------------------------------ |
| `'user'`          | 需要已认证用户                                         |
| `'guest'`         | 仅限未认证用户（将已登录用户重定向）                   |
| `{ user: {...} }` | 需要匹配特定属性的用户                                 |
| `false`           | 无保护                                                 |

## 页面元数据（按页面）

覆盖或为特定页面定义认证：

```vue
<script setup>
// 要求认证
definePageMeta({ auth: 'user' })
</script>
```

```vue
<script setup>
// 要求管理员角色
definePageMeta({
  auth: { user: { role: 'admin' } }
})
</script>
```

```vue
<script setup>
// 仅限访客（登录页面）
definePageMeta({ auth: 'guest' })
</script>
```

## 用户属性匹配

```ts
// 单个值
{ auth: { user: { role: 'admin' } } }

// 或逻辑（数组）
{ auth: { user: { role: ['admin', 'moderator'] } } }

// 与逻辑（多个字段）
{ auth: { user: { role: 'admin', verified: true } } }
```

## 重定向配置

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  auth: {
    redirects: {
      login: '/login',    // 未认证用户重定向地址
      guest: '/dashboard' // 已登录用户从访客页面重定向地址
    }
  }
})
```

## 服务器中间件

认证中间件会在所有匹配 `routeRules` 的 `/api/**` 路由上运行。

对于自定义 API 保护，请使用 `requireUserSession()`：

```ts
// server/api/admin/[...].ts
export default defineEventHandler(async (event) => {
  await requireUserSession(event, { user: { role: 'admin' } })
  // 处理请求
})
```

## 优先级顺序

1. `definePageMeta({ auth })` —— 最高优先级
2. `routeRules` 模式 —— 根据路径匹配
3. 默认：无保护

## 预渲染页面

在预渲染水合过程中跳过认证检查。水合完成后从客户端获取会话。
