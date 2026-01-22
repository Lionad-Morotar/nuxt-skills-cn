---
name: nuxt-modules
description: "创建 Nuxt 模块时使用：(1) 已发布的 npm 模块 (@nuxtjs/, nuxt-), (2) 本地项目模块 (modules/ 目录), (3) 运行时扩展 (components, composables, plugins), (4) 服务器端扩展 (API 路由, middleware), (5) 将模块发布到 npm, (6) 为模块设置 CI/CD 工作流。提供 defineNuxtModule 模式、Kit 实用工具、钩子、E2E 测试和发布自动化。"
license: MIT
---

# Nuxt 模块开发

用于扩展框架功能的 Nuxt 模块创建指南。

**相关技能：** `nuxt`（基础）、`vue`（运行时模式）

## 快速开始

```bash
npx nuxi init -t module my-module
cd my-module && npm install
npm run dev        # 启动游乐场
npm run dev:build  # 监听模式下构建
npm run test       # 运行测试
```

## 可用指导

- **[references/development.md](references/development.md)** - 模块结构、defineNuxtModule、Kit 实用工具、钩子
- **[references/testing-and-publishing.md](references/testing-and-publishing.md)** - E2E 测试、最佳实践、发布、发布流程
- **[references/ci-workflows.md](references/ci-workflows.md)** - 可复制的 CI/CD 工作流模板

**根据上下文加载：**

- 构建模块功能？→ [references/development.md](references/development.md)
- 测试或发布？→ [references/testing-and-publishing.md](references/testing-and-publishing.md)
- CI 工作流模板？→ [references/ci-workflows.md](references/ci-workflows.md)

## 模块类型

| 类型      | 位置             | 使用场景                         |
| --------- | ---------------- | -------------------------------- |
| 已发布    | npm 包           | `@nuxtjs/`, `nuxt-` 发布版本     |
| 本地      | `modules/` 目录  | 项目特定扩展                     |
| 内联      | `nuxt.config.ts` | 简单一次性钩子                   |

## 项目结构

```
my-module/
├── src/
│   ├── module.ts           # 入口点
│   └── runtime/            # 注入用户应用中
│       ├── components/
│       ├── composables/
│       ├── plugins/
│       └── server/
├── playground/             # 开发测试
└── test/fixtures/          # E2E 测试
```

## 资源

- [模块指南](https://nuxt.com/docs/guide/going-further/modules)
- [Nuxt Kit](https://nuxt.com/docs/api/kit)
- [模块启动器](https://github.com/nuxt/starter/tree/module)
