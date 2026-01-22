# 数据库集成

## NuxtHub 设置

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@nuxthub/core', '@onmax/nuxt-better-auth'],
  hub: { database: true },
  auth: {
    secondaryStorage: true,  // 可选：用于会话缓存的 KV
    schema: {
      usePlural: false,      // user vs users
      casing: 'camelCase'    // camelCase 或 snake_case
    }
  }
})
```

## 模式生成

该模块通过 Better Auth 的模式生成 API 从 Better Auth 表中自动生成 Drizzle 模式。可通过以下方式获取模式：

```ts
import { user, session, account, verification } from '#auth/database'
```

## 使用外键创建自定义表

通过从 `hub:db` 导入 `schema` 创建引用认证表的应用程序表。NuxtHub 会自动将自定义模式与 Better Auth 表合并。

```ts
// server/db/schema.ts
import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core'
import { schema } from 'hub:db'

export const posts = sqliteTable('posts', {
  id: text('id').primaryKey(),
  title: text('title').notNull(),
  authorId: text('author_id').notNull()
    .references(() => schema.user.id),
  createdAt: integer('created_at', { mode: 'timestamp' })
    .$defaultFn(() => new Date()),
})
```

**可用的认证表：**

- `schema.user` - 用户账户
- `schema.session` - 活跃会话
- `schema.account` - OAuth 提供程序账户
- `schema.verification` - 邮箱验证令牌
- 插件表：`schema.passkey`, `schema.twoFactor` 等

**ID 类型匹配：**

- SQLite/MySQL：使用 `text()` 或 `varchar()`
- PostgreSQL 使用 UUID：当 `advanced.database.generateId = 'uuid'` 时使用 `uuid()`

**迁移：**

```bash
npx nuxt db generate  # 生成迁移文件
npx nuxt db migrate   # 应用（开发环境下自动执行）
```

**向认证表添加列：** 使用 Better Auth 的 `additionalFields` 而非自定义模式。参见 [Better Auth Additional Fields](https://better-auth.com/docs/concepts/database#additional-fields)。

## 数据库方言

支持：`sqlite`、`postgresql`、`mysql`

模式语法根据方言调整：

- SQLite：`integer('id').primaryKey()`
- PostgreSQL/MySQL：`uuid('id').primaryKey()` 或 `text('id').primaryKey()`

## 模式选项

```ts
auth: {
  schema: {
    usePlural: true,    // 表名：users, sessions, accounts
    casing: 'snake_case' // 列名：created_at, updated_at
  }
}
```

| 选项         | 默认值        | 描述                     |
| ------------ | ------------- | ------------------------ |
| `usePlural`  | `false`       | 表名使用复数形式         |
| `casing`     | `'camelCase'` | 列命名规范               |

## 扩展模式

通过 NuxtHub 的模式钩子添加自定义列：

```ts
// server/plugins/extend-schema.ts
export default defineNitroPlugin(() => {
  useNitroApp().hooks.hook('hub:db:schema:extend', (schema) => {
    // 添加自定义表或扩展现有表
  })
})
```

## 辅助存储（KV）

启用 KV 以缓存会话：

```ts
auth: {
  secondaryStorage: true
}
```

需要在配置中设置 `hub.kv: true`。提升会话查找性能。

## 带数据库的服务器配置

数据库适配器通过上下文注入：

```ts
// server/auth.config.ts
import { defineServerAuth } from '#auth/server'

export default defineServerAuth(({ db }) => ({
  database: db,  // 当 hub.database: true 时已配置
  emailAndPassword: { enabled: true }
}))
```

## 手动数据库设置

未使用 NuxtHub 时，手动配置：

```ts
// server/auth.config.ts
import { drizzle } from 'drizzle-orm/...'
import { defineServerAuth } from '#auth/server'

const db = drizzle(...)

export default defineServerAuth(() => ({
  database: drizzleAdapter(db, { provider: 'sqlite' })
}))
```

## 迁移

Better Auth 在首次运行时自动创建表。生产环境中生成迁移文件：

```bash
# 使用 Better Auth CLI
npx better-auth generate
```
