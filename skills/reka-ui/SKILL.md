---
name: reka-ui
description: 用于构建 Reka UI（无头 Vue 组件）时使用——提供组件 API、可访问性模式、组合（asChild）、受控/非受控状态、虚拟化和样式集成。原名 Radix Vue。
license: MIT
---

# Reka UI

无样式的、可访问的 Vue 3 组件原语。符合 WAI-ARIA 标准。此前称为 Radix Vue。

**当前版本：** v2.7.0（2025 年 12 月）

## 使用场景

- 从头开始构建无头/无样式的组件
- 需要符合 WAI-ARIA 标准的组件
- 使用 Nuxt UI、shadcn-vue 或其他基于 Reka 的库
- 实现可访问的表单、对话框、菜单和弹出窗口

**对于 Vue 模式：** 使用 `vue` 技能

## 可用指南

| 文件                                                     | 主题                                                                |
| -------------------------------------------------------- | ------------------------------------------------------------------- |
| **[references/components.md](references/components.md)** | 按类别分组的组件索引（表单、日期、覆盖层、菜单、数据等）             |
| **components/\*.md**                                     | 各组件详情（dialog.md、select.md 等）                                |

**新增指南**（见 [reka-ui.com](https://reka-ui.com)）：受控状态、注入上下文、虚拟化、迁移

## 使用模式

**基于上下文加载：**

- 组件索引 → [references/components.md](references/components.md)
- 具体组件 → [components/dialog.md](components/dialog.md)、[components/select.md](components/select.md) 等
- 对于基于 Reka UI 构建的带样式的 Nuxt 组件 → 使用 **nuxt-ui** 技能

## 核心概念

| 概念                    | 描述                                                                 |
| ----------------------- | -------------------------------------------------------------------- |
| `asChild`               | 作为子元素而非包装器渲染，合并属性和行为                             |
| 受控/非受控             | 使用 `v-model` 实现受控，使用 `default*` 属性实现非受控              |
| 部分                    | 组件拆分为 Root、Trigger、Content、Portal 等部分                     |
| `forceMount`            | 保留元素在 DOM 中以便动画库使用                                      |
| 虚拟化                  | 使用虚拟滚动优化大型列表（组合框、列表框、树）                       |
| 上下文注入              | 从子组件中访问组件上下文                                             |

## 安装

```ts
// nuxt.config.ts（自动导入所有组件）
export default defineNuxtConfig({
  modules: ['reka-ui/nuxt']
})
```

```ts
import { RekaResolver } from 'reka-ui/resolver'
// vite.config.ts（配合自动导入解析器）
import Components from 'unplugin-vue-components/vite'

export default defineConfig({
  plugins: [
    vue(),
    Components({ resolvers: [RekaResolver()] })
  ]
})
```

## 基本模式

```vue
<!-- 使用受控状态的对话框 -->
<script setup>
import { DialogRoot, DialogTrigger, DialogPortal, DialogOverlay, DialogContent, DialogTitle, DialogDescription, DialogClose } from 'reka-ui'
const open = ref(false)
</script>

<template>
  <DialogRoot v-model:open="open">
    <DialogTrigger>打开</DialogTrigger>
    <DialogPortal>
      <DialogOverlay class="fixed inset-0 bg-black/50" />
      <DialogContent class="fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 bg-white p-6 rounded">
        <DialogTitle>标题</DialogTitle>
        <DialogDescription>描述</DialogDescription>
        <DialogClose>关闭</DialogClose>
      </DialogContent>
    </DialogPortal>
  </DialogRoot>
</template>
```

```vue
<!-- 使用非受控默认值的选择器 -->
<SelectRoot default-value="apple">
  <SelectTrigger>
    <SelectValue placeholder="选择水果" />
  </SelectTrigger>
  <SelectPortal>
    <SelectContent>
      <SelectViewport>
        <SelectItem value="apple"><SelectItemText>苹果</SelectItemText></SelectItem>
        <SelectItem value="banana"><SelectItemText>香蕉</SelectItemText></SelectItem>
      </SelectViewport>
    </SelectContent>
  </SelectPortal>
</SelectRoot>
```

```vue
<!-- asChild 用于自定义触发元素 -->
<DialogTrigger as-child>
  <button class="my-custom-button">打开</button>
</DialogTrigger>
```

## 最近更新（v2.5.0-v2.7.0）

- **新增组合式函数暴露**：`useLocale`、`useDirection`（v2.6.0）
- **Select**：为 Content 添加 `disableOutsidePointerEvents` 属性
- **Toast**：添加 `disableSwipe` 属性以控制滑动
- **DatePicker**：添加 `closeOnSelect` 属性
- **ContextMenu**：添加 `pressOpenDelay` 用于长按配置
- **虚拟化**：`estimateSize` 现在支持函数形式用于 Listbox/Tree（v2.7.0）；支持 Combobox、Listbox 和 Tree

## 资源

- [Reka UI 文档](https://reka-ui.com)
- [GitHub](https://github.com/unovue/reka-ui)
- [Nuxt UI](https://ui.nuxt.com)（带样式的 Reka 组件）
- [shadcn-vue](https://www.shadcn-vue.com)（带样式的 Reka 组件）

---

_令牌效率：约 350 个基础令牌，components.md 索引约 100 个令牌，每个组件详情约 50–150 个令牌_
