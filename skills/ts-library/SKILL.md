---
name: ts-library
description: 用于创建 TypeScript 库时使用——涵盖项目设置、包导出、构建工具（tsdown/unbuild）、API 设计模式、类型推断技巧、测试和发布工作流。这些模式源自 20 多个高质量生态系统库。
license: MIT
---

# TypeScript 库开发

从研究 unocss、shiki、unplugin、vite、vitest、vueuse、zod、trpc、drizzle-orm 等库中提取的高质量 TypeScript 库开发模式。

## 使用场景

- 启动新的 TypeScript 库（单体或 monorepo）
- 设置 package.json 导出以支持 CJS/ESM 双格式
- 配置 tsconfig 用于库开发
- 选择构建工具（tsdown、unbuild）
- 设计类型安全的 API（构建器、工厂、插件模式）
- 编写高级 TypeScript 类型
- 为库测试设置 vitest
- 配置发布工作流和 CI

**对于 Nuxt 模块开发：** 使用 `nuxt-modules` 技能

## 快速参考

| 开发内容              | 加载文件                                                           |
| --------------------- | ------------------------------------------------------------------ |
| 新项目设置            | [references/project-setup.md](references/project-setup.md)         |
| 包导出                | [references/package-exports.md](references/package-exports.md)     |
| tsconfig 选项         | [references/typescript-config.md](references/typescript-config.md) |
| 构建配置              | [references/build-tooling.md](references/build-tooling.md)         |
| API 设计模式          | [references/api-design.md](references/api-design.md)               |
| 类型推断技巧          | [references/type-patterns.md](references/type-patterns.md)         |
| 测试设置              | [references/testing.md](references/testing.md)                     |
| 发布工作流            | [references/release.md](references/release.md)                     |
| CI/CD 设置            | [references/ci-workflows.md](references/ci-workflows.md)           |

## 核心原则

- ESM 优先：`"type": "module"` 并输出 `.mjs`
- 双格式支持：始终支持 CJS 和 ESM 消费者
- `moduleResolution: "Bundler"` 用于现代 TypeScript
- 大多数构建使用 tsdown，复杂情况使用 unbuild
- 智能默认值：检测环境，不强制配置
- 可树摇：延迟 getter、正确设置 `sideEffects: false`

_令牌效率：主技能约 300 个 token，每个参考文档约 800–1200 个 token_
