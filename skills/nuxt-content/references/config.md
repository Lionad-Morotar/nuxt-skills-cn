# 配置

## 使用场景

适用于设置数据库后端、配置 Markdown 处理或自定义渲染器行为。

## 数据库配置

内容使用 SQL 进行查询。在 `nuxt.config.ts` 中进行配置：

### SQLite（默认）

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'sqlite',
      filename: '.data/content.db',
      // 可选：为提高查询性能添加数据库索引（v3.10+）
      indexes: [
        { fields: ['path'] },
        { fields: ['date', 'draft'] },
      ],
    },
  },
})
```

### PostgreSQL

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'postgresql',
      url: process.env.DATABASE_URL,
    },
  },
})
```

### Cloudflare D1

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'd1',
      bindingName: 'DB', // 与 wrangler.toml 中的绑定名称匹配
    },
  },
})
```

### LibSQL / Turso

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'libsql',
      url: process.env.TURSO_URL,
      authToken: process.env.TURSO_AUTH_TOKEN,
    },
  },
})
```

### PGlite（内存中）

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'pglite',
    },
  },
})
```

## 本地开发数据库

在开发和生产环境中使用不同的数据库：

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'd1',
      bindingName: 'DB',
    },
    // 开发环境专用 SQLite
    _localDatabase: {
      type: 'sqlite',
      filename: '.data/content-dev.db',
    },
  },
})
```

## Markdown 配置

```ts
export default defineNuxtConfig({
  content: {
    build: {
      markdown: {
        // 目录
        toc: {
          depth: 3, // 最大标题层级
          searchDepth: 2, // 树结构中搜索的深度
        },

        // 从第一个 H1 提取标题
        contentHeading: true,

        // Remark 插件（markdown → mdast）
        remarkPlugins: {
          'remark-emoji': {},
          'remark-gfm': { singleTilde: false },
        },

        // Rehype 插件（mdast → hast）
        rehypePlugins: {
          'rehype-external-links': {
            target: '_blank',
            rel: ['noopener', 'noreferrer'],
          },
        },

        // 代码高亮
        highlight: {
          theme: 'github-dark',
          langs: ['js', 'ts', 'vue', 'css', 'html', 'bash', 'yaml', 'json'],
        },
      },
    },
  },
})
```

## 高亮主题

单个主题：

```ts
highlight: {
  theme: 'github-dark',
}
```

多主题（浅色/深色）：

```ts
highlight: {
  themes: {
    default: 'github-light',
    dark: 'github-dark',
  },
}
```

可用主题：`github-dark`、`github-light`、`dracula`、`nord`、`one-dark-pro` 等。详见 [Shiki themes](https://shiki.style/themes)。

## 渲染器配置

```ts
export default defineNuxtConfig({
  content: {
    renderer: {
      // prose 组件别名
      alias: {
        p: 'MyParagraph',
        h2: 'MyHeading2',
        code: 'MyCodeBlock',
      },

      // 每个标题层级的锚点链接
      anchorLinks: {
        h1: false,
        h2: true,
        h3: true,
        h4: false,
        h5: false,
        h6: false,
      },
    },
  },
})
```

## 文件类型配置

### YAML

```ts
export default defineNuxtConfig({
  content: {
    build: {
      yaml: {
        // YAML 解析器选项
      },
      // 或者禁用 YAML 解析
      yaml: false,
    },
  },
})
```

### CSV

```ts
export default defineNuxtConfig({
  content: {
    build: {
      csv: {
        json: true, // 解析为 JSON 对象
        delimiter: ',', // 列分隔符
      },
    },
  },
})
```

## 实验性选项

```ts
export default defineNuxtConfig({
  content: {
    experimental: {
      // 使用 Node.js 原生 SQLite（Node.js v22.5.0+，v3.4+）
      nativeSqlite: true,

      // 指定 SQLite 连接器（v3.6+）
      // 'better-sqlite3' 在 v3.6.0 中移至 peer dependency
      sqliteConnector: 'better-sqlite3', // 或 'native'（Node 22+），'sqlite3'
    },
  },
})
```

**注意：** 从 v3.6.0 开始，`better-sqlite3` 是一个 peer dependency。首次运行时模块将提示您安装所需的 SQLite 连接器。

## 完整配置示例

```ts
export default defineNuxtConfig({
  content: {
    database: {
      type: 'sqlite',
      filename: '.data/content.db',
    },
    build: {
      markdown: {
        toc: { depth: 3, searchDepth: 2 },
        remarkPlugins: {
          'remark-gfm': {},
        },
        highlight: {
          themes: { default: 'github-light', dark: 'github-dark' },
          langs: ['vue', 'ts', 'bash', 'yaml', 'json'],
        },
      },
    },
    renderer: {
      anchorLinks: { h2: true, h3: true },
    },
  },
})
```

## 环境变量

数据库的常见环境变量：

```bash
# PostgreSQL
DATABASE_URL=postgresql://user:pass@host:5432/db

# Turso/LibSQL
TURSO_URL=libsql://your-db.turso.io
TURSO_AUTH_TOKEN=your-token

# GitHub（用于远程源）
GITHUB_TOKEN=ghp_xxxx
```

## 内容钩子

在构建过程中修改内容：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  hooks: {
    'content:file:beforeParse': function (ctx) {
      // 解析前修改原始内容
      if (ctx.file.id.endsWith('.md')) {
        ctx.file.body = ctx.file.body.replace(/oldTerm/gi, 'newTerm')
      }
    },
    'content:file:afterParse': function (ctx) {
      // 解析后添加计算字段
      const wordCount = ctx.file.body?.split(/\s+/).length || 0
      ctx.content.readingTime = Math.ceil(wordCount / 180)
    },
  },
})
```

**注意：** 在 `afterParse` 中添加的字段必须在集合模式中定义：

```ts
schema: z.object({ readingTime: z.number().optional() })
```

## LLMs 集成

使用 `nuxt-llms` 生成 AI 就绪内容：

```ts
export default defineNuxtConfig({
  modules: ['@nuxt/content', 'nuxt-llms'],
  llms: {
    domain: 'https://your-site.com',
    title: 'Your Site',
    sections: [
      {
        title: 'Docs',
        contentCollection: 'docs',
        contentFilters: [{ field: 'draft', operator: '<>', value: true }],
      },
    ],
  },
})
```

自动生成 `/llms.txt` 供 LLM 使用。

## 最佳实践

| 做法                                      | 避免做法                            |
| --------------------------------------- | ---------------------------------- |
| 使用 `_localDatabase` 分离开发和生产环境 | 在开发中使用生产数据库              |
| 仅指定所需的编程语言                    | 加载所有 Shiki 编程语言             |
| 使用多主题支持深色模式                  | 硬编码单个主题                      |
| 根据内容调整目录深度                    | 不加检查直接使用默认设置            |

## 资源

- 配置：https://content.nuxt.com/docs/getting-started/configuration
- 数据库：https://content.nuxt.com/docs/getting-started/configuration#database
- Markdown：https://content.nuxt.com/docs/getting-started/configuration#markdown
