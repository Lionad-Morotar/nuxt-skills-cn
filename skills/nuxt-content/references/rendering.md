# 内容渲染

> **关于写作风格/结构：** 请参见 `document-writer` 技能

## 使用时机

在使用 `<ContentRenderer>`、MDC 语法、自定义散文组件或代码高亮时。

## ContentRenderer

渲染解析后的 markdown 内容体：

```vue
<script setup lang="ts">
const post = await queryCollection('blog')
  .where('path', '=', '/blog/my-post')
  .first()
</script>

<template>
  <ContentRenderer v-if="post" :value="post" />
</template>
```

**使用自定义包装器：**

```vue
<ContentRenderer :value="post">
  <template #default="{ body }">
    <article class="prose">
      <component :is="body" />
    </article>
  </template>
</ContentRenderer>
```

## MDC 语法

在 Markdown 中使用 Vue 组件：

```md
<!-- 行内组件 -->

:icon{name="heroicons:star"}

<!-- 块级组件 -->

::callout{type="warning"}
这是一条警告信息。
::

<!-- 带插槽 -->

::card
#title
卡片标题

#default
卡片内容放在这里。
::

<!-- 嵌套组件 -->

::grid{cols="2"}
::card
第一张卡片
::

::card
第二张卡片
::
::
```

## 组件属性

```md
<!-- 字符串属性 -->

:badge{label="新"}

<!-- 布尔属性 -->

::collapse{open}
内容
::

<!-- 对象/数组属性（YAML） -->

## ::chart

data:

- value: 10
- value: 20

---

::
```

## MDC 组件位置

位于 `components/content/` 中的组件会自动注册以供 MDC 使用：

```
components/
└── content/
    ├── Callout.vue      → ::callout
    ├── ProseCode.vue    → 代码块
    └── ProseH2.vue      → ## 标题
```

## 散文组件

用自定义组件覆盖默认 HTML 元素：

| 元素           | 组件                 | Markdown      |
| -------------- | -------------------- | ------------- |
| `<p>`          | `ProseP`             | 段落          |
| `<h1>`-`<h6>`  | `ProseH1`-`ProseH6`  | `#` 标题     |
| `<a>`          | `ProseA`             | `[链接](url)` |
| `<code>`       | `ProseCode`          | `` `代码` ``  |
| `<pre>`        | `ProsePre`           | 代码块        |
| `<ul>`, `<ol>` | `ProseUl`, `ProseOl` | 列表          |
| `<img>`        | `ProseImg`           | `![alt](src)` |
| `<table>`      | `ProseTable`         | 表格          |
| `<blockquote>` | `ProseBlockquote`    | `>` 引用      |

**自定义散文组件：**

```vue
<!-- components/content/ProseH2.vue -->
<template>
  <h2 :id="id" class="group">
    <a :href="`#${id}`" class="anchor">
      <slot />
    </a>
  </h2>
</template>

<script setup lang="ts">
defineProps<{ id?: string }>()
</script>
```

## 代码高亮

Shiki 提供语法高亮。在 `nuxt.config.ts` 中配置：

```ts
export default defineNuxtConfig({
  content: {
    build: {
      markdown: {
        highlight: {
          theme: 'github-dark',
          // 或多主题
          themes: {
            default: 'github-light',
            dark: 'github-dark',
          },
          // 额外语言
          langs: ['vue', 'typescript', 'bash', 'yaml'],
        },
      },
    },
  },
})
```

**在 Markdown 中：**

````md
```ts
const foo = 'bar'
```

```vue
<template>
  <div>Hello</div>
</template>
```
````

**行高亮：**

````md
```ts {2,4-6}
const a = 1
const b = 2  // 高亮
const c = 3
const d = 4  // 高亮
const e = 5  // 高亮
const f = 6  // 高亮
```
````

**显示文件名：**

````md
```ts [nuxt.config.ts]
export default defineNuxtConfig({})
```
````

## 自定义组件示例

**警告组件：**

```vue
<!-- components/content/Alert.vue -->
<template>
  <div :class="['alert', `alert-${type}`]">
    <slot />
  </div>
</template>

<script setup lang="ts">
withDefaults(defineProps<{ type?: 'info' | 'warning' | 'error' }>(), {
  type: 'info',
})
</script>
```

在 Markdown 中使用：

```md
::alert{type="warning"}
小心此操作。
::
```

## 目录

从解析的内容中获取目录：

```vue
<script setup lang="ts">
const post = await queryCollection('blog').where('path', '=', route.path).first()
const toc = post?.body?.toc?.links || []
</script>

<template>
  <nav>
    <ul>
      <li v-for="link in toc" :key="link.id">
        <a :href="`#${link.id}`">{{ link.text }}</a>
      </li>
    </ul>
  </nav>
</template>
```

## 最佳实践

| 做法                                     | 不做法                           |
| ---------------------------------------- | -------------------------------- |
| 使用 MDC 来复用内容模式                  | 在 Markdown 中嵌入原始 HTML      |
| 创建语义化的散文组件                     | 无目的覆盖散文组件               |
| 使用与设计匹配的 Shiki 主题              | 混用多个高亮库                   |
| 利用插槽实现灵活组件                     | 硬编码所有组件内容               |

## 资源

- MDC 语法：https://content.nuxt.com/docs/files/markdown#mdc-syntax
- 散文组件：https://content.nuxt.com/docs/components/prose
- ContentRenderer：https://content.nuxt.com/docs/components/content-renderer
