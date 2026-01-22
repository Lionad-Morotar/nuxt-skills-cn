# 模块开发

模块结构、Kit 工具与通用模式。

## defineNuxtModule

```ts
import { addPlugin, createResolver, defineNuxtModule } from '@nuxt/kit'

export interface ModuleOptions {
  apiKey?: string
  prefix?: string
}

export default defineNuxtModule<ModuleOptions>({
  meta: {
    name: '@nuxtjs/example',
    configKey: 'example',
    compatibility: { nuxt: '>=3.0.0' }
  },
  defaults: {
    apiKey: '',
    prefix: 'My'
  },
  hooks: {
    'app:error': err => console.error(err)
  },
  moduleDependencies: {
    '@nuxtjs/tailwindcss': { version: '>=6.0.0', optional: true }
  },
  // 或作为异步函数（Nuxt 4.3+）
  async moduleDependencies(nuxt) {
    const needsSupport = nuxt.options.runtimeConfig.public?.feature
    return {
      '@nuxtjs/tailwindcss': needsSupport ? {} : { optional: true }
    }
  },
  setup(options, nuxt) {
    const { resolve } = createResolver(import.meta.url)
    addPlugin(resolve('./runtime/plugin'))
  }
})
```

用户通过 `configKey` 配置：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxtjs/example'],
  example: { apiKey: 'xxx' }
})
```

## 关键：已发布模块中的 #imports

自动导入在 `node_modules` 中不生效。运行时文件必须显式导入：

```ts
// src/runtime/composables/useMyFeature.ts

// 错误 —— 在已发布的模块中不会生效
// 正确 —— 显式导入
import { useRoute } from '#imports'

const route = useRoute()
const route = useRoute()
```

## 添加插件

```ts
import { addPlugin, createResolver, defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  setup(options, nuxt) {
    const { resolve } = createResolver(import.meta.url)
    addPlugin(resolve('./runtime/plugin'))
  }
})
```

```ts
// src/runtime/plugin.ts
import { defineNuxtPlugin } from '#imports'

export default defineNuxtPlugin((nuxtApp) => {
  return {
    provide: { myHelper: (msg: string) => console.log(msg) }
  }
})
```

**异步插件（Nuxt 4.3+）：** 延迟加载构建插件：

```ts
import { addVitePlugin, addWebpackPlugin } from '@nuxt/kit'

export default defineNuxtModule({
  async setup() {
    // 只延迟加载需要的打包插件
    addVitePlugin(() => import('my-plugin/vite').then(r => r.default()))
    addWebpackPlugin(() => import('my-plugin/webpack').then(r => r.default()))
  }
})
```

## 添加组件

```ts
import { addComponent, addComponentsDir, createResolver, defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  setup(options, nuxt) {
    const { resolve } = createResolver(import.meta.url)

    // 单个组件
    addComponent({
      name: 'MyButton',
      filePath: resolve('./runtime/components/MyButton.vue')
    })

    // 或整个目录并加前缀
    addComponentsDir({
      path: resolve('./runtime/components'),
      prefix: 'My' // <MyButton>, <MyCard>
    })
  }
})
```

## 添加组合函数

```ts
import { addImports, addImportsDir, createResolver, defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  setup(options, nuxt) {
    const { resolve } = createResolver(import.meta.url)

    // 单个或多个
    addImports([
      { name: 'useAuth', from: resolve('./runtime/composables/useAuth') },
      { name: 'useUser', from: resolve('./runtime/composables/useUser') }
    ])

    // 或整个目录
    addImportsDir(resolve('./runtime/composables'))
  }
})
```

## 添加服务端路由

```ts
import { addServerHandler, createResolver, defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  setup(options, nuxt) {
    const { resolve } = createResolver(import.meta.url)

    addServerHandler({
      route: '/api/_my-module/status',
      handler: resolve('./runtime/server/api/status.get')
    })
  }
})
```

**始终为路由加前缀：** `/api/_my-module/` 避免冲突。

**服务端导入（Nuxt 4.3+）：** 在服务端文件中使用 `#server` 别名：

```ts
// runtime/server/api/users.ts
import { helper } from '#server/utils/helper'  // 清晰导入
```

## 运行时配置

```ts
export default defineNuxtModule({
  setup(options, nuxt) {
    // 公开（客户端 + 服务端）
    nuxt.options.runtimeConfig.public.myModule = { apiUrl: options.apiUrl }

    // 私有（仅服务端）
    nuxt.options.runtimeConfig.myModule = { apiKey: options.apiKey }
  }
})
```

## 生命周期钩子

```ts
export default defineNuxtModule({
  hooks: {
    'pages:extend': (pages) => {
      pages.push({ name: 'custom', path: '/custom', file: resolve('./runtime/pages/custom.vue') })
    }
  },
  setup(options, nuxt) {
    nuxt.hook('nitro:config', (nitroConfig) => {
      nitroConfig.prerender ||= {}
      nitroConfig.prerender.routes ||= []
      nitroConfig.prerender.routes.push('/my-route')
    })

    // 关闭时清理
    nuxt.hook('close', async () => {
      await cleanup()
    })
  }
})
```

| 钩子           | 时间               |
| -------------- | ------------------ |
| `ready`        | Nuxt 初始化完成    |
| `modules:done` | 所有模块加载完成   |
| `pages:extend` | 修改页面数组       |
| `nitro:config` | 配置 Nitro         |
| `close`        | Nuxt 关闭时        |

## 自定义钩子

```ts
export interface ModuleHooks {
  'my-module:init': (config: MyConfig) => void
}

declare module '#app' {
  interface RuntimeNuxtHooks extends ModuleHooks {}
}

export default defineNuxtModule({
  setup(options, nuxt) {
    nuxt.hook('modules:done', async () => {
      await nuxt.callHook('my-module:init', { foo: 'bar' })
    })
  }
})
```

## 虚拟文件（模板）

```ts
import { addTemplate, defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  setup(options, nuxt) {
    addTemplate({
      filename: 'my-module/config.mjs',
      getContents: () => `export const config = ${JSON.stringify(options)}`
    })
  }
})
```

导入：`import { config } from '#build/my-module/config.mjs'`

## 类型声明

```ts
import { addTypeTemplate, defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  setup(options, nuxt) {
    addTypeTemplate({
      filename: 'types/my-module.d.ts',
      getContents: () => `
        declare module '#app' {
          interface NuxtApp { $myHelper: (msg: string) => void }
        }
        export {}
      `
    })
  }
})
```

## 日志与错误

使用 `consola.withTag` 实现一致的模块日志：

```ts
import { consola } from 'consola'

const logger = consola.withTag('my-module')

export default defineNuxtModule({
  setup(options, nuxt) {
    logger.info('初始化中...')
    logger.warn('使用了已弃用的选项')

    // 错误必须手动包含标签 —— consola 不会自动添加
    if (!options.apiKey) {
      throw new Error('[my-module] `apiKey` 选项是必需的')
    }
  }
})
```

## 禁用模块

**设置为 `false` 可禁用（Nuxt 4.3+）：**

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxtjs/tailwindcss'],
  tailwindcss: false  // 禁用模块
})
```

**禁用继承的层模块：**

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  extends: ['../base-layer'],
  disabledModules: ['@nuxt/image', '@sentry/nuxt/module']
})
```

仅对来自层的模块有效，不适用于根项目模块。

## 本地模块

用于项目特定模块：

```ts
// modules/my-local-module/index.ts
import { defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  meta: { name: 'my-local-module' },
  setup(options, nuxt) {
    // 模块逻辑
  }
})
```

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['./modules/my-local-module']
})
```

## 快速参考

| 任务             | Kit 函数                            |
| ---------------- | ----------------------------------- |
| 添加插件         | `addPlugin()`                       |
| 添加组件         | `addComponent()` / `addComponentsDir()` |
| 添加组合函数     | `addImports()` / `addImportsDir()`  |
| 添加服务端路由   | `addServerHandler()`                |
| 添加服务端工具   | `addServerImports()`                |
| 虚拟文件         | `addTemplate()` / `addServerTemplate()` |
| 添加类型         | `addTypeTemplate()`                 |
| 添加 CSS         | `nuxt.options.css.push()`           |

## 资源

- [Nuxt Kit](https://nuxt.com/docs/api/kit)
- [钩子](https://nuxt.com/docs/api/advanced/hooks)
