# 基于文件的 Nuxt 路由

## 何时使用

在处理 `pages/` 或 `layouts/` 目录时，基于文件的路由和导航。

## 基于文件的路由基础

`pages/` 文件夹结构直接映射到路由。文件名决定 URL。

## 命名约定

**关键原则：**

- **始终使用描述性参数：** `[userId].vue` 而非 `[id].vue`
- **使用 `.` 表示路径段：** `users.edit.vue` → `/users/edit`
- **可选参数：** `[[paramName]].vue`
- **通配符路由：** `[...path].vue`
- **路由分组用于组织：** `(folder)/` 将文件分组，但不影响 URL

## 警告信号 —— 停止并检查技能

如果你在思考以下任何一项，请停止并重新阅读本技能：

- “字符串路径比类型化路由更简单”
- “通用参数名如 [id] 没问题”
- “我记得 Nuxt 3 是怎么工作的”

以上所有意味着：你即将使用过时的模式。请改用 Nuxt 4 模式。

## 文件结构示例

```
pages/
├── index.vue               # /
├── about.vue               # /about
├── [...slug].vue           # 用于 404 的通配符路径
├── users.edit.vue          # /users/edit - 突破嵌套结构
├── users.vue               # 父路由（/users/* 的布局）
└── users/
    ├── index.vue           # /users
    └── [userId].vue        # /users/:userId
```

## 路由分组用于组织

路由分组对文件进行组织，但不影响 URL。将文件夹名称用括号包围：

```
pages/
├── (marketing)/            # 分组文件夹（URL 中忽略）
│   ├── about.vue           # /about（而非 /marketing/about）
│   └── pricing.vue         # /pricing
└── (admin)/                # 分组文件夹（URL 中忽略）
    ├── dashboard.vue       # /dashboard
    └── settings.vue        # /settings
```

**使用路由分组来：**

- 按功能/团队组织页面
- 对相关路由进行分组，但不影响 URL
- 保持大型项目的可维护性

## 父路由（布局）

父路由 = 嵌套路由的布局：

```vue
<!-- pages/users.vue -->
<template>
  <div class="users-layout">
    <nav>
      <NuxtLink to="/users">所有用户</NuxtLink>
      <NuxtLink to="/users/create">创建用户</NuxtLink>
    </nav>
    <NuxtPage />
  </div>
</template>
```

子路由：

```
pages/
├── users.vue           # 父路由，包含 <NuxtPage />
└── users/
    ├── index.vue       # /users
    ├── [userId].vue    # /users/:userId
    └── create.vue      # /users/create
```

## 使用 definePage 自定义路由

```vue
<script setup lang="ts">
definePage({
  name: 'user-profile',
  path: '/profile/:userId',  // 覆盖默认路径
  alias: ['/me', '/profile'],
  meta: {
    requiresAuth: true,
    title: '用户资料',
    roles: ['user', 'admin']
  }
})
</script>

<template>
  <div>资料内容</div>
</template>
```

## 类型化路由

**始终使用类型化的路由进行导航：**

```ts
// ✅ 使用路由名称，类型安全
await navigateTo({ name: '/users/[userId]', params: { userId: '123' } })

// ❌ 字符串路径（无类型安全，避免使用）
await navigateTo('/users/123')
```

**必须：在导航前检查 `typed-router.d.ts` 以获取可用的路由名称和参数。**

## 使用 useRoute 并配合类型

传递路由名称以获得更严格的类型：

```ts
// 通用路由
const route = useRoute()

// 类型化的路由（推荐）
const route = useRoute('/users/[userId]')
// 此时 route.params.userId 已正确打上类型
```

## 导航

```ts
// 导航到路由
await navigateTo('/about')
await navigateTo({ name: '/users/[userId]', params: { userId: '123' } })

// 带查询参数的导航
await navigateTo({ path: '/search', query: { q: 'nuxt' } })

// 外部重定向
await navigateTo('https://nuxt.com', { external: true })

// 替换历史记录
await navigateTo('/login', { replace: true })

// 在新标签页中打开
await navigateTo('/docs', { open: { target: '_blank' } })
```

## 路由元数据与中间件

```vue
<script setup lang="ts">
definePageMeta({
  middleware: ['auth', 'admin'],
  layout: 'dashboard',
  meta: {
    requiresAuth: true
  }
})
</script>
```

## 动态路由模式

```
[userId].vue              # /users/123
[[slug]].vue              # /blog 或 /blog/post（可选）
[...path].vue             # /a/b/c（通配符）
[[...path]].vue           # / 或 /a/b/c（可选通配符）
```

## 突破嵌套路由

使用 `.` 在父级创建路由：

```
pages/
├── users.vue               # /users 布局
├── users/
│   └── [userId].vue        # /users/123
└── users.settings.vue      # /users/settings（不嵌套在布局下）
```

## 最佳实践

- **`index.vue` 用于首页路由** - 合法且正确，用于创建默认路由
- **使用路由分组 `(folder)/` 进行组织** - 分组文件，不影响 URL
- **使用描述性参数名** - `[userId]` 而非 `[id]`，`[postSlug]` 而非 `[slug]`
- **类型安全的导航** - 使用路由名称，而非字符串
- **检查 typed-router.d.ts 获取可用路由**
- **父路由用于布局** - `users.vue` 包含 `<NuxtPage />`
- **使用 definePage 自定义路径/别名**
- **通配符用于 404** - `[...path].vue` 或 `[...slug].vue`

## 常见错误

| ❌ 错误                      | ✅ 正确                                                           |
| ---------------------------- | ----------------------------------------------------------------- |
| `[id].vue`                   | `[userId].vue` 或 `[postId].vue`                                  |
| `navigateTo('/users/' + id)` | `navigateTo({ name: '/users/[userId]', params: { userId: id } })` |
| `<Nuxt />`                   | `<NuxtPage />`                                                    |
| 分离的 layouts/ 文件夹       | 使用父路由与 `<NuxtPage />`                                       |

## 资源

- Nuxt 路由：https://nuxt.com/docs/guide/directory-structure/pages
- 基于文件的路由：https://nuxt.com/docs/getting-started/routing
