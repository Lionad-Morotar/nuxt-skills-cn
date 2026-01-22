# Nuxt 配置

## 使用场景

配置 `nuxt.config.ts`、模块、自动导入、运行时配置、层。

## 基本结构

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  devtools: { enabled: true },

  modules: [
    '@nuxtjs/tailwindcss',
    '@pinia/nuxt'
  ],

  runtimeConfig: {
    // 私有（仅服务器）
    apiSecret: process.env.API_SECRET,

    public: {
      // 公开（客户端 + 服务器）
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

## 运行时配置

在应用程序中访问运行时配置：

```ts
// 服务端
const config = useRuntimeConfig()
console.log(config.apiSecret) // 可用

// 客户端
const config = useRuntimeConfig()
console.log(config.public.apiBase) // 可用
console.log(config.apiSecret) // undefined（私有）
```

### 运行时配置验证（推荐）

使用 `nuxt-safe-runtime-config` 实现类型安全的运行时配置，带有构建时验证：

```bash
npx nuxi module add nuxt-safe-runtime-config
```

**优势：**

- 构建时验证（提前捕获缺失的环境变量）
- 可选的运行时验证（在服务器启动时验证）
- 自动生成类型（无需手动定义类型）
- 无需手动环境变量检查（模式处理验证）

**使用 Valibot 的示例：**

```ts
import { number, object, optional, string } from 'valibot'

export default defineNuxtConfig({
  modules: ['nuxt-safe-runtime-config'],

  runtimeConfig: {
    databaseUrl: process.env.DATABASE_URL,
    secretKey: process.env.SECRET_KEY,
    port: Number.parseInt(process.env.PORT || '3000'),
    public: {
      apiBase: process.env.PUBLIC_API_BASE,
      appName: 'My App',
    },
  },

  safeRuntimeConfig: {
    $schema: object({
      public: object({
        apiBase: string(),
        appName: optional(string()),
      }),
      databaseUrl: string(),
      secretKey: string(),
      port: optional(number()),
    }),
    validateAtRuntime: true, // 可选：在服务器启动时验证
  },
})
```

**用法：**

```ts
// 从模式自动生成类型 —— 无需泛型
const config = useSafeRuntimeConfig()
// config.public.apiBase 是 string
// config.databaseUrl 是 string
```

**无需手动环境变量检查：**

```ts
// ❌ 使用 nuxt-safe-runtime-config 不应如此操作
if (!config.databaseUrl) throw new Error('Missing DATABASE_URL')

// ✅ 模式验证自动处理
// 若环境变量缺失，构建将失败并显示详细错误信息
```

支持 Zod、ArkType 或任何标准模式库。参见：https://github.com/onmax/nuxt-safe-runtime-config

## 自动导入

Nuxt 从以下目录自动导入：

- `components/` — Vue 组件
- `composables/` — 组合函数
- `utils/` — 工具函数
- `server/utils/` — 服务器工具（仅限服务器）

### 自定义自动导入

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

### 禁用自动导入

```ts
export default defineNuxtConfig({
  imports: {
    autoImport: false
  }
})
```

## 模块

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

## 应用配置

用于暴露给客户端的非敏感配置：

```ts
// app.config.ts
export default defineAppConfig({
  theme: {
    primaryColor: '#3b82f6',
    borderRadius: '0.5rem'
  }
})
```

在应用中访问：

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

## 构建配置

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

## 路由规则

预渲染、缓存或自定义路由：

```ts
export default defineNuxtConfig({
  routeRules: {
    '/': { prerender: true },
    '/api/**': { cors: true },
    '/admin/**': { ssr: false },
    '/blog/**': { swr: 3600 } // 缓存一小时
  }
})
```

## 实验性功能

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

## Nitro 配置

服务器引擎配置：

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

## 层

扩展或共享配置：

```ts
export default defineNuxtConfig({
  extends: [
    './base-layer'
  ]
})
```

## 环境变量

使用 `.env` 文件：

```env
API_SECRET=secret123
API_BASE=https://api.example.com
```

通过运行时配置访问：

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

## 最佳实践

- **使用 nuxt-safe-runtime-config** 进行带验证的运行时配置
- **公开与私有** — 将密钥保留在私有运行时配置中
- **应用配置** 用于非敏感的客户端配置
- **路由规则** 提升性能（预渲染、缓存、SWR）
- **自动导入** 使代码更整洁
- **TypeScript 严格模式** 提升开发体验

## 常见错误

| ❌ 错误                     | ✅ 正确                      |
| -------------------------- | ---------------------------- |
| 硬编码 API URL             | 使用 runtimeConfig.public    |
| 密钥在 app.config 中       | 使用 runtimeConfig（私有）   |
| 手动导入所有内容           | 让 Nuxt 自动导入             |
| 在客户端代码中使用 process.env | 使用 useRuntimeConfig()      |
| 手动验证环境变量           | 使用 nuxt-safe-runtime-config |
| if (!config.x) throw error | 模式验证自动处理             |

## 资源

- Nuxt 配置：https://nuxt.com/docs/api/nuxt-config
- 运行时配置：https://nuxt.com/docs/guide/going-further/runtime-config
- 应用配置：https://nuxt.com/docs/guide/directory-structure/app-config
- 模块：https://nuxt.com/modules
