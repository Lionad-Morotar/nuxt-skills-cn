---
name: nuxt
description: 用于 Nuxt 4+ 项目开发——提供服务器路由、基于文件的路由、中间件模式、Nuxt 特定的组合式函数及最新文档中的配置。涵盖 h3 v1 辅助工具（验证、WebSocket、SSE）和 nitropack v2 模式。
license: MIT
---

# Nuxt 4+ 开发

面向 Nuxt 4+ 项目的渐进式指导，包含最新的模式与规范。

## 使用场景

适用于以下工作内容：

- 服务器路由（API 端点、服务器中间件、服务器工具）
- 基于文件的路由（页面、布局、路由组）
- Nuxt 中间件（路由守卫、导航）
- Nuxt 插件（应用扩展）
- Nuxt 特有功能（自动导入、层、模块）

## 可用指导

根据当前工作内容阅读特定文件：

- **[references/server.md](references/server.md)** - API 路由、服务器中间件、验证（Zod）、WebSocket、SSE
- **[references/routing.md](references/routing.md)** - 基于文件的路由、路由组、类型化路由器、definePage
- **[references/middleware-plugins.md](references/middleware-plugins.md)** - 路由中间件、插件、应用生命周期
- **[references/nuxt-composables.md](references/nuxt-composables.md)** - Nuxt 组合式函数（useRequestURL、useFetch、导航）
- **[references/nuxt-components.md](references/nuxt-components.md)** - NuxtLink、NuxtImg、NuxtTime（优先使用，而非 HTML 元素）
- **[references/nuxt-config.md](references/nuxt-config.md)** - 配置、模块、自动导入、层

**对于 Vue 组合式函数：** 请查阅 `vue` 技能下的 composables.md（VueUse、组合式 API 模式）  
**对于 UI 组件：** 使用 `nuxt-ui` 技能  
**对于数据库/存储：** 使用 `nuxthub` 技能  
**对于内容驱动网站：** 使用 `nuxt-content` 技能  
**创建模块时：** 使用 `nuxt-modules` 技能  
**项目脚手架/CI：** 使用 `personal-ts-setup` 技能  

## 使用模式

**渐进式加载——仅读取所需内容：**

- 创建 API 端点？→ [references/server.md](references/server.md)  
- 设置页面/路由？→ [references/routing.md](references/routing.md)  
- 使用组合式函数/数据获取？→ [references/nuxt-composables.md](references/nuxt-composables.md)  
- 添加中间件/插件？→ [references/middleware-plugins.md](references/middleware-plugins.md)  
- 配置 Nuxt？→ [references/nuxt-config.md](references/nuxt-config.md)  
- 设置 CI/ESLint？→ [references/project-setup.md](references/project-setup.md)

**请勿一次性阅读所有文件。** 根据上下文加载相关文件：

- 在 `server/` 中工作 → 阅读 server.md  
- 在 `pages/` 或 `layouts/` 中工作 → 阅读 routing.md  
- 使用 `useFetch`、`useRequestURL`、导航 → 阅读 nuxt-composables.md  
- 使用 `<a>`、`<img>`、`<time>` 元素 → 阅读 nuxt-components.md  
- 在 `middleware/` 或 `plugins/` 中工作 → 阅读 middleware-plugins.md  
- 编辑 `nuxt.config.ts` → 阅读 nuxt-config.md  

## Nuxt 4 与旧版本的区别

**你正在使用 Nuxt 4+。** 主要差异如下：

| 旧版（Nuxt 2/3）         | 新版（Nuxt 4）                    |
| ------------------------ | --------------------------------- |
| `<Nuxt />`               | `<NuxtPage />`                    |
| `context.params`         | `getRouterParam(event, 'name')`   |
| `window.origin`          | `useRequestURL().origin`          |
| 字符串路由               | 类型化路由器，带路由名称          |
| 分离的布局                | 父级路由配合 `<slot>`             |

**如对 Nuxt 4 模式存疑，请优先阅读相关指导文件。**

## 最新文档

**何时获取最新文档：**

- 本指南未涵盖的新 Nuxt 4 功能  
- 模块特定配置  
- 破坏性变更或弃用项  
- 高级使用场景  

**官方来源：**

- Nuxt：https://nuxt.com/docs  
- h3（服务器引擎）：https://v1.h3.dev/  
- Nitro：https://nitro.build  

## 令牌效率

主技能：约 300 个令牌。每个子文件：约 800–1500 个令牌。仅加载当前任务相关的文件。
