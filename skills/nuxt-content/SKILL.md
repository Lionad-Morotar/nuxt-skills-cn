---
name: nuxt-content
description: 在使用 Nuxt Content v3 时使用——提供集合（本地/远程/API 来源）、queryCollection API、MDC 渲染、数据库配置、NuxtStudio 集成、钩子、i18n 模式和 LLM 集成
license: MIT
---

# Nuxt Content v3

为以内容驱动的 Nuxt 应用提供渐进式指导，支持类型化集合和基于 SQL 的查询。

## 使用场景

适用于以下内容：

- 内容集合（`content.config.ts`, `defineCollection`）
- 远程来源（GitHub 仓库、通过 `defineCollectionSource` 的外部 API）
- 内容查询（`queryCollection`, 导航, 搜索）
- MDC 渲染（`<ContentRenderer>`, prose 组件）
- 数据库配置（SQLite、PostgreSQL、D1、LibSQL）
- 内容钩子（`content:file:beforeParse`, `content:file:afterParse`）
- i18n 多语言内容
- NuxtStudio 或预览模式
- LLM 集成（`nuxt-llms`）

**撰写文档时：** 使用 `document-writer` 技能  
**Nuxt 基础知识：** 使用 `nuxt` 技能  
**NuxtHub 部署：** 使用 `nuxthub` 技能（兼容 NuxtHub v1）

## 可用指导

根据当前工作内容读取特定文件：

- **[references/collections.md](references/collections.md)** - defineCollection、模式、来源、content.config.ts
- **[references/querying.md](references/querying.md)** - queryCollection、导航、搜索、周边内容
- **[references/rendering.md](references/rendering.md)** - ContentRenderer、MDC 语法、prose 组件、Shiki
- **[references/config.md](references/config.md)** - 数据库设置、markdown 插件、渲染器选项
- **[references/studio.md](references/studio.md)** - NuxtStudio 集成、预览模式、实时编辑

## 使用模式

**渐进式加载——仅读取所需内容：**

- 设置集合？→ [references/collections.md](references/collections.md)  
- 查询内容？→ [references/querying.md](references/querying.md)  
- 渲染 markdown/MDC？→ [references/rendering.md](references/rendering.md)  
- 配置数据库/markdown？→ [references/config.md](references/config.md)  
- 使用 NuxtStudio？→ [references/studio.md](references/studio.md)

**不要一次性读取所有文件。** 根据上下文加载：

- 编辑 `content.config.ts` → 读取 collections.md  
- 使用 `queryCollection()` → 读取 querying.md  
- 处理 `<ContentRenderer>` 或 MDC → 读取 rendering.md  
- 配置数据库或 markdown → 读取 config.md  
- 设置预览/Studio → 读取 studio.md  

## 核心概念

| 概念            | 目的                                                              |
| --------------- | ----------------------------------------------------------------- |
| Collections     | 带有模式的类型化内容组                                            |
| Page vs Data    | `page` = 路由 + 正文，`data` = 仅结构化数据                        |
| Remote sources  | `source.repository` 用于 GitHub，`defineCollectionSource` 用于 API |
| queryCollection | 类 SQL 的流畅 API 用于内容查询                                    |
| MDC             | markdown 中的 Vue 组件                                            |
| ContentRenderer | 渲染解析后的 markdown 正文                                        |

## 目录结构

```
project/
├── content/                    # 内容文件
│   ├── blog/                   # 映射到 'blog' 集合
│   └── .navigation.yml         # 导航元数据
├── components/content/         # MDC 组件
└── content.config.ts           # 集合定义
```

## 官方文档

- Nuxt Content: https://content.nuxt.com  
- MDC 语法: https://content.nuxt.com/docs/files/markdown#mdc-syntax  
- 集合: https://content.nuxt.com/docs/collections/collections  

## 令牌效率

主技能：约 300 个令牌。每个子文件：约 800-1200 个令牌。仅加载当前任务相关的文件。
