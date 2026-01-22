# 动画示例与资源

外部动画库、组件集合及灵感来源的链接。

## 官方动效资源

- **[motion.dev/examples](https://motion.dev/examples)** - 官方 Motion 示例画廊
- **[github.com/motiondivision/motion-vue](https://github.com/motiondivision/motion-vue)** - Motion Vue 源代码

## Vue 动画库

- **[Vue Bits](https://github.com/DavidHDev/vue-bits)** - 110+ 个动画 Vue 组件（文字揭示、背景、UI 效果）
- **[Inspira UI](https://inspira-ui.com/)** - 使用 Vue、Nuxt 和 Tailwind CSS 构建的精美 UI 组件

## 动画模式参考

这些 React/CSS 库提供易于移植到 Motion Vue 的模式：

- **[React Bits](https://github.com/DavidHDev/react-bits)** - 与 Vue Bits 同一作者，模式可直接转换
- **[Magic UI](https://github.com/magicuidesign/magicui)** - 150+ 页面效果，shadcn 配套组件
- **[Animata](https://github.com/codse/animata)** - 80+ Tailwind 可复制粘贴动画
- **[Aceternity UI](https://ui.aceternity.com)** - 高级动画（灯、地球仪、3D 卡片）
- **[Motion Primitives](https://motion-primitives.com)** - 动画 UI 组件包
- **[Cult UI](https://www.cult-ui.com/)** - 精选动画组件

## 按类别划分的模式

### 滚动动画

```vue
<!-- 视差 -->
<script setup>
const { scrollYProgress } = useScroll()
const y = useTransform(scrollYProgress, [0, 1], [0, -200])
</script>

<Motion.div :style="{ y }">视差内容</Motion.div>
```

```vue
<!-- 进度条 -->
<Motion.div
  class="fixed top-0 left-0 right-0 h-1 bg-blue-500 origin-left"
  :style="{ scaleX: scrollYProgress }"
/>
```

### 布局动画

```vue
<!-- 展开卡片 -->
<Motion.div
  :layoutId="`card-${id}`"
  @click="expanded = !expanded"
  :class="expanded ? 'w-full h-64' : 'w-32 h-32'"
/>
```

```vue
<!-- 列表重新排序 -->
<Motion.li
  v-for="item in items"
  :key="item.id"
  layout
  :initial="{ opacity: 0 }"
  :animate="{ opacity: 1 }"
  :exit="{ opacity: 0 }"
/>
```

### 手势交互

```vue
<!-- 磁性按钮 -->
<script setup>
const x = useMotionValue(0)
const y = useMotionValue(0)

function handleMouse(e: MouseEvent) {
  const rect = (e.target as HTMLElement).getBoundingClientRect()
  x.set(e.clientX - rect.left - rect.width / 2)
  y.set(e.clientY - rect.top - rect.height / 2)
}

function reset() {
  x.set(0)
  y.set(0)
}
</script>

<Motion.button
  :style="{ x, y }"
  @mousemove="handleMouse"
  @mouseleave="reset"
  :transition="{ type: 'spring', stiffness: 150 }"
/>
```

```vue
<!-- 滑动关闭 -->
<Motion.div
  drag="x"
  :dragConstraints="{ left: 0, right: 0 }"
  :onDragEnd="(_, info) => info.offset.x > 100 && dismiss()"
  :style="{ x }"
/>
```

### 文本动画

```vue
<!-- 交错文字揭示 -->
<script setup>
const words = text.split(' ')
</script>

<template>
  <span v-for="(word, i) in words" :key="i">
    <Motion.span
      :initial="{ opacity: 0, y: 20 }"
      :animate="{ opacity: 1, y: 0 }"
      :transition="{ delay: i * 0.1 }"
    >
      {{ word }}
    </Motion.span>
    {{ ' ' }}
  </span>
</template>
```

```vue
<!-- 字符动画 -->
<Motion.span
  v-for="(char, i) in text.split('')"
  :key="i"
  :initial="{ opacity: 0 }"
  :animate="{ opacity: 1 }"
  :transition="{ delay: i * 0.03 }"
>
  {{ char }}
</Motion.span>
```

### SVG 动画

```vue
<!-- 路径绘制 -->
<Motion.path
  d="M0 0 L100 100"
  :initial="{ pathLength: 0 }"
  :animate="{ pathLength: 1 }"
  :transition="{ duration: 2, ease: 'easeInOut' }"
/>
```

```vue
<!-- 形状变形 -->
<Motion.path
  :animate="{ d: isCircle ? circlePath : squarePath }"
  :transition="{ duration: 0.5 }"
/>
```

### 背景效果

```vue
<!-- 渐变跟随光标 -->
<script setup>
const x = useMotionValue(0)
const y = useMotionValue(0)
const background = useMotionTemplate`radial-gradient(circle at ${x}px ${y}px, #3b82f6, transparent 80%)`

function handleMouse(e: MouseEvent) {
  x.set(e.clientX)
  y.set(e.clientY)
}
</script>

<Motion.div
  :style="{ background }"
  @mousemove="handleMouse"
  class="fixed inset-0"
/>
```

### 页面过渡

```vue
<!-- 滑动过渡 -->
<AnimatePresence mode="wait">
  <Motion.div
    :key="route.path"
    :initial="{ opacity: 0, x: 100 }"
    :animate="{ opacity: 1, x: 0 }"
    :exit="{ opacity: 0, x: -100 }"
    :transition="{ type: 'spring', stiffness: 100, damping: 20 }"
  />
</AnimatePresence>
```

## 性能提示

1. **对频繁更新使用动量值**（鼠标位置、滚动）
2. **优先使用变换属性**（x, y, scale, rotate）而非布局属性（width, height, top, left）
3. **谨慎使用 `layout`** —— 它会测量 DOM，可能消耗资源
4. **在视口动画中尽可能设置 `once: true`**
5. **对于复杂动画使用 `will-change`**（Motion 会自动添加）
