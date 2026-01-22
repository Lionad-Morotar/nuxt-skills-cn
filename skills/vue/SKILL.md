---
name: vue
description: 用于编辑 .vue 文件、创建 Vue 3 组件、编写组合式函数或测试 Vue 代码时使用——提供组合式 API 模式、props/emits 最佳实践、VueUse 集成及响应式解构指导
license: MIT
---

# Vue 3 开发

Vue 3 组合式 API 模式、组件架构和测试实践的参考指南。

**当前稳定版本：** Vue 3.5+，具备增强的响应式性能（内存减少 56%，数组追踪速度提升 10 倍）、新的 SSR 功能以及改进的开发者体验。

## 概述

Vue 3 项目的渐进式参考体系。仅加载当前任务相关的文件以减少上下文使用量（基础约 250 tokens，子文件 500–1500 tokens）。

## 使用场景

**使用此技能当：**

- 编写 `.vue` 组件
- 创建组合式函数（`use*` 函数）
- 构建客户端工具函数
- 测试 Vue 组件/组合式函数

**对于以下内容，请改用 `nuxt` 技能：**

- 服务端路由、API 端点
- 基于文件的路由、中间件
- Nuxt 特定模式

**对于带样式的 UI 组件：** 使用 `nuxt-ui` 技能  
**对于无头且可访问的组件：** 使用 `reka-ui` 技能  
**对于 VueUse 组合式函数：** 使用 `vueuse` 技能

## 快速参考

| 工作内容                 | 加载文件                   |
| ------------------------ | -------------------------- |
| `components/` 中的 `.vue` | references/components.md   |
| `composables/` 中的文件   | references/composables.md  |
| `utils/` 中的文件         | references/utils-client.md |
| `.spec.ts` 或 `.test.ts`  | references/testing.md      |

## 加载文件

**根据文件上下文一次只加载一个文件：**

- 组件开发 → [references/components.md](references/components.md)  
- 组合式函数开发 → [references/composables.md](references/composables.md)  
- 工具函数开发 → [references/utils-client.md](references/utils-client.md)  
- 测试 → [references/testing.md](references/testing.md)

**请勿一次性加载所有文件** —— 这会浪费上下文中的无关模式。

## 可用指导

**[references/components.md](references/components.md)** —— 带响应式解构的 Props、emits 模式、defineModel 用于 v-model、slots 简写

**[references/composables.md](references/composables.md)** —— 组合式 API 结构、VueUse 集成、生命周期钩子、异步模式

**[references/utils-client.md](references/utils-client.md)** —— 纯函数、格式化器、验证器、转换器，以及何时不使用工具函数

**[references/testing.md](references/testing.md)** —— Vitest + @vue/test-utils，组件测试、组合式函数测试、模拟模式

## 示例

`resources/examples/` 中包含实际示例：

- `component-example.vue` —— 包含所有模式的完整组件  
- `composable-example.ts` —— 可复用的组合函数
