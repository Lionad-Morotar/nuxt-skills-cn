# Motion 组件 API

## 组件变体

Motion 可包装任何 HTML 或 SVG 元素：

```vue
<script setup lang="ts">
import { Motion } from 'motion-v'
</script>

<template>
  <!-- HTML 元素 -->
  <Motion.div />
  <Motion.span />
  <Motion.button />
  <Motion.a />
  <Motion.img />
  <Motion.ul />
  <Motion.li />

  <!-- SVG 元素 -->
  <Motion.svg />
  <Motion.path />
  <Motion.circle />
  <Motion.rect />
  <Motion.g />
</template>
```

## 动画属性

### initial

组件挂载前的初始状态：

```vue
<Motion.div :initial="{ opacity: 0, scale: 0.8, x: -100 }">
```

设置 `initial: false` 可禁用进入动画，并从 `animate` 值开始。

### animate

目标动画状态。更改会触发动画：

```vue
<script setup>
const isOpen = ref(false)
</script>

<Motion.div :animate="{ height: isOpen ? 'auto' : 0 }">
```

### exit

组件卸载时的动画。需要配合 `AnimatePresence` 使用：

```vue
<script setup>
import { Motion, AnimatePresence } from 'motion-v'
</script>

<template>
  <AnimatePresence>
    <Motion.div
      v-if="show"
      :initial="{ opacity: 0 }"
      :animate="{ opacity: 1 }"
      :exit="{ opacity: 0 }"
    />
  </AnimatePresence>
</template>
```

### style

响应式样式对象。使用 motion 值以实现性能优化的更新：

```vue
<Motion.div :style="{ x: motionValue, backgroundColor: '#fff' }">
```

## 手势属性

### whileHover

指针悬停时的动画：

```vue
<Motion.div
  :whileHover="{ scale: 1.1, backgroundColor: '#f00' }"
  :transition="{ type: 'spring', stiffness: 300 }"
/>
```

### whilePress / whileTap

元素被按下时的动画：

```vue
<Motion.button :whilePress="{ scale: 0.95 }">
```

### whileFocus

元素获得焦点时的动画：

```vue
<Motion.input :whileFocus="{ borderColor: '#0066ff', scale: 1.02 }">
```

### whileDrag

元素被拖拽时的动画：

```vue
<Motion.div
  drag
  :whileDrag="{ scale: 1.1, cursor: 'grabbing' }"
  :dragConstraints="{ top: 0, left: 0, right: 300, bottom: 300 }"
/>
```

### 拖拽属性

```vue
<Motion.div
  drag              <!-- 在两个轴上启用拖拽 -->
  drag="x"          <!-- 限制在 x 轴方向 -->
  drag="y"          <!-- 限制在 y 轴方向 -->
  :dragConstraints="{ top: -50, left: -50, right: 50, bottom: 50 }"
  :dragElastic="0.2"        <!-- 0 = 刚性，1 = 弹性 -->
  :dragMomentum="true"      <!-- 继续惯性运动 -->
  :dragSnapToOrigin="true"  <!-- 返回初始位置 -->
/>
```

## 视口属性

### whileInView

元素进入视口时的动画：

```vue
<Motion.div
  :initial="{ opacity: 0, y: 50 }"
  :whileInView="{ opacity: 1, y: 0 }"
  :viewport="{ once: true, amount: 0.5 }"
/>
```

### 视口选项

```ts
interface ViewportOptions {
  once?: boolean       // 仅第一次动画（默认：false）
  amount?: number | 'some' | 'all'  // 可见性阈值（默认：'some'）
  margin?: string      // 根边距（例如：'-100px'）
  root?: Element       // 滚动容器（默认：window）
}
```

## 布局动画

### layout 属性

自动动画布局变化：

```vue
<Motion.div layout>
  <!-- 位置/尺寸的变化将平滑动画 -->
</Motion.div>
```

布局模式：

```vue
<Motion.div layout />           <!-- 动画位置和尺寸 -->
<Motion.div layout="position" /> <!-- 仅动画位置 -->
<Motion.div layout="size" />     <!-- 仅动画尺寸 -->
```

### layoutId - 共享元素过渡

在具有相同 layoutId 的组件之间动画：

```vue
<script setup>
const selected = ref<string | null>(null)
</script>

<template>
  <div class="grid">
    <Motion.div
      v-for="item in items"
      :key="item.id"
      :layoutId="item.id"
      @click="selected = item.id"
    />
  </div>

  <AnimatePresence>
    <Motion.div
      v-if="selected"
      :layoutId="selected"
      class="expanded"
    />
  </AnimatePresence>
</template>
```

### LayoutGroup

同步组件之间的布局动画：

```vue
<script setup>
import { Motion, LayoutGroup } from 'motion-v'
</script>

<template>
  <LayoutGroup>
    <Motion.div layout />
    <Motion.div layout />
  </LayoutGroup>
</template>
```

## 过渡配置

### transition 属性

配置动画行为：

```vue
<Motion.div
  :animate="{ x: 100 }"
  :transition="{
    type: 'spring',
    stiffness: 100,
    damping: 10,
    mass: 1,
  }"
/>
```

### 过渡类型

**弹簧（默认）：**

```ts
{
  type: 'spring',
  stiffness: 100,  // 更高 = 更快响应（默认：100）
  damping: 10,     // 更高 = 更少反弹（默认：10）
  mass: 1,         // 更高 = 更慢（默认：1）
  velocity: 0,     // 初始速度
  restDelta: 0.01, // 结束阈值
}
```

**补间：**

```ts
{
  type: 'tween',
  duration: 0.3,
  ease: 'easeOut',  // 'linear' | 'easeIn' | 'easeOut' | 'easeInOut' | [0.42, 0, 0.58, 1]
  delay: 0,
  repeat: 0,        // 重复次数（Infinity 表示循环）
  repeatType: 'loop',  // 'loop' | 'reverse' | 'mirror'
  repeatDelay: 0,
}
```

**惯性（用于拖拽）：**

```ts
{
  type: 'inertia',
  velocity: 50,
  power: 0.8,
  timeConstant: 700,
  bounceStiffness: 500,
  bounceDamping: 10,
}
```

### 每个属性的过渡

```vue
<Motion.div
  :animate="{ x: 100, opacity: 1 }"
  :transition="{
    x: { type: 'spring', stiffness: 100 },
    opacity: { duration: 0.2 },
  }"
/>
```

## AnimatePresence

动画组件的挂载和卸载过程：

```vue
<script setup>
import { Motion, AnimatePresence } from 'motion-v'
</script>

<template>
  <AnimatePresence mode="wait">
    <Motion.div
      :key="currentPage"
      :initial="{ opacity: 0, x: 100 }"
      :animate="{ opacity: 1, x: 0 }"
      :exit="{ opacity: 0, x: -100 }"
    />
  </AnimatePresence>
</template>
```

### 模式选项

```vue
<AnimatePresence mode="sync" />   <!-- 默认：同时动画 -->
<AnimatePresence mode="wait" />   <!-- 等待退出完成再进入 -->
<AnimatePresence mode="popLayout" /> <!-- 从布局流中弹出退出动画 -->
```

## 事件

```vue
<Motion.div
  @animationStart="onStart"
  @animationComplete="onComplete"
  @update="onUpdate"              <!-- 每帧调用 -->
  @hoverStart="onHoverStart"
  @hoverEnd="onHoverEnd"
  @pressStart="onPressStart"
  @pressEnd="onPressEnd"
  @dragStart="onDragStart"
  @drag="onDrag"
  @dragEnd="onDragEnd"
  @viewportEnter="onEnter"
  @viewportLeave="onLeave"
/>
```
