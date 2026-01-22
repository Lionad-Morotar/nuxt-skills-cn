# Nuxt 组合式函数与工具

## 使用场景

处理特定于 Nuxt 的组合式函数、URL 处理、导航或数据获取。

## URL 与请求处理

### useRequestURL()

**始终使用 `useRequestURL()` 而非 `window.origin` 或 `window.location`：**

```ts
// ✅ 正确 —— 在 SSR 和客户端均可用
const url = useRequestURL()
console.log(url.origin) // https://example.com
console.log(url.pathname) // /users/123
console.log(url.search) // ?tab=profile

// ❌ 错误 —— 在 SSR 中会出错，服务端不可用
const origin = window.origin
const path = window.location.pathname
```

**原因：** 在 SSR 期间 `window` 是未定义的。`useRequestURL()` 可在所有环境中工作。

### useRequestURL() 模式

```ts
// 获取完整 URL
const url = useRequestURL()
const fullUrl = url.href // https://example.com/users/123?tab=profile

// 获取源地址（基础 URL）
const baseUrl = url.origin // https://example.com

// 获取路径
const path = url.pathname // /users/123

// 获取查询参数（推荐使用 useRoute() 以获得更好的类型支持）
const params = url.searchParams
const tab = params.get('tab') // 'profile'

// 构建绝对 URL
const apiUrl = `${url.origin}/api/users`
```

## 导航组合式函数

### navigateTo()

```ts
// 导航至路由
await navigateTo('/about')

// 类型安全的导航
await navigateTo({ name: '/users/[userId]', params: { userId: '123' } })

// 外部 URL
await navigateTo('https://nuxt.com', { external: true })

// 替换历史记录
await navigateTo('/login', { replace: true })

// 在新标签页中打开
await navigateTo('/docs', { open: { target: '_blank' } })

// 服务端重定向
return navigateTo('/login') // 在中间件或服务端路由中
```

### useRouter()

```ts
const router = useRouter()

// 导航
router.push({ name: '/users/[userId]', params: { userId: '123' } })

// 返回上一页
router.back()

// 前进一页
router.forward()

// 导航守卫
router.beforeEach((to, from) => {
  // 守卫逻辑
})
```

### useRoute()

```ts
// 通用路由
const route = useRoute()

// 类型化的路由（推荐）
const route = useRoute('/users/[userId]')

// 访问参数
const userId = route.params.userId

// 访问查询参数
const tab = route.query.tab

// 访问元信息
const requiresAuth = route.meta.requiresAuth
```

## 数据获取

### useFetch()

```ts
// 基础获取
const { data, error, pending, refresh } = await useFetch('/api/users')

// 带参数
const { data } = await useFetch('/api/users', {
  query: { page: 1, limit: 10 }
})

// 使用 key 进行去重
const { data } = await useFetch(`/api/users/${userId}`, {
  key: `user-${userId}`
})

// 惰性获取（不会阻塞导航）
const { data } = await useLazyFetch('/api/users')

// 监听并刷新
const page = ref(1)
const { data } = await useFetch('/api/users', {
  query: { page },
  watch: [page]
})

// 使用 AbortController 取消请求（Nuxt 4.2+）
const controller = new AbortController()
const { data } = await useFetch('/api/users', {
  signal: controller.signal
})
// 后续：controller.abort() 取消请求
```

### useAsyncData()

```ts
// 自定义异步逻辑
const { data, error, pending, refresh } = await useAsyncData('users', async () => {
  const response = await $fetch('/api/users')
  return response.filter(u => u.active)
})

// 惰性版本
const { data } = await useLazyAsyncData('users', async () => {
  return await $fetch('/api/users')
})

// 使用 AbortController 取消（Nuxt 4.2+）
const controller = new AbortController()
const { data } = await useAsyncData('users', async () => {
  return await $fetch('/api/users', { signal: controller.signal })
})
// 后续：controller.abort() 取消

// 使用 getCachedData 自定义缓存逻辑
const { data } = await useAsyncData('users',
  async () => $fetch('/api/users'),
  {
    getCachedData: (key) => {
      // 返回缓存数据或 null/undefined 以触发获取
      const cached = useNuxtData(key)
      return cached.data.value
    }
  }
)

// 嵌套对象的深度响应性
// 默认在 Nuxt 4 中为浅层（Nuxt 3 中为深层）
const { data } = await useAsyncData('user',
  async () => $fetch('/api/user'),
  {
    deep: true // 使嵌套属性成为响应式
  }
)
```

## 状态管理

### useState()

```ts
// 创建共享状态
const counter = useState('counter', () => 0)

// 在组件中使用
counter.value++

// 带类型定义
const user = useState<User | null>('user', () => null)
```

## 应用上下文

### useNuxtApp()

```ts
const nuxtApp = useNuxtApp()

// 访问提供值
const { $api, $hello } = nuxtApp

// 访问钩子
nuxtApp.hook('page:finish', () => {
  console.log('页面加载完成')
})

// 访问 Vue 应用
nuxtApp.vueApp.use(SomePlugin)
```

### useRuntimeConfig()

```ts
// 访问运行时配置
const config = useRuntimeConfig()

// 公开配置（客户端 + 服务端）
const apiBase = config.public.apiBase

// 私有配置（仅服务端）
const apiSecret = config.apiSecret // 客户端中为 undefined
```

## 页面头部管理

### useHead()

```ts
// 设置页面元信息
useHead({
  title: '用户资料',
  meta: [
    { name: 'description', content: '查看用户资料' },
    { property: 'og:title', content: '用户资料' }
  ],
  link: [
    { rel: 'canonical', href: 'https://example.com/profile' }
  ]
})

// 动态值
const user = ref({ name: 'John' })
useHead({
  title: () => `${user.value.name}'s Profile`
})
```

### useSeoMeta()

```ts
// 更简洁的 SEO 元信息
useSeoMeta({
  title: '用户资料',
  description: '查看用户资料',
  ogTitle: '用户资料',
  ogDescription: '查看用户资料',
  ogImage: 'https://example.com/image.jpg',
  twitterCard: 'summary_large_image'
})
```

## 最佳实践

- **使用 useRequestURL()** 而非 window.origin/location
- **为路由添加类型定义** 使用 useRoute('/path/[param]')
- **使用 useFetch** 进行 API 调用（去重、SSR 支持）
- **为获取操作设置 key** 实现正确缓存
- **使用 useState** 实现跨组件共享状态
- **使用 useSeoMeta** 简化 SEO 标签

## 常见错误

| ❌ 错误                       | ✅ 正确                                               |
| ---------------------------- | ----------------------------------------------------- |
| `window.origin`              | `useRequestURL().origin`                              |
| `window.location.pathname`   | `useRequestURL().pathname`                            |
| 在组件中使用 `fetch()`       | 使用 `useFetch()` 或 `useAsyncData()`                 |
| `router.push('/path/' + id)` | `router.push({ name: '/path/[id]', params: { id } })` |
| 重复获取                     | 使用 `key` 参数                                       |

## 资源

- Nuxt 组合式函数：https://nuxt.com/docs/api/composables/use-fetch
- 数据获取：https://nuxt.com/docs/getting-started/data-fetching
- useRequestURL：https://nuxt.com/docs/api/composables/use-request-url
- **关于 NuxtTime、NuxtLink、NuxtImg**：请参阅 nuxt-components.md
