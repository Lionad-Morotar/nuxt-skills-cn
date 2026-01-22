# Nuxt 中间件与插件

## 使用时机

处理 `middleware/` 或 `plugins/` 目录、路由守卫、应用扩展。

## 路由中间件

路由中间件在导航前运行。用于身份验证检查、重定向、日志记录。

### 全局中间件

在每次路由变更时运行。**必须使用 `.global.ts` 后缀：**

```ts
// middleware/auth.global.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  if (to.meta.requiresAuth && !auth.isAuthenticated) {
    return navigateTo('/login')
  }
})
```

**不使用 `.global.ts` 后缀时，中间件将被命名（而非全局）**

## 警戒信号——停止并检查技能

如果你有以下想法，请停下并重新阅读此技能：

- “后缀不重要，关键是放在哪里”
- “我会使用 `redirect()` 而非 `return navigateTo()`”
- “我记得 Nuxt 3 的中间件模式”
- “导出默认函数更简单”

所有这些都意味着：你正在使用过时的模式。请改用 Nuxt 4 模式。

### 命名中间件

仅在显式应用时运行。无 `.global` 后缀：

```ts
// middleware/admin.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  if (!auth.isAdmin) {
    return navigateTo('/')
  }
})
```

在页面中应用：

```vue
<script setup lang="ts">
definePageMeta({
  middleware: ['admin']
})
</script>
```

### 中间件返回值

```ts
export default defineNuxtRouteMiddleware((to, from) => {
  // 允许导航
  return

  // 重定向
  return navigateTo('/login')

  // 终止导航
  return abortNavigation()

  // 带错误终止导航
  return abortNavigation('未授权')
})
```

### 中间件顺序

1. 全局中间件（按文件名字母顺序）
2. 布局中间件（如果布局定义了中间件）
3. 页面中间件（在 `definePageMeta` 中定义）

## 插件

插件用于扩展 Vue 应用的全局功能。在应用初始化期间运行。

### 基础插件

```ts
// plugins/my-plugin.ts
export default defineNuxtPlugin((nuxtApp) => {
  return {
    provide: {
      hello: (name: string) => `Hello ${name}!`
    }
  }
})
```

在组件中使用：

```vue
<script setup lang="ts">
const { $hello } = useNuxtApp()
console.log($hello('World')) // "Hello World!"
</script>
```

### 带 Vue 插件的插件

```ts
import type { PluginOptions } from 'vue-toastification'
// plugins/toast.client.ts
import Toast from 'vue-toastification'
import 'vue-toastification/dist/index.css'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.use(Toast, {
    position: 'top-right',
    timeout: 3000
  } as PluginOptions)
})
```

### 带钩子的插件

```ts
// plugins/init.ts
export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.hook('app:created', () => {
    console.log('App created')
  })

  nuxtApp.hook('page:finish', () => {
    console.log('Page finished loading')
  })
})
```

### 仅客户端或仅服务端

使用文件后缀：

- `.client.ts` —— 仅在客户端运行
- `.server.ts` —— 仅在服务端运行

```ts
// plugins/analytics.client.ts
export default defineNuxtPlugin(() => {
  // 仅在浏览器中运行
  if (window.analytics) {
    window.analytics.init()
  }
})
```

### 插件顺序

使用数字前缀控制执行顺序：

```
plugins/
├── 01.first.ts
├── 02.second.ts
└── 03.third.ts
```

### 异步插件

```ts
// plugins/api.ts
export default defineNuxtPlugin(async (nuxtApp) => {
  const config = await fetch('/api/config').then(r => r.json())

  return {
    provide: {
      config
    }
  }
})
```

## 最佳实践

**中间件：**

- **返回导航或无内容** —— 避免大量状态变更
- **保持逻辑精简** —— 将处理委托给组合式函数/存储
- **仅用于守卫与重定向**
- **正确检查元信息** —— `to.meta.requiresAuth`
- **全局中间件 = `.global.ts` 后缀必须存在**

**插件：**

- **仅用于全局应用功能**
- **通过 `provide` 提供以确保类型安全**
- **考虑客户端/服务端上下文** —— 使用 `.client` 或 `.server`
- **插件初始化时尽量减少工作量**
- **使用钩子处理生命周期事件**

## 常见错误

| ❌ 错误                             | ✅ 正确                                                     |
| ------------------------------------ | ------------------------------------------------------------ |
| `export default function({ route })` | `export default defineNuxtRouteMiddleware((to, from) => {})` |
| 修改路由对象                  | 返回 `navigateTo()` 或无内容                               |
| `middleware/auth.ts`（非全局）    | `middleware/auth.global.ts`（全局）                         |
| `redirect('/login')`                 | `return navigateTo('/login')`                                |
| 插件未使用 `defineNuxtPlugin`      | 使用 `defineNuxtPlugin()` 包裹                                 |

## 中间件示例：身份验证

```ts
// middleware/auth.global.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  // 公开路由
  const publicRoutes = ['/', '/login', '/register']
  if (publicRoutes.includes(to.path)) {
    return
  }

  // 检查身份验证
  if (!auth.isAuthenticated) {
    return navigateTo('/login')
  }

  // 检查角色
  if (to.meta.requiresAdmin && !auth.isAdmin) {
    return abortNavigation('访问被拒绝')
  }
})
```

## 插件示例：API 客户端

```ts
// plugins/api.ts
export default defineNuxtPlugin((nuxtApp) => {
  const config = useRuntimeConfig()

  const api = $fetch.create({
    baseURL: config.public.apiBase,
    onRequest({ request, options }) {
      const auth = useAuthStore()
      if (auth.token) {
        options.headers = {
          ...options.headers,
          Authorization: `Bearer ${auth.token}`
        }
      }
    },
    onResponseError({ response }) {
      if (response.status === 401) {
        navigateTo('/login')
      }
    }
  })

  return {
    provide: {
      api
    }
  }
})
```

## 资源

- Nuxt 中间件：https://nuxt.com/docs/guide/directory-structure/middleware
- Nuxt 插件：https://nuxt.com/docs/guide/directory-structure/plugins
- 路由中间件：https://nuxt.com/docs/getting-started/routing#route-middleware
