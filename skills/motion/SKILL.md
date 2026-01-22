---
name: motion
description: 用于添加使用 Motion Vue（motion-v）的动画——提供动画组件 API、手势动画、滚动关联效果、布局过渡和适用于 Vue 3/Nuxt 的组合式函数
license: MIT
---

# Motion Vue (motion-v)

适用于 Vue 3 和 Nuxt 的动画库。生产就绪、硬件加速的动画，具有最小的包大小。

**当前稳定版本：** motion-v 1.x - Motion（前身为 Framer Motion）的 Vue 版本

## 概述

Motion Vue 动画的渐进式参考。仅加载与当前任务相关的文件（基础约 200 个 token，每个子文件 500–1500 个 token）。

## 使用场景

**使用 Motion Vue 的情况包括：**

- 简单的声明式动画（淡入淡出、滑动、缩放）
- 基于手势的交互（悬停、点击、拖拽）
- 滚动关联动画
- 布局动画和共享元素过渡
- 弹簧物理动画

**考虑替代方案：**

- **GSAP** - 复杂的时间轴、SVG 变形、滚动触发序列
- **@vueuse/motion** - 更简单的 API，功能较少，包体积更小
- **CSS 动画** - 不依赖 JavaScript 的简单过渡

## 安装

```bash
# Vue 3
pnpm add motion-v

# Nuxt 3
pnpm add motion-v @vueuse/nuxt
```

```ts
// nuxt.config.ts - Nuxt 3 设置
export default defineNuxtConfig({
  modules: ['motion-v/nuxt'],
})
```

## 快速参考

| 正在处理...                  | 加载文件                  |
| ---------------------------- | ------------------------- |
| Motion 组件、手势            | references/components.md  |
| useMotionValue、useScroll    | references/composables.md |
| 动画示例、模式               | references/examples.md    |

## 加载文件

**根据上下文逐个加载文件：**

- 组件动画 → [references/components.md](references/components.md)
- 组合式函数、动画值 → [references/composables.md](references/composables.md)
- 示例、灵感 → [references/examples.md](references/examples.md)

## 核心概念

### Motion 组件

渲染任何 HTML/SVG 元素并支持动画：

```vue
<script setup lang="ts">
import { Motion } from 'motion-v'
</script>

<template>
  <Motion.div
    :initial="{ opacity: 0, y: 20 }"
    :animate="{ opacity: 1, y: 0 }"
    :exit="{ opacity: 0, y: -20 }"
    :transition="{ duration: 0.3 }"
  >
    动画内容
  </Motion.div>
</template>
```

### 手势动画

```vue
<Motion.button
  :whileHover="{ scale: 1.05 }"
  :whilePress="{ scale: 0.95 }"
  :transition="{ type: 'spring', stiffness: 400 }"
>
  点击我
</Motion.button>
```

### 滚动动画

```vue
<Motion.div
  :initial="{ opacity: 0 }"
  :whileInView="{ opacity: 1 }"
  :viewport="{ once: true, margin: '-100px' }"
>
  滚动时出现
</Motion.div>
```

## 可用指导

**[references/components.md](references/components.md)** - Motion 组件变体、动画属性、手势属性、布局动画、过渡配置

**[references/composables.md](references/composables.md)** - useMotionValue、useSpring、useTransform、useScroll、useInView、animate()

**[references/examples.md](references/examples.md)** - 外部资源、组件库、动画模式和灵感
