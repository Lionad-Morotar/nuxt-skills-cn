---
description: Use when working on Nuxt 4+ projects - provides server routes, file-based routing, middleware patterns, Nuxt-specific composables, and configuration with latest docs
mode: subagent
tools:
  write: false
  edit: false
---

# Nuxt 4+ Development

Progressive guidance for Nuxt 4+ projects with latest patterns and conventions.

## When to Use

Working with:
- Server routes (API endpoints, server middleware, server utils)
- File-based routing (pages, layouts, route groups)
- Nuxt middleware (route guards, navigation)
- Nuxt plugins (app extensions)
- Nuxt-specific features (auto-imports, layers, modules)

## Available Guidance

Read specific files based on current work:

- **server.md** - API routes, server middleware, Nitro patterns, h3 helpers
- **routing.md** - File-based routing, route groups, typed router, definePage
- **middleware-plugins.md** - Route middleware, plugins, app lifecycle
- **nuxt-composables.md** - Nuxt composables (useRequestURL, useFetch, navigation)
- **nuxt-components.md** - NuxtLink, NuxtImg, NuxtTime (prefer over HTML elements)
- **nuxt-config.md** - Configuration, modules, auto-imports, layers

**For Vue composables:** See `vue` skill composables.md (VueUse, Composition API patterns)

## Usage Pattern

**Progressive loading - only read what you need:**

```bash
# Creating API endpoint?
cat ~/.claude/skills/nuxt/server.md

# Setting up pages/routing?
cat ~/.claude/skills/nuxt/routing.md

# Using composables/data fetching?
cat ~/.claude/skills/nuxt/nuxt-composables.md

# Adding middleware/plugins?
cat ~/.claude/skills/nuxt/middleware-plugins.md

# Configuring Nuxt?
cat ~/.claude/skills/nuxt/nuxt-config.md

# Setting up CI/ESLint?
cat ~/.claude/skills/nuxt/project-setup.md
```

**DO NOT read all files at once.** Load based on context:
- Working in `server/` → read server.md
- Working in `pages/` or `layouts/` → read routing.md
- Using `useFetch`, `useRequestURL`, navigation → read nuxt-composables.md
- Using `<a>`, `<img>`, `<time>` elements → read nuxt-components.md
- Working in `middleware/` or `plugins/` → read middleware-plugins.md
- Editing `nuxt.config.ts` → read nuxt-config.md

## Nuxt 4 vs Older Versions

**You are working with Nuxt 4+.** Key differences:

| Old (Nuxt 2/3) | New (Nuxt 4) |
|----------------|--------------|
| `index.vue` | `(descriptive-name).vue` |
| `<Nuxt />` | `<NuxtPage />` |
| `context.params` | `getRouterParam(event, 'name')` |
| `window.origin` | `useRequestURL().origin` |
| String routes | Typed router with route names |
| Separate layouts/ | Parent routes with `<slot>` |

**If you're unsure about Nuxt 4 patterns, read the relevant guidance file first.**

## Latest Documentation

**When to fetch latest docs:**
- New Nuxt 4 features not covered here
- Module-specific configuration
- Breaking changes or deprecations
- Advanced use cases

**Official sources:**
- Nuxt: https://nuxt.com/docs
- h3 (server engine): https://h3.unjs.io/
- Nitro: https://nitro.unjs.io/

## Token Efficiency

Main skill: ~300 tokens. Each sub-file: ~800-1500 tokens. Only load files relevant to current task.

---

# Nuxt Middleware & Plugins

## When to Use

Working with `middleware/` or `plugins/` directories, route guards, app extensions.

## Route Middleware

Route middleware runs before navigation. Used for auth checks, redirects, logging.

### Global Middleware

Runs on every route change. **REQUIRED: Use `.global.ts` suffix:**

```ts
// middleware/auth.global.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  if (to.meta.requiresAuth && !auth.isAuthenticated) {
    return navigateTo('/login')
  }
})
```

**Without `.global.ts` suffix, middleware is named (not global).**

## Red Flags - Stop and Check Skill

If you're thinking any of these, STOP and re-read this skill:
- "Suffix doesn't matter, it's about where I put it"
- "I'll redirect() instead of return navigateTo()"
- "I remember Nuxt 3 middleware patterns"
- "Export default function is simpler"

All of these mean: You're using outdated patterns. Use Nuxt 4 patterns instead.

### Named Middleware

Runs only when explicitly applied. No `.global` suffix:

```ts
// middleware/admin.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  if (!auth.isAdmin) {
    return navigateTo('/')
  }
})
```

Apply in page:

```vue
<script setup lang="ts">
definePageMeta({
  middleware: ['admin']
})
</script>
```

### Middleware Return Values

```ts
export default defineNuxtRouteMiddleware((to, from) => {
  // Allow navigation
  return

  // Redirect
  return navigateTo('/login')

  // Abort navigation
  return abortNavigation()

  // Abort with error
  return abortNavigation('Not authorized')
})
```

### Middleware Order

1. Global middleware (alphabetical by filename)
2. Layout middleware (if layout defines middleware)
3. Page middleware (defined in definePageMeta)

## Plugins

Plugins extend Vue app with global functionality. Run during app initialization.

### Basic Plugin

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

Use in components:

```vue
<script setup lang="ts">
const { $hello } = useNuxtApp()
console.log($hello('World')) // "Hello World!"
</script>
```

### Plugin with Vue Plugin

```ts
// plugins/toast.client.ts
import Toast, { type PluginOptions } from 'vue-toastification'
import 'vue-toastification/dist/index.css'

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.use(Toast, {
    position: 'top-right',
    timeout: 3000
  } as PluginOptions)
})
```

### Plugin with Hooks

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

### Client-Only or Server-Only

Use file suffix:
- `.client.ts` - runs only on client
- `.server.ts` - runs only on server

```ts
// plugins/analytics.client.ts
export default defineNuxtPlugin(() => {
  // Only runs in browser
  if (window.analytics) {
    window.analytics.init()
  }
})
```

### Plugin Order

Use numeric prefix for execution order:

```
plugins/
├── 01.first.ts
├── 02.second.ts
└── 03.third.ts
```

### Async Plugins

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

## Best Practices

**Middleware:**
- **Return navigation or nothing** - don't mutate state heavily
- **Keep logic minimal** - delegate to composables/stores
- **Use for guards & redirects** only
- **Check meta properly** - `to.meta.requiresAuth`
- **Global = `.global.ts`** suffix required

**Plugins:**
- **Use for app-wide functionality** only
- **Provide via `provide`** for type safety
- **Consider client/server context** - use `.client`/`.server`
- **Minimize work** in plugin initialization
- **Use hooks** for lifecycle events

## Common Mistakes

| ❌ Wrong | ✅ Right |
|---------|---------|
| `export default function({ route })` | `export default defineNuxtRouteMiddleware((to, from) => {})` |
| Mutate route object | Return navigateTo() or nothing |
| `middleware/auth.ts` (not global) | `middleware/auth.global.ts` (global) |
| `redirect('/login')` | `return navigateTo('/login')` |
| Plugin without defineNuxtPlugin | Wrap in defineNuxtPlugin() |

## Middleware Example: Auth

```ts
// middleware/auth.global.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const auth = useAuthStore()

  // Public routes
  const publicRoutes = ['/', '/login', '/register']
  if (publicRoutes.includes(to.path)) {
    return
  }

  // Check auth
  if (!auth.isAuthenticated) {
    return navigateTo('/login')
  }

  // Check role
  if (to.meta.requiresAdmin && !auth.isAdmin) {
    return abortNavigation('Access denied')
  }
})
```

## Plugin Example: API Client

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

## Resources

- Nuxt middleware: https://nuxt.com/docs/guide/directory-structure/middleware
- Nuxt plugins: https://nuxt.com/docs/guide/directory-structure/plugins
- Route middleware: https://nuxt.com/docs/getting-started/routing#route-middleware

---

# Nuxt Built-in Components

## When to Use

Working with images, links, or time display in templates. **Always prefer Nuxt components over HTML elements.**

## Component Preferences

| HTML Element | Nuxt Component | Why |
|-------------|----------------|-----|
| `<a>` | `<NuxtLink>` | Client-side navigation, prefetching |
| `<img>` | `<NuxtImg>` | Optimization, lazy loading, responsive |
| `<time>` | `<NuxtTime>` | SSR-safe formatting, localization |

## NuxtLink

**ALWAYS use `<NuxtLink>` instead of `<a>` for internal links:**

```vue
<template>
  <!-- Internal navigation -->
  <NuxtLink to="/about">About</NuxtLink>
  <NuxtLink :to="{ name: '/users/[userId]', params: { userId } }">Profile</NuxtLink>

  <!-- External links (uses target="_blank" automatically with external) -->
  <NuxtLink to="https://nuxt.com" external>Nuxt Docs</NuxtLink>

  <!-- Prefetch control -->
  <NuxtLink to="/dashboard" :prefetch="false">Dashboard</NuxtLink>

  <!-- Active state styling -->
  <NuxtLink to="/settings" active-class="text-primary" exact-active-class="font-bold">
    Settings
  </NuxtLink>
</template>
```

**Props:**
- `to` - Route path or route object
- `external` - Force external link behavior
- `target` - Link target (`_blank`, etc.)
- `prefetch` - Enable/disable prefetching (default: true)
- `noPrefetch` - Disable prefetching
- `activeClass` - Class when route matches
- `exactActiveClass` - Class when route exactly matches

**Docs:** https://nuxt.com/docs/api/components/nuxt-link

## NuxtImg

**ALWAYS use `<NuxtImg>` instead of `<img>` for images:**

Requires `@nuxt/image` module (usually pre-installed).

```vue
<template>
  <!-- Basic usage -->
  <NuxtImg src="/images/hero.jpg" alt="Hero image" />

  <!-- Responsive with sizes -->
  <NuxtImg
    src="/images/banner.jpg"
    alt="Banner"
    width="1200"
    height="600"
    sizes="100vw sm:50vw md:400px"
  />

  <!-- Lazy loading (default) -->
  <NuxtImg src="/images/photo.jpg" loading="lazy" alt="Photo" />

  <!-- Eager loading for above-fold -->
  <NuxtImg src="/images/logo.svg" loading="eager" alt="Logo" />

  <!-- With placeholder blur -->
  <NuxtImg src="/images/product.jpg" placeholder alt="Product" />

  <!-- Provider-specific (Cloudinary, etc.) -->
  <NuxtImg provider="cloudinary" src="/folder/image.jpg" width="500" />

  <!-- Format conversion -->
  <NuxtImg src="/images/photo.png" format="webp" alt="Photo" />
</template>
```

**Props:**
- `src` - Image source path
- `alt` - Alt text (required for accessibility)
- `width` / `height` - Dimensions
- `sizes` - Responsive sizes
- `loading` - `lazy` (default) or `eager`
- `placeholder` - Show blur placeholder while loading
- `format` - Force output format (`webp`, `avif`, etc.)
- `quality` - Image quality (1-100)
- `provider` - Image provider (cloudinary, imgix, etc.)

**For art direction, use `<NuxtPicture>` (different sources per breakpoint).**

**Docs:** https://image.nuxt.com/usage/nuxt-img

## NuxtTime

**ALWAYS use `<NuxtTime>` instead of `<time>` or manual formatting:**

```vue
<template>
  <!-- Relative time -->
  <NuxtTime :datetime="post.createdAt" relative />
  <!-- Output: "2 hours ago" -->

  <!-- Absolute with locale -->
  <NuxtTime :datetime="event.date" locale="en-US" />

  <!-- Custom format -->
  <NuxtTime :datetime="date" year="numeric" month="long" day="numeric" />
  <!-- Output: "December 6, 2025" -->

  <!-- Short format -->
  <NuxtTime :datetime="date" month="short" day="numeric" />
  <!-- Output: "Dec 6" -->

  <!-- With time -->
  <NuxtTime :datetime="date" hour="numeric" minute="2-digit" />
</template>
```

**Props:**
- `datetime` - Date string, Date object, or timestamp
- `relative` - Show relative time ("2 hours ago")
- `locale` - Locale for formatting
- `year`, `month`, `day`, `hour`, `minute`, `second` - Intl.DateTimeFormat options

**Docs:** https://nuxt.com/docs/api/components/nuxt-time

## Common Mistakes

| ❌ Wrong | ✅ Right |
|---------|---------|
| `<a href="/about">` | `<NuxtLink to="/about">` |
| `<img src="/photo.jpg">` | `<NuxtImg src="/photo.jpg" alt="...">` |
| `<time>{{ formatDate(date) }}</time>` | `<NuxtTime :datetime="date" />` |
| `formatTimeAgo(date)` in template | `<NuxtTime :datetime="date" relative />` |
| `new Date().toLocaleDateString()` | `<NuxtTime :datetime="date" />` |

## Best Practices

- **NuxtLink for all internal routes** - enables prefetching and client-side navigation
- **NuxtImg for all images** - automatic optimization, lazy loading, responsive
- **NuxtTime for all dates** - SSR-safe, automatic localization
- **Always provide alt text** for images
- **Use `loading="eager"`** for above-the-fold images
- **Use sizes prop** for responsive images

## Resources

- NuxtLink: https://nuxt.com/docs/api/components/nuxt-link
- NuxtImg: https://image.nuxt.com/usage/nuxt-img
- NuxtPicture: https://image.nuxt.com/usage/nuxt-picture
- NuxtTime: https://nuxt.com/docs/api/components/nuxt-time

---

# Nuxt Composables & Utilities

## When to Use

Working with Nuxt-specific composables, URL handling, navigation, or data fetching.

## URL & Request Handling

### useRequestURL()

**ALWAYS use `useRequestURL()` instead of `window.origin` or `window.location`:**

```ts
// ✅ Correct - works SSR + client
const url = useRequestURL()
console.log(url.origin)    // https://example.com
console.log(url.pathname)  // /users/123
console.log(url.search)    // ?tab=profile

// ❌ Wrong - breaks on SSR, not available server-side
const origin = window.origin
const path = window.location.pathname
```

**Why:** `window` is undefined during SSR. `useRequestURL()` works everywhere.

### useRequestURL() Patterns

```ts
// Get full URL
const url = useRequestURL()
const fullUrl = url.href  // https://example.com/users/123?tab=profile

// Get origin (base URL)
const baseUrl = url.origin  // https://example.com

// Get path
const path = url.pathname  // /users/123

// Get query params (use useRoute() instead for better typing)
const params = url.searchParams
const tab = params.get('tab')  // 'profile'

// Build absolute URL
const apiUrl = `${url.origin}/api/users`
```

## Navigation Composables

### navigateTo()

```ts
// Navigate to route
await navigateTo('/about')

// Type-safe navigation
await navigateTo({ name: '/users/[userId]', params: { userId: '123' } })

// External URL
await navigateTo('https://nuxt.com', { external: true })

// Replace history
await navigateTo('/login', { replace: true })

// Open in new tab
await navigateTo('/docs', { open: { target: '_blank' } })

// Server-side redirect
return navigateTo('/login')  // in middleware or server route
```

### useRouter()

```ts
const router = useRouter()

// Navigate
router.push({ name: '/users/[userId]', params: { userId: '123' } })

// Go back
router.back()

// Go forward
router.forward()

// Navigation guards
router.beforeEach((to, from) => {
  // Guard logic
})
```

### useRoute()

```ts
// Generic route
const route = useRoute()

// Typed route (preferred)
const route = useRoute('/users/[userId]')

// Access params
const userId = route.params.userId

// Access query
const tab = route.query.tab

// Access meta
const requiresAuth = route.meta.requiresAuth
```

## Data Fetching

### useFetch()

```ts
// Basic fetch
const { data, error, pending, refresh } = await useFetch('/api/users')

// With params
const { data } = await useFetch('/api/users', {
  query: { page: 1, limit: 10 }
})

// With key for deduplication
const { data } = await useFetch(`/api/users/${userId}`, {
  key: `user-${userId}`
})

// Lazy fetch (doesn't block navigation)
const { data } = await useLazyFetch('/api/users')

// Watch and refetch
const page = ref(1)
const { data } = await useFetch('/api/users', {
  query: { page },
  watch: [page]
})
```

### useAsyncData()

```ts
// Custom async logic
const { data, error, pending, refresh } = await useAsyncData('users', async () => {
  const response = await $fetch('/api/users')
  return response.filter(u => u.active)
})

// Lazy version
const { data } = await useLazyAsyncData('users', async () => {
  return await $fetch('/api/users')
})
```

## State Management

### useState()

```ts
// Create shared state
const counter = useState('counter', () => 0)

// Use in components
counter.value++

// With type
const user = useState<User | null>('user', () => null)
```

## App Context

### useNuxtApp()

```ts
const nuxtApp = useNuxtApp()

// Access provided values
const { $api, $hello } = nuxtApp

// Access hooks
nuxtApp.hook('page:finish', () => {
  console.log('Page loaded')
})

// Access Vue app
nuxtApp.vueApp.use(SomePlugin)
```

### useRuntimeConfig()

```ts
// Access runtime config
const config = useRuntimeConfig()

// Public config (client + server)
const apiBase = config.public.apiBase

// Private config (server only)
const apiSecret = config.apiSecret  // undefined on client
```

## Head Management

### useHead()

```ts
// Set page meta
useHead({
  title: 'User Profile',
  meta: [
    { name: 'description', content: 'View user profile' },
    { property: 'og:title', content: 'User Profile' }
  ],
  link: [
    { rel: 'canonical', href: 'https://example.com/profile' }
  ]
})

// Dynamic values
const user = ref({ name: 'John' })
useHead({
  title: () => `${user.value.name}'s Profile`
})
```

### useSeoMeta()

```ts
// Cleaner SEO meta
useSeoMeta({
  title: 'User Profile',
  description: 'View user profile',
  ogTitle: 'User Profile',
  ogDescription: 'View user profile',
  ogImage: 'https://example.com/image.jpg',
  twitterCard: 'summary_large_image'
})
```

## Best Practices

- **Use useRequestURL()** NOT window.origin/location
- **Type routes** with useRoute('/path/[param]')
- **Use useFetch** for API calls (deduplication, SSR)
- **Key your fetches** for proper caching
- **useState for shared state** across components
- **useSeoMeta** for cleaner SEO tags

## Common Mistakes

| ❌ Wrong | ✅ Right |
|---------|---------|
| `window.origin` | `useRequestURL().origin` |
| `window.location.pathname` | `useRequestURL().pathname` |
| `fetch()` in components | `useFetch()` or `useAsyncData()` |
| `router.push('/path/' + id)` | `router.push({ name: '/path/[id]', params: { id } })` |
| Duplicate fetches | Use `key` parameter |

## Resources

- Nuxt composables: https://nuxt.com/docs/api/composables/use-fetch
- Data fetching: https://nuxt.com/docs/getting-started/data-fetching
- useRequestURL: https://nuxt.com/docs/api/composables/use-request-url
- **For NuxtTime, NuxtLink, NuxtImg:** See nuxt-components.md

---

# Nuxt Configuration

## When to Use

Configuring `nuxt.config.ts`, modules, auto-imports, runtime config, layers.

## Basic Structure

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  devtools: { enabled: true },

  modules: [
    '@nuxtjs/tailwindcss',
    '@pinia/nuxt'
  ],

  runtimeConfig: {
    // Private (server-only)
    apiSecret: process.env.API_SECRET,

    public: {
      // Public (client + server)
      apiBase: process.env.API_BASE || 'http://localhost:3000'
    }
  },

  app: {
    head: {
      title: 'My App',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' }
      ]
    }
  }
})
```

## Runtime Config

Access runtime config in app:

```ts
// Server-side
const config = useRuntimeConfig()
console.log(config.apiSecret) // Available

// Client-side
const config = useRuntimeConfig()
console.log(config.public.apiBase) // Available
console.log(config.apiSecret) // undefined (private)
```

## Auto-Imports

Nuxt auto-imports from these directories:
- `components/` - Vue components
- `composables/` - Composition functions
- `utils/` - Utility functions
- `server/utils/` - Server utilities (server-only)

### Custom Auto-Imports

```ts
export default defineNuxtConfig({
  imports: {
    dirs: [
      'stores',
      'types'
    ]
  }
})
```

### Disable Auto-Import

```ts
export default defineNuxtConfig({
  imports: {
    autoImport: false
  }
})
```

## Modules

```ts
export default defineNuxtConfig({
  modules: [
    '@nuxtjs/tailwindcss',
    '@pinia/nuxt',
    '@vueuse/nuxt',
    ['@nuxtjs/google-fonts', {
      families: {
        Inter: [400, 700]
      }
    }]
  ]
})
```

## App Config

For non-sensitive config exposed to client:

```ts
// app.config.ts
export default defineAppConfig({
  theme: {
    primaryColor: '#3b82f6',
    borderRadius: '0.5rem'
  }
})
```

Access in app:

```ts
const appConfig = useAppConfig()
console.log(appConfig.theme.primaryColor)
```

## TypeScript

```ts
export default defineNuxtConfig({
  typescript: {
    strict: true,
    typeCheck: true,
    shim: false
  }
})
```

## Build Configuration

```ts
export default defineNuxtConfig({
  build: {
    transpile: ['some-package']
  },

  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: '@use "@/assets/styles/variables" as *;'
        }
      }
    }
  }
})
```

## Route Rules

Pre-render, cache, or customize routes:

```ts
export default defineNuxtConfig({
  routeRules: {
    '/': { prerender: true },
    '/api/**': { cors: true },
    '/admin/**': { ssr: false },
    '/blog/**': { swr: 3600 } // Cache for 1 hour
  }
})
```

## Experimental Features

```ts
export default defineNuxtConfig({
  future: {
    compatibilityVersion: 4
  },

  experimental: {
    typedPages: true,
    viewTransition: true
  }
})
```

## Nitro Config

Server engine configuration:

```ts
export default defineNuxtConfig({
  nitro: {
    preset: 'vercel',
    compressPublicAssets: true,
    routeRules: {
      '/api/**': { cors: true }
    }
  }
})
```

## Layers

Extend or share configuration:

```ts
export default defineNuxtConfig({
  extends: [
    './base-layer'
  ]
})
```

## Environment Variables

Use `.env` file:

```env
API_SECRET=secret123
API_BASE=https://api.example.com
```

Access via runtimeConfig:

```ts
export default defineNuxtConfig({
  runtimeConfig: {
    apiSecret: process.env.API_SECRET,
    public: {
      apiBase: process.env.API_BASE
    }
  }
})
```

## Best Practices

- **Use runtimeConfig** for env-specific values
- **Public vs private** - keep secrets in private runtimeConfig
- **App config** for non-sensitive client config
- **Route rules** for performance (prerender, cache, SWR)
- **Auto-imports** for cleaner code
- **TypeScript strict mode** for better DX

## Common Mistakes

| ❌ Wrong | ✅ Right |
|---------|---------|
| Hardcoded API URLs | Use runtimeConfig.public |
| Secrets in app.config | Use runtimeConfig (private) |
| Import everything manually | Let Nuxt auto-import |
| process.env in client code | Use useRuntimeConfig() |

## Resources

- Nuxt config: https://nuxt.com/docs/api/nuxt-config
- Runtime config: https://nuxt.com/docs/guide/going-further/runtime-config
- App config: https://nuxt.com/docs/guide/directory-structure/app-config
- Modules: https://nuxt.com/modules

---

# Project Setup

Standard patterns for new Nuxt projects: CI, ESLint, package scripts.

## CI Workflow

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with: { node-version: 22, cache: pnpm }
      - run: pnpm install --frozen-lockfile
      - run: pnpm prepare
      - run: pnpm lint
      - run: pnpm typecheck
      - run: pnpm test  # if tests exist
```

**With env vars:**
```yaml
env:
  DATABASE_URL: postgresql://test:test@localhost:5432/test
  API_KEY: test
```

## ESLint Config

```js
// eslint.config.mjs
import antfu from '@antfu/eslint-config'
import withNuxt from './.nuxt/eslint.config.mjs'

export default withNuxt(
  antfu({
    formatters: true,
    vue: true,
    pnpm: true,
    ignores: ['.eslintcache', 'cache/**', '.claude/**', 'README.md', 'docs/**'],
  }),
)
```

**For monorepos, add:**
```js
ignores: ['apps/web/.nuxt/**', 'packages/**/dist/**']
```

## Package Scripts

```json
{
  "scripts": {
    "dev": "nuxt dev",
    "build": "nuxt build",
    "preview": "nuxt preview",
    "prepare": "nuxt prepare",
    "lint": "eslint . --cache",
    "lint:fix": "eslint . --fix --cache",
    "typecheck": "nuxt typecheck"
  }
}
```

## Key Conventions

| Convention | Standard |
|------------|----------|
| Package manager | pnpm with `--frozen-lockfile` in CI |
| Node version | 22-24 |
| ESLint base | @antfu/eslint-config |
| Formatter | Via ESLint (`formatters: true`), no separate Prettier |
| Cache | `--cache` flag on lint scripts |
| Prepare step | Required before lint/typecheck in CI |

## NuxtHub Deployment

```yaml
# .github/workflows/nuxthub.yml
name: Deploy to NuxtHub
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    permissions: { contents: read, id-token: write }
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with: { node-version: 22, cache: pnpm }
      - run: pnpm install
      - uses: nuxt-hub/action@v2
        with:
          project-key: your-project-key
```

---

# Nuxt File-Based Routing

## When to Use

Working with `pages/` or `layouts/` directories, file-based routing, navigation.

## File-Based Routing Basics

`pages/` folder structure directly maps to routes. File names determine URLs.

## Naming Conventions

**Key principles:**
- **ALWAYS use groups instead of index:** `(home).vue` NOT `index.vue`
- **ALWAYS use descriptive params:** `[userId].vue` NOT `[id].vue`
- **Use `.` for path segments:** `users.edit.vue` → `/users/edit`
- **Optional params:** `[[paramName]].vue`
- **Catch-all:** `[...path].vue`

## Red Flags - Stop and Check Skill

If you're thinking any of these, STOP and re-read this skill:
- "Index.vue is a standard convention"
- "String paths are simpler than typed routes"
- "Generic param names like [id] are fine"
- "I remember how Nuxt 3 worked"

All of these mean: You're about to use outdated patterns. Use Nuxt 4 patterns instead.

## File Structure Example

```
pages/
├── (home).vue              # / - descriptive group name
├── about.vue               # /about
├── [...slug].vue           # catch-all for 404
├── users.edit.vue          # /users/edit - breaks out of nesting
├── users.vue               # parent route (layout for /users/*)
└── users/
    ├── (list).vue          # /users - group instead of index
    └── [userId].vue        # /users/:userId
```

## Route Groups for Layouts

Groups create shared layouts WITHOUT affecting URL:

```
pages/
├── (admin).vue             # layout component
├── (admin)/
│   ├── dashboard.vue       # /dashboard
│   └── settings.vue        # /settings
└── (marketing)/
    ├── about.vue           # /about
    └── pricing.vue         # /pricing
```

## Parent Routes (Layouts)

Parent route = layout for nested routes:

```vue
<!-- pages/users.vue -->
<template>
  <div class="users-layout">
    <nav>
      <NuxtLink to="/users">All Users</NuxtLink>
      <NuxtLink to="/users/create">Create User</NuxtLink>
    </nav>
    <NuxtPage />
  </div>
</template>
```

Child routes:
```
pages/
├── users.vue           # Parent route with <NuxtPage />
└── users/
    ├── (list).vue      # /users
    ├── [userId].vue    # /users/:userId
    └── create.vue      # /users/create
```

## definePage() for Route Customization

```vue
<script setup lang="ts">
definePage({
  name: 'user-profile',
  path: '/profile/:userId',  // Override default path
  alias: ['/me', '/profile'],
  meta: {
    requiresAuth: true,
    title: 'User Profile',
    roles: ['user', 'admin']
  }
})
</script>

<template>
  <div>Profile content</div>
</template>
```

## Typed Router

**ALWAYS use typed routes for navigation:**

```ts
// ✅ Type-safe with route name
await navigateTo({ name: '/users/[userId]', params: { userId: '123' } })

// ❌ String-based (not type-safe, avoid)
await navigateTo('/users/123')
```

**REQUIRED: Check `typed-router.d.ts` for available route names and params before navigating.**

## useRoute with Types

Pass route name for stricter typing:

```ts
// Generic route
const route = useRoute()

// Typed route (preferred)
const route = useRoute('/users/[userId]')
// route.params.userId is now typed correctly
```

## Navigation

```ts
// Navigate to route
await navigateTo('/about')
await navigateTo({ name: '/users/[userId]', params: { userId: '123' } })

// Navigate with query
await navigateTo({ path: '/search', query: { q: 'nuxt' } })

// External redirect
await navigateTo('https://nuxt.com', { external: true })

// Replace history
await navigateTo('/login', { replace: true })

// Open in new tab
await navigateTo('/docs', { open: { target: '_blank' } })
```

## Route Meta & Middleware

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

## Dynamic Routes Patterns

```
[userId].vue              # /users/123
[[slug]].vue              # /blog or /blog/post (optional)
[...path].vue             # /a/b/c (catch-all)
[[...path]].vue           # / or /a/b/c (optional catch-all)
```

## Breaking Out of Nested Routing

Use `.` to create routes at parent level:

```
pages/
├── users.vue               # /users layout
├── users/
│   └── [userId].vue        # /users/123
└── users.settings.vue      # /users/settings (NOT nested under layout)
```

## Best Practices

- **Use groups `(name).vue`** instead of `index.vue` for clarity
- **Descriptive param names** - `[userId]` not `[id]`, `[postSlug]` not `[slug]`
- **Type-safe navigation** - use route names, not strings
- **Check typed-router.d.ts** for available routes
- **Parent routes for layouts** - `users.vue` with `<NuxtPage />`
- **Use definePage** for custom paths/aliases
- **Catch-all for 404** - `[...path].vue` or `[...slug].vue`

## Common Mistakes

| ❌ Wrong | ✅ Right |
|---------|---------|
| `index.vue` | `(home).vue` or `(list).vue` |
| `[id].vue` | `[userId].vue` or `[postId].vue` |
| `navigateTo('/users/' + id)` | `navigateTo({ name: '/users/[userId]', params: { userId: id } })` |
| `<Nuxt />` | `<NuxtPage />` |
| Separate layouts/ folder | Parent routes with `<NuxtPage />` |

## Resources

- Nuxt routing: https://nuxt.com/docs/guide/directory-structure/pages
- File-based routing: https://nuxt.com/docs/getting-started/routing

---

# Nuxt Server Patterns

## When to Use

Working with `server/` directory - API routes, server middleware, server utilities.

## Server Directory Structure

```
server/
├── api/                    # API endpoints
│   ├── users.get.ts        # GET /api/users
│   ├── users.post.ts       # POST /api/users
│   └── users/
│       └── [id].get.ts     # GET /api/users/:id
├── routes/                 # Non-API routes
│   └── healthz.get.ts      # GET /healthz
├── middleware/             # Server middleware
│   └── log.ts
└── utils/                  # Server utilities (auto-imported)
    └── db.ts
```

## API Routes

File naming determines HTTP method and route:
- `users.get.ts` → GET /api/users
- `users.post.ts` → POST /api/users
- `users/[userId].get.ts` → GET /api/users/:userId
- `users/[userId].delete.ts` → DELETE /api/users/:userId

**REQUIRED: Use descriptive param names:** `[userId].get.ts` NOT `[id].get.ts`

## Red Flags - Stop and Check Skill

If you're thinking any of these, STOP and re-read this skill:
- "I'll use event.context.params like before"
- "Generic [id] is fine for params"
- "Don't need .get.ts suffix"
- "I remember how Nuxt 3 API routes worked"

All of these mean: You're using outdated patterns. Use Nuxt 4 patterns instead.

### Basic API Route

```ts
// server/api/users.get.ts
export default defineEventHandler(async (event) => {
  const users = await fetchUsers()
  return users
})
```

### Route with Params

```ts
// server/api/users/[userId].get.ts
export default defineEventHandler(async (event) => {
  const userId = getRouterParam(event, 'userId')

  if (!userId) {
    throw createError({
      statusCode: 400,
      message: 'User ID is required'
    })
  }

  const user = await fetchUserById(userId)

  if (!user) {
    throw createError({
      statusCode: 404,
      message: 'User not found'
    })
  }

  return user
})
```

### Route with Query Params

```ts
// server/api/users.get.ts
export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  const page = Number(query.page) || 1
  const limit = Number(query.limit) || 10

  const users = await fetchUsers({ page, limit })
  return users
})
```

### Route with Body

```ts
// server/api/users.post.ts
export default defineEventHandler(async (event) => {
  const body = await readBody(event)

  // Validate body
  if (!body.name || !body.email) {
    throw createError({
      statusCode: 400,
      message: 'Missing required fields: name, email'
    })
  }

  const user = await createUser(body)
  setResponseStatus(event, 201)
  return user
})
```

## Error Handling

Use `createError` for HTTP errors:

```ts
throw createError({
  statusCode: 400,
  statusMessage: 'Bad Request',
  message: 'Invalid input',
  data: { field: 'email' } // Optional additional data
})
```

## Server Middleware

Runs on every server request:

```ts
// server/middleware/log.ts
export default defineEventHandler((event) => {
  console.log(`${event.method} ${event.path}`)
})
```

Named middleware for specific patterns:

```ts
// server/middleware/auth.ts
export default defineEventHandler((event) => {
  const token = getRequestHeader(event, 'authorization')

  if (!token) {
    throw createError({
      statusCode: 401,
      message: 'Unauthorized'
    })
  }

  // Attach user to event context
  event.context.user = await verifyToken(token)
})
```

## Server Utils

Reusable server functions (auto-imported):

```ts
// server/utils/db.ts
import { db } from './database'

export async function fetchUsers(options: { page: number; limit: number }) {
  return await db.select().from('users').limit(options.limit).offset((options.page - 1) * options.limit)
}

export async function fetchUserById(id: string) {
  return await db.select().from('users').where({ id }).first()
}
```

Auto-imported in all server routes and middleware.

## Request Helpers

```ts
// Get params
const userId = getRouterParam(event, 'userId')

// Get query
const query = getQuery(event)

// Get body
const body = await readBody(event)

// Get headers
const auth = getRequestHeader(event, 'authorization')

// Get cookies
const token = getCookie(event, 'token')

// Get method
const method = getMethod(event)

// Get IP
const ip = getRequestIP(event)
```

## Response Helpers

```ts
// Set status code
setResponseStatus(event, 201)

// Set headers
setResponseHeader(event, 'X-Custom', 'value')
setResponseHeaders(event, { 'X-Custom': 'value', 'X-Another': 'value' })

// Set cookies
setCookie(event, 'token', 'value', {
  httpOnly: true,
  secure: true,
  sameSite: 'lax',
  maxAge: 60 * 60 * 24 * 7 // 1 week
})

// Redirect
return sendRedirect(event, '/login', 302)

// Stream
return sendStream(event, stream)

// No content
return sendNoContent(event)
```

## Best Practices

- **Use descriptive param names** - `[userId]` not `[id]`
- **Keep routes thin** - delegate to server utils
- **Validate input** at route level
- **Use typed errors** with createError
- **Handle errors gracefully** - don't expose internals
- **Use server utils** for DB/external APIs
- **Don't expose sensitive data** in responses
- **Set proper status codes** - 201 for created, 204 for no content

## Common Mistakes

| ❌ Wrong | ✅ Right |
|---------|---------|
| `event.context.params.id` | `getRouterParam(event, 'id')` |
| `return res.json(data)` | `return data` |
| `[id].get.ts` | `[userId].get.ts` |
| `users-id.get.ts` | `users/[id].get.ts` |
| Throw generic errors | Use createError with status |

## Resources

- Nuxt server: https://nuxt.com/docs/guide/directory-structure/server
- h3 (Nitro engine): https://h3.unjs.io/
- Nitro: https://nitro.unjs.io/
