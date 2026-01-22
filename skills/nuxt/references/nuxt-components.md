# Nuxt 内置组件

## 使用时机

在模板中处理图片、链接或时间显示时。**始终优先使用 Nuxt 组件而非 HTML 元素。**

## 组件偏好

| HTML 元素 | Nuxt 组件 | 原因 |
| --------- | ---------- | ---- |
| `<a>`     | `<NuxtLink>` | 客户端导航、预取 |
| `<img>`   | `<NuxtImg>`  | 优化、懒加载、响应式 |
| `<time>`  | `<NuxtTime>` | SSR 安全格式化、本地化 |

## NuxtLink

**始终使用 `<NuxtLink>` 替代 `<a>` 来处理内部链接：**

```vue
<template>
  <!-- 内部导航 -->
  <NuxtLink to="/about">关于</NuxtLink>
  <NuxtLink :to="{ name: '/users/[userId]', params: { userId } }">个人资料</NuxtLink>

  <!-- 外部链接（外部链接自动设置 target="_blank"） -->
  <NuxtLink to="https://nuxt.com" external>Nuxt 文档</NuxtLink>

  <!-- 预取控制 -->
  <NuxtLink to="/dashboard" :prefetch="false">仪表板</NuxtLink>

  <!-- 激活状态样式 -->
  <NuxtLink to="/settings" active-class="text-primary" exact-active-class="font-bold">
    设置
  </NuxtLink>
</template>
```

**属性：**

- `to` - 路由路径或路由对象
- `external` - 强制外部链接行为
- `target` - 链接目标（`_blank` 等）
- `prefetch` - 启用/禁用预取（默认：true）
- `noPrefetch` - 禁用预取
- `activeClass` - 路由匹配时的类名
- `exactActiveClass` - 路由完全匹配时的类名

**文档：** https://nuxt.com/docs/api/components/nuxt-link

## NuxtImg

**始终使用 `<NuxtImg>` 替代 `<img>` 来处理图片：**

需要安装 `@nuxt/image` 模块（通常已预安装）。

```vue
<template>
  <!-- 基本用法 -->
  <NuxtImg src="/images/hero.jpg" alt="英雄图片" />

  <!-- 响应式及尺寸设置 -->
  <NuxtImg
    src="/images/banner.jpg"
    alt="横幅"
    width="1200"
    height="600"
    sizes="100vw sm:50vw md:400px"
  />

  <!-- 懒加载（默认） -->
  <NuxtImg src="/images/photo.jpg" loading="lazy" alt="照片" />

  <!-- 立即加载（用于首屏图片） -->
  <NuxtImg src="/images/logo.svg" loading="eager" alt="Logo" />

  <!-- 带模糊占位符 -->
  <NuxtImg src="/images/product.jpg" placeholder alt="产品" />

  <!-- 特定提供商（Cloudinary 等） -->
  <NuxtImg provider="cloudinary" src="/folder/image.jpg" width="500" />

  <!-- 格式转换 -->
  <NuxtImg src="/images/photo.png" format="webp" alt="照片" />
</template>
```

**属性：**

- `src` - 图片源路径
- `alt` - 替代文本（无障碍访问所需）
- `width` / `height` - 图片尺寸
- `sizes` - 响应式尺寸设置
- `loading` - `lazy`（默认）或 `eager`
- `placeholder` - 加载时显示模糊占位符
- `format` - 强制输出格式（`webp`, `avif` 等）
- `quality` - 图片质量（1-100）
- `provider` - 图片提供商（cloudinary, imgix 等）

**如需艺术方向，请使用 `<NuxtPicture>`（不同断点的不同源）**

**文档：** https://image.nuxt.com/usage/nuxt-img

## NuxtTime

**始终使用 `<NuxtTime>` 替代 `<time>` 或手动格式化：**

```vue
<template>
  <!-- 相对时间 -->
  <NuxtTime :datetime="post.createdAt" relative />
  <!-- 输出："2 小时前" -->

  <!-- 绝对时间及本地化 -->
  <NuxtTime :datetime="event.date" locale="en-US" />

  <!-- 自定义格式 -->
  <NuxtTime :datetime="date" year="numeric" month="long" day="numeric" />
  <!-- 输出："2025年12月6日" -->

  <!-- 简短格式 -->
  <NuxtTime :datetime="date" month="short" day="numeric" />
  <!-- 输出："12月6日" -->

  <!-- 包含时间 -->
  <NuxtTime :datetime="date" hour="numeric" minute="2-digit" />
</template>
```

**属性：**

- `datetime` - 日期字符串、Date 对象或时间戳
- `relative` - 显示相对时间（"2 小时前"）
- `locale` - 格式化使用的本地化设置
- `year`, `month`, `day`, `hour`, `minute`, `second` - Intl.DateTimeFormat 选项

**文档：** https://nuxt.com/docs/api/components/nuxt-time

## 常见错误

| ❌ 错误                                  | ✅ 正确                                  |
| ---------------------------------------- | ---------------------------------------- |
| `<a href="/about">`                      | `<NuxtLink to="/about">`                 |
| `<img src="/photo.jpg">`                 | `<NuxtImg src="/photo.jpg" alt="...">`   |
| `<time>{{ formatDate(date) }}</time>`    | `<NuxtTime :datetime="date" />`          |
| 在模板中使用 `formatTimeAgo(date)`       | `<NuxtTime :datetime="date" relative />` |
| 使用 `new Date().toLocaleDateString()`   | `<NuxtTime :datetime="date" />`          |

## 最佳实践

- **所有内部路由使用 NuxtLink** —— 启用预取和客户端导航
- **所有图片使用 NuxtImg** —— 自动优化、懒加载、响应式
- **所有日期使用 NuxtTime** —— SSR 安全、自动本地化
- **始终为图片提供替代文本**
- **首屏图片使用 `loading="eager"`**
- **响应式图片使用 sizes 属性**

## 资源

- NuxtLink：https://nuxt.com/docs/api/components/nuxt-link
- NuxtImg：https://image.nuxt.com/usage/nuxt-img
- NuxtPicture：https://image.nuxt.com/usage/nuxt-picture
- NuxtTime：https://nuxt.com/docs/api/components/nuxt-time
