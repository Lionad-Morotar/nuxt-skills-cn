# 动效组合项

## useMotionValue

创建用于高性能动画的动效值，绕过 Vue 的响应式系统：

```vue
<script setup>
import { Motion, useMotionValue } from 'motion-v'

const x = useMotionValue(0)

// 读/写值
console.log(x.get())
x.set(100)

// 订阅变更
const unsubscribe = x.on('change', (latest) => {
  console.log('x 变更为', latest)
})
</script>

<template>
  <Motion.div :style="{ x }" />
</template>
```

## useSpring

创建弹簧动画的动效值：

```vue
<script setup>
import { useMotionValue, useSpring } from 'motion-v'

const x = useMotionValue(0)
const springX = useSpring(x, {
  stiffness: 100,
  damping: 10,
  mass: 1,
})

// springX 跟随 x，采用弹簧物理效果
x.set(100)
</script>

<template>
  <Motion.div :style="{ x: springX }" />
</template>
```

## useTransform

从其他动效值中派生动效值：

```vue
<script setup>
import { useMotionValue, useTransform } from 'motion-v'

const x = useMotionValue(0)

// 映射 x：0-100 到 opacity：1-0
const opacity = useTransform(x, [0, 100], [1, 0])

// 映射 x：0-100 到 scale：1-2
const scale = useTransform(x, [0, 100], [1, 2])

// 自定义转换函数
const rotate = useTransform(x, (value) => `${value}deg`)

// 组合多个值
const combined = useTransform([x, opacity], ([x, opacity]) => {
  return x * opacity
})
</script>

<template>
  <Motion.div :style="{ x, opacity, scale, rotate }" />
</template>
```

### useTransform 中的缓动函数

```ts
import { easeInOut } from 'motion-v'

const opacity = useTransform(x, [0, 100], [0, 1], { ease: easeInOut })
```

## useMotionTemplate

从动效值创建模板字符串：

```vue
<script setup>
import { useMotionValue, useMotionTemplate } from 'motion-v'

const x = useMotionValue(0)
const y = useMotionValue(0)

// 创建 "translateX(0px) translateY(0px)"
const transform = useMotionTemplate`translateX(${x}px) translateY(${y}px)`

// 用于渐变、阴影等
const blur = useMotionValue(5)
const filter = useMotionTemplate`blur(${blur}px)`
</script>
```

## useScroll

追踪窗口或元素的滚动进度：

```vue
<script setup>
import { useScroll, useTransform, Motion } from 'motion-v'

// 窗口滚动
const { scrollX, scrollY, scrollXProgress, scrollYProgress } = useScroll()

// 元素滚动
const containerRef = ref<HTMLElement>()
const { scrollYProgress: containerProgress } = useScroll({
  container: containerRef,
})

// 视口内元素的进度
const targetRef = ref<HTMLElement>()
const { scrollYProgress: targetProgress } = useScroll({
  target: targetRef,
  offset: ['start end', 'end start'],  // 跟踪开始/结束时
})

// 将滚动转换为动画值
const opacity = useTransform(scrollYProgress, [0, 0.5], [0, 1])
const scale = useTransform(scrollYProgress, [0, 1], [0.8, 1])
</script>

<template>
  <Motion.div :style="{ opacity, scale }" />
</template>
```

### 滚动偏移选项

```ts
offset: ['start end', 'end start']
// 第一个：目标位置相对于容器
// 第二个：容器位置相对于视口

// 常见模式：
['start end', 'end start']     // 元素从底部进入，顶部退出
['start start', 'end start']   // 滚动时固定在顶部
['center center', 'end start'] // 居中动画
```

## useInView

检测元素在视口中的可见性：

```vue
<script setup>
import { useInView } from 'motion-v'

const ref = ref<HTMLElement>()
const isInView = useInView(ref, {
  once: true,           // 仅触发一次
  amount: 0.5,          // 50% 可见时触发
  margin: '-100px',     // 缩小视口检测区域
})

watch(isInView, (inView) => {
  if (inView) console.log('元素可见')
})
</script>

<template>
  <div ref="ref">追踪元素</div>
</template>
```

## useAnimationFrame

每帧执行回调并传入时间差：

```vue
<script setup>
import { useMotionValue, useAnimationFrame } from 'motion-v'

const rotation = useMotionValue(0)

useAnimationFrame((time, delta) => {
  // time：总流逝毫秒数
  // delta：自上一帧起的毫秒数
  rotation.set(rotation.get() + delta * 0.1)
})
</script>

<template>
  <Motion.div :style="{ rotate: rotation }">旋转中</Motion.div>
</template>
```

## animate()

命令式动画函数：

```ts
import { animate } from 'motion-v'

// 动画值
const controls = animate(0, 100, {
  duration: 0.5,
  onUpdate: (latest) => console.log(latest),
  onComplete: () => console.log('完成'),
})

// 控制动画
controls.stop()
controls.time = 0.25  // 跳转到 25%

// 动画动效值
const x = useMotionValue(0)
animate(x, 100, { type: 'spring' })

// 动画对象
animate(
  { x: 0, y: 0 },
  { x: 100, y: 100 },
  {
    duration: 1,
    onUpdate: ({ x, y }) => console.log(x, y),
  }
)
```

### 序列动画

```ts
import { animate, stagger } from 'motion-v'

// 按顺序动画元素
const elements = document.querySelectorAll('.item')

animate(elements, { opacity: 1, y: 0 }, {
  delay: stagger(0.1),  // 每个间隔 0.1s
  duration: 0.5,
})

// 自定义交错延迟
animate(elements, { opacity: 1 }, {
  delay: stagger(0.1, {
    start: 0.5,           // 开始延迟
    from: 'center',       // 'first' | 'last' | 'center' | number
    ease: 'easeOut',
  }),
})
```

## useVelocity

追踪动效值的速度：

```vue
<script setup>
import { useMotionValue, useVelocity, useTransform } from 'motion-v'

const x = useMotionValue(0)
const xVelocity = useVelocity(x)

// 基于速度的倾斜
const skewX = useTransform(xVelocity, [-1000, 0, 1000], [-25, 0, 25])
</script>
```

## useReducedMotion

尊重用户的动画偏好设置：

```vue
<script setup>
import { useReducedMotion } from 'motion-v'

const prefersReduced = useReducedMotion()
</script>

<template>
  <Motion.div
    :animate="{ x: 100 }"
    :transition="prefersReduced ? { duration: 0 } : { type: 'spring' }"
  />
</template>
```
