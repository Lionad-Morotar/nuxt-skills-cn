---
name: nuxt-ui
description: 构建使用 @nuxt/ui v4 组件（按钮、模态框、表单、表格等）的样式化 UI 时使用——提供即用型组件，支持 Tailwind Variants 主题。使用 vue 技能处理原始组件模式，使用 reka-ui 处理无头原语。
license: MIT
---

# Nuxt UI v4

基于 Reka UI（无头）+ Tailwind CSS v4 + Tailwind Variants 构建的 Vue 3 和 Nuxt 4+ 组件库。

**当前稳定版本：** v4.3.0（2025 年 12 月）

## 使用场景

- 安装/配置 @nuxt/ui
- 使用 UI 组件（按钮、卡片、表格、表单等）
- 自定义主题（颜色、变体、CSS 变量）
- 构建带验证的表单
- 使用覆盖层（模态框、吐司、命令面板）
- 使用组合式函数（useToast、useOverlay）

**对于 Vue 组件模式：** 使用 `vue` 技能  
**对于 Nuxt 路由/服务器：** 使用 `nuxt` 技能

## 可用指导

| 文件                                                         | 主题                                                                           |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| **[references/installation.md](references/installation.md)** | Nuxt/Vue 设置、pnpm 注意事项、UApp 包装器、模块选项、前缀、树摇                   |
| **[references/theming.md](references/theming.md)**           | 语义颜色、CSS 变量、app.config.ts、Tailwind Variants                             |
| **[references/components.md](references/components.md)**     | 按类别组织的组件索引（125+ 个组件）                                               |
| **components/\*.md**                                         | 各组件详情（button.md、modal.md 等）                                               |
| **[references/forms.md](references/forms.md)**               | 表单组件、验证（Zod/Valibot）、useFormField                                       |
| **[references/overlays.md](references/overlays.md)**         | 吐司、模态框、滑动面板、抽屉、命令面板                                             |
| **[references/composables.md](references/composables.md)**   | useToast、useOverlay、defineShortcuts、useScrollspy                              |

## 使用模式

**根据上下文加载：**

- 安装 Nuxt UI？→ [references/installation.md](references/installation.md)  
- 自定义主题？→ [references/theming.md](references/theming.md)  
- 组件索引 → [references/components.md](references/components.md)  
- 特定组件 → [components/button.md](components/button.md)、[components/modal.md](components/modal.md) 等  
- 构建表单？→ [references/forms.md](references/forms.md)  
- 使用覆盖层？→ [references/overlays.md](references/overlays.md)  
- 使用组合式函数？→ [references/composables.md](references/composables.md)

**不要一次性阅读所有文件。** 根据上下文加载。

## 核心概念

| 概念              | 描述                                                     |
| ----------------- | -------------------------------------------------------- |
| UApp              | 吐司、工具提示、覆盖层所需的包装组件                      |
| Tailwind Variants | 支持插槽、变体、复合变体的类型安全样式                   |
| 语义颜色          | primary、secondary、success、error、warning、info、neutral |
| Reka UI           | 无头组件原语（内置可访问性）                              |

> 对于无头组件原语（API 详情、可访问性模式、asChild）：请阅读 **reka-ui** 技能

## 快速参考

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxt/ui'],
  css: ['~/assets/css/main.css']
})
```

```css
/* assets/css/main.css */
@import 'tailwindcss';
@import '@nuxt/ui';
```

```vue
<!-- app.vue - 必须使用 UApp 包装 -->
<template>
  <UApp>
    <NuxtPage />
  </UApp>
</template>
```

## 资源

- [Nuxt UI 文档](https://ui.nuxt.com)
- [组件参考](https://ui.nuxt.com/components)
- [主题定制](https://ui.nuxt.com/getting-started/theme)

---

_令牌效率：主技能约 300 个令牌，每个子文件约 800–1200 个令牌_
