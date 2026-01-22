# NuxtStudio 与预览模式

## 使用场景

设置 NuxtStudio 集成、启用预览模式或配置实时内容编辑。

## NuxtStudio 概述

NuxtStudio 是用于 Nuxt Content 网站的可视化编辑器。它提供：

- 可视化所见即所得编辑
- 实时预览
- 基于 Git 的工作流
- 组件编辑

## 启用 Studio

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxt/content'],
  content: {
    studio: {
      enabled: true,
    },
  },
})
```

## 预览模式

预览模式允许在发布前编辑内容。

### 开发环境预览

开发环境中，通过 WebSocket HMR 自动更新内容。

### 生产环境预览

启用生产环境预览 API：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    preview: {
      enabled: true,
      // 可选：自定义 API 路由
      api: '/__preview',
    },
  },
})
```

### 预览令牌

使用令牌保护预览模式：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    preview: {
      enabled: true,
      token: process.env.PREVIEW_TOKEN,
    },
  },
})
```

访问预览：`https://your-site.com?preview=your-token`

## 在组件中使用预览

```vue
<script setup lang="ts">
const { enabled: previewEnabled } = useContentPreview()
</script>

<template>
  <div v-if="previewEnabled" class="preview-banner">
    预览模式已激活
  </div>
</template>
```

## 预览 API 路由

内容暴露预览端点：

```
POST /__preview/start   - 启动预览会话
POST /__preview/stop    - 结束预览会话
GET  /__preview/status  - 检查预览状态
```

## Git 集成

Studio 使用 Git 进行版本控制：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    studio: {
      enabled: true,
      git: {
        // 预览更改的分支
        branch: 'content-preview',
      },
    },
  },
})
```

## Studio 编辑器的模式

在你的模式中添加编辑提示：

```ts
// content.config.ts
import { defineCollection, defineContentConfig } from '@nuxt/content'
import { z } from 'zod'

export default defineContentConfig({
  collections: {
    blog: defineCollection({
      type: 'page',
      source: 'blog/**/*.md',
      schema: z.object({
        title: z.string().describe('文章标题'),
        description: z.string().describe('SEO 描述'),
        image: z.string().describe('封面图片 URL'),
        date: z.date().describe('发布日期'),
        tags: z.array(z.string()).describe('文章标签'),
      }),
    }),
  },
})
```

`.describe()` 方法会在 Studio 的编辑器界面中添加标签。

## Studio 配置

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    studio: {
      enabled: true,
      // 自定义 Studio URL（用于自托管）
      url: 'https://studio.nuxt.com',
    },
  },
})
```

## 实时编辑组件

在 Studio 中标记组件为可编辑：

```vue
<!-- components/content/Hero.vue -->
<template>
  <div data-content-id="hero" class="hero">
    <h1>{{ title }}</h1>
    <p>{{ description }}</p>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  title: string
  description: string
}>()
</script>
```

## 环境设置

```bash
# .env
NUXT_CONTENT_STUDIO_ENABLED=true
NUXT_CONTENT_PREVIEW_ENABLED=true
NUXT_CONTENT_PREVIEW_TOKEN=your-secret-token
```

## WebSocket HMR（开发环境）

内容在开发环境中自动同步更改：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    watch: {
      // 监听文件更改
      enabled: true,
      // 延迟更新
      debounce: 500,
    },
  },
})
```

## 部署注意事项

### Vercel

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    studio: {
      enabled: process.env.VERCEL_ENV === 'preview',
    },
  },
})
```

### Cloudflare Pages

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  content: {
    studio: {
      enabled: process.env.CF_PAGES_BRANCH !== 'main',
    },
  },
})
```

## 常见模式

**预览横幅组件：**

```vue
<!-- components/PreviewBanner.vue -->
<script setup lang="ts">
const { enabled } = useContentPreview()
</script>

<template>
  <div v-if="enabled" class="fixed top-0 left-0 right-0 bg-yellow-500 text-center py-1 z-50">
    预览模式 - <button @click="navigateTo(useRoute().fullPath.replace('?preview', ''))">退出</button>
  </div>
</template>
```

**条件预览逻辑：**

```ts
const { enabled } = useContentPreview()

const posts = await queryCollection('blog')
  .where('draft', '=', enabled ? undefined : false) // 预览中显示草稿
  .all()
```

## 最佳实践

| 做法                                | 不应做的                   |
| ----------------------------------- | -------------------------- |
| 在生产环境中使用预览令牌            | 不加认证暴露预览           |
| 仅在预览环境中启用 Studio          | 在生产中启用 Studio        |
| 使用 `.describe()` 为模式字段添加说明 | 不记录模式文档             |
| 部署前测试预览模式                | 假设一切正常               |

## 资源

- NuxtStudio: https://nuxt.studio
- 预览模式: https://content.nuxt.com/docs/studio/preview
- Studio 设置: https://content.nuxt.com/docs/studio/setup
