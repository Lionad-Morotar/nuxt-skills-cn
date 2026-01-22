# 内容模式

Nuxt 生态文档的博客文章结构、前置信息与组件模式。

## 博客文章前置信息

```yaml
---
title: 文章标题
description: 用于 SEO 和预览的简要描述（不超过 160 个字符）
navigation: false
image: /assets/blog/slug.png
authors:
  - name: 作者姓名
    avatar:
      src: https://github.com/username.png
    to: https://x.com/username
date: 2025-11-05T10:00:00.000Z
category: 发布
---
```

**分类**：`发布`（版本公告）、`文章`（教程、指南）

**作者链接**：GitHub、X/Twitter、Bluesky（`https://bsky.app/profile/...`）

## 博客文章结构

1. **引言**（1-2 段）—— 宣布新功能，说明其重要性
2. **关键提示** —— 使用 `::note` 或 `::callout`，包含要求/前提条件
3. **功能部分** —— 使用 `## Emoji 功能名称` 作为标题
4. **代码示例** —— 包含文件路径标签
5. **破坏性变更** —— 若为发布文章
6. **致谢** —— 致敬贡献者
7. **资源** —— 文档、仓库链接
8. **发布链接** —— 使用 `::read-more` 链接到完整更新日志

## 推荐模块

用于增强文档功能：

| 模块                                                                        | 目的                                                              |
|-----------------------------------------------------------------------------|-------------------------------------------------------------------|
| [`nuxt-content-twoslash`](https://github.com/antfu/nuxt-content-twoslash)   | Nuxt Content 的 TwoSlash —— 在代码块中显示内联 TypeScript 类型提示 |

### 安装

```bash
pnpm add -D nuxt-content-twoslash
```

```ts [nuxt.config.ts]
export default defineNuxtConfig({
  modules: ['nuxt-content-twoslash', '@nuxt/content'] // twoslash 在 content 之前
})
```

## 组件模式

根据用途选择正确的组件：

| 需求             | 组件                            | 使用场景                       |
|------------------|---------------------------------|--------------------------------|
| 背景信息         | `::note`                        | 补充上下文                     |
| 最佳实践         | `::tip`                         | 建议                           |
| 潜在问题         | `::warning`                     | 可能出错的内容                 |
| 必须了解         | `::important`                   | 必要操作                       |
| 危险             | `::caution`                     | 破坏性操作                     |
| CTA 按钮         | `:u-button{to="..." label="..."}` | 下载、外部链接                 |
| 包管理器         | `::code-group{sync="pm"}`       | pnpm/npm/yarn 变体             |
| 可展开内容       | `::collapsible{title="..."}`    | 高级细节                       |
| 图片             | `::carousel{items: [...]}`      | 多张截图                       |
| 步骤说明         | `::steps`                       | 多步骤说明                     |

> 组件属性/详情：请参阅 **nuxt-ui** 技能

## 步骤组件

`::steps` 组件会自动渲染步骤编号。**请勿在步骤标题中包含数字** —— 它们将被重复。

```md
<!-- ✅ 正确 -->
::steps
### 安装模块
### 配置 nuxt.config.ts
### 重启开发服务器
::

<!-- ❌ 错误（数字将重复） -->
::steps
### 1. 安装模块
### 2) 配置 nuxt.config.ts
### Step 3: 重启开发服务器
::
```

## 代码块标签

始终包含文件路径：

````md
```ts [nuxt.config.ts]
export default defineNuxtConfig({
  modules: ['@nuxt/content']
})
```

```vue [app/pages/index.vue]
<template>
  <div>Hello</div>
</template>
```

```bash
pnpm add @nuxt/content
```
````

## YAML 属性格式

对于具有多个属性的组件，使用 YAML 前置信息：

```md
::read-more
---
icon: i-simple-icons-github
target: _blank
to: https://github.com/nuxt/nuxt/releases/tag/v4.0.0
---
阅读完整发布说明。
::
```

```md
::carousel
---
items:
  - /assets/blog/image-1.png
  - /assets/blog/image-2.png
---
::
```

## 跨引用

链接到相关内容：

```md
<!-- 内联链接 -->
参见 [配置指南](/docs/getting-started/configuration)。

<!-- Read-more 块 -->
::read-more{to="/docs/api/composables/use-fetch"}
::

<!-- 自定义文本与图标 -->
::read-more
---
icon: i-simple-icons-github
to: https://github.com/nuxt/nuxt
target: _blank
---
查看源代码。
::
```

> 关于 MDC 语法详情：请参阅 **nuxt-content** 技能（rendering.md）
