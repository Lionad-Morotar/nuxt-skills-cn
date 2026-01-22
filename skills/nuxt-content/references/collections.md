# 合集

## 使用时机

设置 `content.config.ts`、定义合集模式或配置内容源。

## 定义合集

```ts
// content.config.ts
import { defineCollection, defineContentConfig } from '@nuxt/content'
import { z } from 'zod'  // 直接从 'zod' 导入 z（而非从 @nuxt/content）

export default defineContentConfig({
  collections: {
    blog: defineCollection({
      type: 'page',
      source: 'blog/**/*.md',
      schema: z.object({
        date: z.date(),
        tags: z.array(z.string()).optional(),
        image: z.string().optional(),
      }),
    }),
    authors: defineCollection({
      type: 'data',
      source: 'authors/*.yml',
      schema: z.object({
        name: z.string(),
        avatar: z.string(),
        twitter: z.string().optional(),
      }),
    }),
  },
})
```

**注意：** 在 v3.7.0 及更高版本中，`@nuxt/content` 中的 `z` 重新导出已被弃用。请始终直接从 `zod` 导入。

## 合集类型

| 类型   | 用例                 | 包含内容                                                    |
| ------ | -------------------- | ----------------------------------------------------------- |
| `page` | 具有路由的内容       | `path`、`title`、`description`、`seo`、`body`、`navigation` |
| `data` | 仅结构化数据         | `id`、`stem`、`extension`、`meta`                           |

**页面合集** 自动生成：`path` 来自文件位置，`title` 来自第一个 H1，`description` 来自第一段。

**数据合集** 用于非路由内容，如作者、设置、翻译等。

## 模式定义

使用 Zod（或 v3.7+ 中的其他验证器如 Valibot）实现类型安全的模式：

```ts
// 使用 Zod
import { z } from 'zod'

schema: z.object({
  // 必填字段
  title: z.string(),

  // 可选字段并设置默认值
  draft: z.boolean().default(false),

  // 数组
  tags: z.array(z.string()).optional(),

  // 日期（从 frontmatter 解析）
  publishedAt: z.date(),

  // 枚举
  status: z.enum(['draft', 'published', 'archived']),

  // 嵌套对象
  author: z.object({
    name: z.string(),
    email: z.string().email(),
  }).optional(),
})
```

**多验证器支持（v3.7+）：** Nuxt Content 支持多种模式验证器，包括 Zod v4 和 Valibot，可通过标准模式规范使用。请直接导入您首选的验证器。

## 源模式

```ts
// 单一目录
source: 'blog/**/*.md'

// 多种模式
source: ['posts/**/*.md', 'articles/**/*.md']

// 排除模式
source: {
  include: 'docs/**/*.md',
  exclude: ['docs/internal/**', 'docs/**/_*.md'],
}

// 单个 CSV 文件（v3.10+）
source: 'data/products.csv'
```

## 远程源（GitHub）

从外部仓库提取内容：

```ts
export default defineContentConfig({
  collections: {
    nuxtDocs: defineCollection({
      type: 'page',
      source: {
        repository: 'https://github.com/nuxt/content',
        include: 'docs/content/**',
        prefix: '/docs',
        // 可选：浅克隆以加快获取速度（v3.10+）
        shallow: true,
      },
    }),
  },
})
```

**私有仓库：**

```ts
source: {
  repository: 'https://github.com/org/private-repo',
  include: 'docs/**/*.md',
  authToken: process.env.GITHUB_TOKEN, // GitHub PAT
}
```

**Bitbucket 基本认证：**

```ts
source: {
  repository: 'https://bitbucket.org/org/repo',
  include: '**/*.md',
  authBasic: { username: 'user', password: process.env.BITBUCKET_PASSWORD },
}
```

## 自定义 API 源

使用 `defineCollectionSource` 从任何 API 获取内容：

```ts
import { defineCollection, defineCollectionSource, defineContentConfig } from '@nuxt/content'
import { z } from 'zod'

const apiSource = defineCollectionSource({
  getKeys: async () => {
    const items = await fetch('https://api.example.com/posts').then(r => r.json())
    return items.map((item: { id: string }) => `${item.id}.json`)
  },
  getItem: async (key: string) => {
    const id = key.replace('.json', '')
    return fetch(`https://api.example.com/posts/${id}`).then(r => r.json())
  },
})

export default defineContentConfig({
  collections: {
    posts: defineCollection({
      type: 'data',
      source: apiSource,
      schema: z.object({
        title: z.string(),
        content: z.string(),
      }),
    }),
  },
})
```

## 路径提取

文件路径成为内容属性：

```
content/blog/2024/my-post.md
         └─────┬────┘
              stem: "blog/2024/my-post"
              path: "/blog/2024/my-post"
```

在 frontmatter 中覆盖路径：

```yaml
---
path: /custom-url
---
```

## 导航元数据

控制每文件的导航行为：

```yaml
---
navigation:
  title: 短导航标题
  icon: heroicons:home
---
```

或在目录中使用 `.navigation.yml`：

```yaml
# content/blog/.navigation.yml
title: 博客文章
icon: heroicons:newspaper
```

## 最佳实践

| 做法                                   | 不应做的做法                                 |
| -------------------------------------- | -------------------------------------------- |
| 使用 `page` 作为路由内容               | 将 `page` 用于配置/数据文件                  |
| 明确定义模式                           | 依赖隐式类型                                 |
| 使用 Zod 默认值处理可选字段            | 忽略必须字段的验证                           |
| 将相关内容共置                         | 将文件分散在无关目录中                       |

## 常见模式

**带分类的博客：**

```ts
blog: defineCollection({
  type: 'page',
  source: 'blog/**/*.md',
  schema: z.object({
    category: z.enum(['tech', 'life', 'news']),
    date: z.date(),
    featured: z.boolean().default(false),
  }),
})
```

**带排序的文档：**

```ts
docs: defineCollection({
  type: 'page',
  source: 'docs/**/*.md',
  schema: z.object({
    order: z.number().default(999),
    section: z.string().optional(),
  }),
})
```

**模式扩展与继承（v3.8+）：**

```ts
// 带通用字段的基础模式
const baseSchema = z.object({
  title: z.string(),
  description: z.string().optional(),
})

// 扩展模式，包含额外属性
const blogSchema = baseSchema.extend({
  author: z.string(),
  date: z.date(),
  tags: z.array(z.string()).optional(),
})

blog: defineCollection({
  type: 'page',
  source: 'blog/**/*.md',
  schema: blogSchema,
})
```

**原始内容访问：**

```ts
// 魔法字段 —— 包含 rawbody 以访问原始内容
docs: defineCollection({
  type: 'page',
  source: '**/*.md',
  schema: z.object({
    rawbody: z.string(), // 自动填充原始 markdown
  }),
})
// 每个文件排除：在 frontmatter 中添加 `rawbody: ''`
```

**i18n 与每语言合集：**

```ts
// content.config.ts —— 每种语言一个独立合集
import { defineCollection, defineContentConfig } from '@nuxt/content'
import { z } from 'zod'

const commonSchema = z.object({ title: z.string() })

export default defineContentConfig({
  collections: {
    content_en: defineCollection({ type: 'page', source: { include: 'en/**', prefix: '' }, schema: commonSchema }),
    content_fr: defineCollection({ type: 'page', source: { include: 'fr/**', prefix: '' }, schema: commonSchema }),
  },
})

// pages/[...slug].vue
const collection = (`content_${locale.value}`) as keyof Collections
const page = await queryCollection(collection).path(slug).first()
```

**继承组件属性类型（v3.7+）：**

```ts
import { defineCollection, defineContentConfig, property } from '@nuxt/content'
import { z } from 'zod'

defineCollection({
  type: 'page',
  source: 'blog/**/*.md',
  schema: z.object({
    // 使用 property().inherit() 继承 Vue 组件属性类型
    hero: property(z.object({})).inherit('app/components/HeroComponent.vue'),
    title: z.string(),
  }),
})
```

这使模式字段能够自动匹配 Vue 组件的属性类型。

## 资源

- 合集：https://content.nuxt.com/docs/collections/collections
- 模式：https://content.nuxt.com/docs/collections/schema
- 源：https://content.nuxt.com/docs/collections/sources
