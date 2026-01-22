# NuxtHub v0.10.4 的 Wrangler 配置

**默认设置（推荐）：** NuxtHub 会根据您在 `nuxt.config.ts` 中的 `hub` 配置自动生成 `wrangler.json`。无需手动编写 `wrangler.jsonc`。

**手动编写 wrangler.jsonc：** 当您需要使用未自动生成的功能（如可观测性、迁移配置等）或偏好显式文件配置时使用。

## 最小配置（仅数据库）

```jsonc
{
  "$schema": "node_modules/wrangler/config-schema.json",
  "name": "my-app",
  "compatibility_flags": ["nodejs_compat"],
  "d1_databases": [{ "binding": "DB", "database_name": "my-app-db", "database_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" }]
}
```

## 全栈配置（数据库 + KV + Blob + 缓存）

```jsonc
{
  "$schema": "node_modules/wrangler/config-schema.json",
  "name": "my-app",
  "compatibility_flags": ["nodejs_compat"],
  "d1_databases": [{ "binding": "DB", "database_name": "my-app-db", "database_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" }],
  "kv_namespaces": [
    { "binding": "KV", "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" },
    { "binding": "CACHE", "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" }
  ],
  "r2_buckets": [{ "binding": "BLOB", "bucket_name": "my-app-bucket" }]
}
```

## 可观测性（生产环境推荐）

启用日志记录以跟踪性能并调试问题：

```jsonc
{
  "observability": {
    "logs": {
      "enabled": true,          // 启用日志收集
      "head_sampling_rate": 1,  // 采样率 0-1（1 = 100% 的请求）
      "invocation_logs": true,  // 记录函数调用
      "persist": true           // 将日志持久化到存储
    }
  }
}
```

**所需权限：** 在您的 Cloudflare API token 中具有 `workers_observability`（编辑）权限。

参见 [Cloudflare 可观测性文档](https://developers.cloudflare.com/workers/observability/logs/)。

## D1 迁移配置

指定迁移表和目录：

```jsonc
{
  "d1_databases": [{
    "binding": "DB",
    "database_id": "<id>",
    "migrations_table": "_hub_migrations",
    "migrations_dir": ".output/server/db/migrations/"
  }]
}
```

## 必需的绑定名称

| 功能         | 绑定名称     | 类型           |
| ------------ | ------------ | -------------- |
| 数据库       | `DB`         | D1             |
| 键值存储     | `KV`         | KV 命名空间    |
| 缓存         | `CACHE`      | KV 命名空间    |
| Blob 存储    | `BLOB`       | R2 存储桶      |

## 通过 CLI 创建资源

```bash
# D1 数据库
npx wrangler d1 create my-app-db
# 输出：database_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# 用于存储的 KV 命名空间
npx wrangler kv namespace create KV
# 输出：id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# 用于缓存的 KV 命名空间
npx wrangler kv namespace create CACHE
# 输出：id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# R2 存储桶
npx wrangler r2 bucket create my-app-bucket
# 存储桶名称直接使用，无需 ID
```

## 多环境配置

```jsonc
{
  "$schema": "node_modules/wrangler/config-schema.json",
  "name": "my-app",
  "compatibility_flags": ["nodejs_compat"],
  "d1_databases": [{ "binding": "DB", "database_name": "my-app-db-prod", "database_id": "prod-db-id" }],
  "env": {
    "staging": {
      "d1_databases": [{ "binding": "DB", "database_name": "my-app-db-staging", "database_id": "staging-db-id" }]
    }
  }
}
```

部署命令：`CLOUDFLARE_ENV=staging nuxt build && npx wrangler deploy`

## 从 nuxt.config 自动生成（推荐）

NuxtHub 在构建时根据您的 `hub` 配置自动生成 `wrangler.json`：

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

**高级选项：** 使用 `nitro.cloudflare.wrangler` 获取显式控制：

```ts
export default defineNuxtConfig({
  nitro: {
    cloudflare: {
      wrangler: {
        compatibility_flags: ['nodejs_compat'],
        d1_databases: [{ binding: 'DB', database_id: '<id>' }],
        kv_namespaces: [
          { binding: 'KV', id: '<kv-id>' },
          { binding: 'CACHE', id: '<cache-id>' }
        ],
        r2_buckets: [{ binding: 'BLOB', bucket_name: '<bucket>' }]
      }
    }
  }
})
```
