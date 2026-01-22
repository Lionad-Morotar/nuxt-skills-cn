# 多云部署模式

NuxtHub 支持 Cloudflare、Vercel、Netlify 以及其他云提供商，基于环境自动检测。

## Cloudflare

**主要部署目标** - 完整功能支持（D1、KV、R2、缓存）。

### 自动配置

NuxtHub 从 hub 配置生成 wrangler.json：

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  hub: {
    db: {
      dialect: 'sqlite',
      driver: 'd1',
      connection: { databaseId: '<database-id>' }
    },
    kv: {
      driver: 'cloudflare-kv-binding',
      namespaceId: '<kv-namespace-id>'
    },
    cache: {
      driver: 'cloudflare-kv-binding',
      namespaceId: '<cache-namespace-id>'
    },
    blob: {
      driver: 'cloudflare-r2',
      bucketName: '<bucket-name>'
    }
  }
})
```

### 可观测性（推荐）

启用生产日志：

```jsonc
// wrangler.jsonc
{
  "observability": {
    "logs": {
      "enabled": true,
      "head_sampling_rate": 1,
      "invocation_logs": true,
      "persist": true
    }
  }
}
```

### 创建资源

```bash
npx wrangler d1 create my-db
npx wrangler kv namespace create KV
npx wrangler kv namespace create CACHE
npx wrangler r2 bucket create my-bucket
```

### 环境

```bash
# 生产环境
npx nuxi build

# 预览/预发环境
CLOUDFLARE_ENV=preview npx nuxi build
```

在 wrangler.jsonc 中配置：

```jsonc
{
  "d1_databases": [{ "binding": "DB", "database_id": "prod-id" }],
  "env": {
    "preview": {
      "d1_databases": [{ "binding": "DB", "database_id": "preview-id" }]
    }
  }
}
```

## Vercel

通过市场集成在 Vercel 上部署 NuxtHub 应用。

### 数据库

**选项 1：Vercel Postgres**

```bash
# 通过 Vercel 控制台：Storage > Create Database > Postgres
# 从环境变量获取 DATABASE_URL
```

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  hub: {
    db: {
      dialect: 'postgresql',
      driver: 'postgres-js'
      // 自动检测 DATABASE_URL 环境变量
    }
  }
})
```

**选项 2：Turso（SQLite）**

```bash
# 通过 Vercel 市场安装
# 获取 TURSO_DATABASE_URL 和 TURSO_AUTH_TOKEN
```

```ts
hub: {
  db: {
    dialect: 'sqlite',
    driver: 'libsql'
    // 自动检测 TURSO_* 环境变量
  }
}
```

### KV 存储

**Vercel KV（Upstash Redis）**

```bash
# 通过 Vercel 控制台：Storage > Create > KV
# 获取 KV_REST_API_URL 和 KV_REST_API_TOKEN
```

```ts
hub: {
  kv: true
  // 通过环境变量自动检测 Vercel KV
}
```

**替代方案：Upstash Redis**

```ts
hub: {
  kv: {
    driver: 'redis',
    // UPSTASH_REDIS_REST_URL 和 UPSTASH_REDIS_REST_TOKEN
  }
}
```

### Blob 存储

**Vercel Blob**

```bash
# 通过 Vercel 控制台：Storage > Create > Blob
# 获取 BLOB_READ_WRITE_TOKEN
```

```ts
hub: {
  blob: true
  // 通过环境变量自动检测 Vercel Blob
}
```

### 缓存

使用 Vercel 运行时缓存（内置）：

```ts
hub: {
  cache: true
  // 在生产环境中自动使用 Vercel 运行时缓存
}
```

## Netlify

通过外部数据库提供商兼容 NuxtHub。

### 数据库

通过环境变量使用外部提供商：

- **Turso：** `TURSO_DATABASE_URL`、`TURSO_AUTH_TOKEN`
- **Neon：** `DATABASE_URL`（PostgreSQL）
- **PlanetScale：** `DATABASE_URL`（MySQL）

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  hub: {
    db: {
      dialect: 'sqlite',
      driver: 'libsql' // 或 postgres-js、mysql2
    }
  }
})
```

### KV 存储

- **Upstash Redis：** `UPSTASH_REDIS_REST_URL`、`UPSTASH_REDIS_REST_TOKEN`
- **AWS S3（作为 KV）：** `S3_ACCESS_KEY_ID`、`S3_SECRET_ACCESS_KEY`、`S3_BUCKET`、`S3_REGION`

```ts
hub: {
  kv: true // 自动检测提供商
}
```

### Blob 存储

**AWS S3**

```bash
# 在 Netlify 控制台设置环境变量
S3_ACCESS_KEY_ID=<key>
S3_SECRET_ACCESS_KEY=<secret>
S3_BUCKET=<bucket-name>
S3_REGION=<region>
```

```ts
hub: {
  blob: true // 自动检测 S3 配置
}
```

## 其他提供商（通用）

### Deno Deploy

**Deno KV**（自动检测）：

```ts
hub: {
  kv: true // 使用 Deno.openKv()
}
```

### AWS / 自托管

**数据库：**

- PostgreSQL：`DATABASE_URL`
- MySQL：`DATABASE_URL` 或 `MYSQL_URL`
- SQLite：本地文件系统

**Blob（S3）：**

```ts
hub: {
  blob: {
    driver: 's3',
    // S3_* 环境变量
  }
}
```

**KV（S3 或 Redis）：**

```ts
hub: {
  kv: {
    driver: 'redis',
    // REDIS_URL 或 S3 配置
  }
}
```

## 提供商检测

NuxtHub 通过以下方式自动检测托管环境：

1. `NITRO_PRESET` 环境变量
2. 平台特定的环境变量（Vercel、Netlify、Cloudflare）
3. hub 配置中的显式驱动器配置

**手动覆盖：**

```ts
nitro: {
  preset: 'cloudflare-pages' // 或 'vercel'、'netlify' 等
}
```

## 环境变量摘要

| 提供商     | 数据库                      | KV                                     | Blob                    |
| ---------- | --------------------------- | -------------------------------------- | ----------------------- |
| Cloudflare | 配置（database_id）         | 配置（namespace_id）                   | 配置（bucket_name）     |
| Vercel     | `DATABASE_URL`              | `KV_REST_API_URL`、`KV_REST_API_TOKEN` | `BLOB_READ_WRITE_TOKEN` |
| Netlify    | `DATABASE_URL`、`TURSO_*`   | `UPSTASH_*`、`S3_*`                    | `S3_*`                  |
| 通用       | `DATABASE_URL`、`MYSQL_URL` | `REDIS_URL`、`UPSTASH_*`、`S3_*`       | `S3_*`                  |
| Deno       | `DATABASE_URL` 或 Turso     | 自动（Deno.openKv）                    | `S3_*`                  |

## 最佳实践

1. **Cloudflare：** 在 nuxt.config 中使用 hub 配置，在 wrangler.jsonc 中添加可观测性
2. **Vercel：** 利用 Vercel 市场获取托管服务
3. **其他提供商：** 使用环境变量存储凭证，避免在配置中硬编码
4. **开发：** 使用 `hub.remote: true` 在本地测试生产绑定
5. **密钥：** 存储在平台的密钥管理器中，而非 Git 中
