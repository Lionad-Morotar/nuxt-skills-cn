# 安装

## Nuxt 安装

```bash
pnpm add @nuxt/ui
```

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

**关键**：为使 Toast、Tooltip 和叠加层正常工作，请将应用程序包装在 UApp 中：

```vue
<!-- app.vue -->
<template>
  <UApp>
    <NuxtPage />
  </UApp>
</template>
```

### pnpm 注意事项

如果使用 pnpm，请执行以下操作之一：

1. 在 `.npmrc` 中添加 `shamefully-hoist=true`，或
2. 显式安装 tailwindcss：`pnpm add tailwindcss`

## Vue 安装（Vite）

```bash
pnpm add @nuxt/ui
```

```ts
import ui from '@nuxt/ui/vite'
import vue from '@vitejs/plugin-vue'
// vite.config.ts
import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [vue(), ui()]
})
```

```ts
import ui from '@nuxt/ui/vue-plugin'
// main.ts
import { createApp } from 'vue'
import App from './App.vue'
import './assets/main.css'

const app = createApp(App)
app.use(ui)
app.mount('#app')
```

```css
/* assets/main.css */
@import 'tailwindcss';
@import '@nuxt/ui';
```

**关键**：为叠加层堆叠添加 `isolate` 类到根元素：

```vue
<!-- App.vue -->
<template>
  <div class="isolate">
    <UApp>
      <RouterView />
    </UApp>
  </div>
</template>
```

### 自动导入

Vue 会生成 `auto-imports.d.ts` 和 `components.d.ts`。请将其添加到 `.gitignore`：

```gitignore
auto-imports.d.ts
components.d.ts
```

## 模块选项

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxt/ui'],
  ui: {
    prefix: 'U', // 组件前缀（默认为 'U'）
    fonts: true, // 启用 @nuxt/fonts
    colorMode: true, // 启用 @nuxtjs/color-mode
    theme: {
      colors: ['primary', 'secondary', 'success', 'info', 'warning', 'error', 'neutral'],
      transitions: true, // 组件上的 transition-colors
      defaultVariants: {
        color: 'primary',
        size: 'md'
      },
      prefix: '' // Tailwind CSS 前缀（v4.2+）——确保带前缀的工具类正常工作
    },
    mdc: false, // 强制 Prose 组件
    content: false, // 强制 UContent* 组件
    experimental: {
      componentDetection: false // 树摇未使用的组件（v4.1+）——仅自动生成已使用组件的 CSS
    }
  }
})
```

## Vue Vite 选项

```ts
// vite.config.ts
ui({
  prefix: 'U',
  colorMode: true,
  inertia: true, // Inertia.js 支持
  theme: {
    colors: ['primary', 'secondary', 'success', 'info', 'warning', 'error', 'neutral'],
    transitions: true,
    defaultVariants: { color: 'primary', size: 'md' },
    prefix: ''
  },
  ui: {
    colors: { primary: 'green' }, // 运行时颜色配置
    button: { /* 主题覆盖 */ }
  }
})
```

## 自动安装的模块

Nuxt UI 自动安装：

- `@nuxt/icon` - 图标系统
- `@nuxt/fonts` - 网络字体（如果 `fonts: true`）
- `@nuxtjs/color-mode` - 深色模式（如果 `colorMode: true`）

## 常见问题

| 问题                     | 解决方案                                           |
| ------------------------- | -------------------------------------------------- |
| Tailwind 未找到（pnpm）   | 添加 `shamefully-hoist=true` 或安装 tailwindcss |
| 叠加层不显示              | 将应用程序包装在 `<UApp>` 中                       |
| Vue 叠加层出错            | 将 `isolate` 类添加到根元素                        |
| 图标未加载                | 检查是否安装了 @nuxt/icon                          |
| 深色模式未工作            | 确保在配置中启用了 `colorMode: true`              |

## 性能特性（v4.1+）

### 组件虚拟化

CommandPalette、InputMenu、SelectMenu、Table 和 Tree 中的大数据集自动使用虚拟化以提升性能。

### 实验性组件检测

启用 `experimental.componentDetection` 以仅自动生成实际使用的组件的 CSS：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  ui: {
    experimental: {
      componentDetection: true
    }
  }
})
```

**优势**：更小的 CSS 包、更快的构建速度、减少未使用的样式。

### Tailwind CSS 前缀支持（v4.2+）

在复杂应用程序中避免样式冲突：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  ui: {
    theme: {
      prefix: 'ui-' // 为所有 Tailwind 工具类添加前缀
    }
  }
})
```

**结果**：组件使用 `ui-bg-primary` 而非 `bg-primary`。

## 最佳实践

| 应该                       | 不应该                    |
| -------------------------- | ------------------------- |
| 首先包装在 UApp 中         | 忘记 UApp 包装符          |
| 使用语义化颜色             | 硬编码颜色值              |
| 正确导入 CSS               | 跳过 @nuxt/ui 的导入       |
| 检查 pnpm 提升             | 忽略 tailwindcss 错误     |
| 使用组件检测               | 发送未使用的组件 CSS      |
| 在复杂应用程序中使用前缀   | 风险样式冲突              |
