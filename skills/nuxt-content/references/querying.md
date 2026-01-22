# 查询内容

## 使用时机

使用 `queryCollection()`、构建导航、实现搜索或获取上一项/下一项内容时。

## 查询构建器

```ts
const posts = await queryCollection('blog')
  .where('draft', '=', false)
  .order('date', 'DESC')
  .limit(10)
  .all()

// 单个项目
const post = await queryCollection('blog')
  .where('path', '=', '/blog/my-post')
  .first()

// 计数
const total = await queryCollection('blog')
  .where('category', '=', 'tech')
  .count()
```

## 操作符

| 操作符               | 示例                                     | 描述               |
| -------------------- | ---------------------------------------- | ------------------ |
| `=`                  | `where('status', '=', 'published')`      | 精确匹配           |
| `<>`                 | `where('status', '<>', 'draft')`         | 不等于             |
| `>`, `<`, `>=`, `<=` | `where('order', '>', 5)`                 | 比较               |
| `IN`                 | `where('tag', 'IN', ['vue', 'nuxt'])`    | 匹配数组中任意项   |
| `BETWEEN`            | `where('date', 'BETWEEN', [start, end])` | 范围包含           |
| `LIKE`               | `where('title', 'LIKE', '%vue%')`        | 模式匹配           |
| `IS NULL`            | `where('image', 'IS NULL', true)`        | 空值检查           |
| `IS NOT NULL`        | `where('image', 'IS NOT NULL', true)`    | 非空检查           |

## 复杂查询

```ts
// AND 条件
const posts = await queryCollection('blog')
  .where('draft', '=', false)
  .andWhere(group => group
    .where('category', '=', 'tech')
    .orWhere('featured', '=', true)
  )
  .all()

// OR 条件
const posts = await queryCollection('blog')
  .where('author', '=', 'john')
  .orWhere('author', '=', 'jane')
  .all()
```

## 选择字段

```ts
// 选择特定字段（减少负载）
const titles = await queryCollection('blog')
  .select('title', 'path', 'date')
  .all()
```

## 导航

生成分层导航树：

```ts
// 在 pages/[...slug].vue 或 composables 中
const navigation = await queryCollectionNavigation('docs')

// 使用自定义字段
const navigation = await queryCollectionNavigation('docs', ['title', 'icon', 'description'])
```

返回嵌套结构：

```ts
[
  {
    title: '入门指南',
    path: '/docs/getting-started',
    children: [
      { title: '安装', path: '/docs/getting-started/installation' },
      { title: '配置', path: '/docs/getting-started/configuration' },
    ]
  }
]
```

**通过 frontmatter 控制导航：**

```yaml
---
navigation: false # 从导航中排除
---
```

或使用自定义标题：

```yaml
---
navigation:
  title: 简短标题
  icon: heroicons:home
---
```

## 周边内容（上一项/下一项）

```ts
const { prev, next } = await queryCollectionItemSurroundings(
  'docs',
  '/docs/current-page',
  { before: 1, after: 1 }
)

// 指定字段
const { prev, next } = await queryCollectionItemSurroundings(
  'docs',
  currentPath,
  { before: 1, after: 1, fields: ['title', 'path', 'description'] }
)
```

## 搜索段落

将页面拆分为可搜索段落：

```ts
const sections = await queryCollectionSearchSections('docs', {
  minHeading: 2,  // 索引的最小标题级别（v3.10+）
  maxHeading: 4,  // 索引的最大标题级别（v3.10+）
})

// 返回
  [
    {
      id: 'docs:getting-started#installation',
      title: '安装',
      titles: ['入门指南', '安装'],
      content: '段落文本内容...',
      path: '/docs/getting-started',
    }
  ]

// 包含额外字段（v3.4+）
const sections = await queryCollectionSearchSections('docs', {
  minHeading: 2,
  maxHeading: 3,
  fields: ['description', 'category'],
})
```

## 服务端查询

在服务路由中传递事件：

```ts
// server/api/posts.get.ts
export default defineEventHandler(async (event) => {
  return await queryCollection(event, 'blog')
    .where('draft', '=', false)
    .all()
})
```

## 常见模式

**最新文章：**

```ts
const latest = await queryCollection('blog')
  .where('draft', '=', false)
  .order('date', 'DESC')
  .limit(5)
  .all()
```

**按标签筛选文章：**

```ts
const tagged = await queryCollection('blog')
  .where('tags', 'LIKE', `%${tag}%`)
  .all()
```

**分页列表：**

```ts
const page = 1
const perPage = 10
const posts = await queryCollection('blog')
  .order('date', 'DESC')
  .skip((page - 1) * perPage)
  .limit(perPage)
  .all()
```

**精选 + 最新：**

```ts
const [featured, recent] = await Promise.all([
  queryCollection('blog').where('featured', '=', true).first(),
  queryCollection('blog').order('date', 'DESC').limit(5).all(),
])
```

## 最佳实践

| 应该                              | 不应                               |
| --------------------------------- | ---------------------------------- |
| 使用 `.select()` 以减少负载       | 当仅需少数字段时仍获取所有字段     |
| 缓存导航查询                      | 每页都重建导航                     |
| 使用 `.first()` 获取单个项目      | 使用 `.all()[0]`                   |
| 在服务端路由中传递事件            | 服务端忽略事件                     |

## 工具函数（v3.6+）

用于常见导航模式的辅助函数：

```ts
// 查找页面标题（第一个 H1）
const headline = findPageHeadline(page)

// 获取面包屑路径
const breadcrumb = findPageBreadcrumb(navigation, '/docs/collections/schema')
// 返回：[{ title: '文档', path: '/docs' }, { title: '集合', path: '/docs/collections' }, ...]

// 获取页面的直接子项
const children = findPageChildren(navigation, '/docs/collections')

// 获取同级页面（同一层级的前后项）
const siblings = findPageSiblings(navigation, '/docs/collections/schema')
```

## 资源

- 查询 API：https://content.nuxt.com/docs/querying/query-collection
- 导航：https://content.nuxt.com/docs/querying/query-collection-navigation
- 搜索：https://content.nuxt.com/docs/querying/query-collection-search-sections
