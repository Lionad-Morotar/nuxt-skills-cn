# 项目设置

新建 Nuxt 项目的标准模式：CI、ESLint、包脚本。

## CI 工作流

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with: {node-version: 22, cache: pnpm}
      - run: pnpm install --frozen-lockfile
      - run: pnpm prepare
      - run: pnpm lint
      - run: pnpm typecheck
      - run: pnpm test # 如果存在测试
```

**带环境变量：**

```yaml
env:
  DATABASE_URL: postgresql://test:test@localhost:5432/test
  API_KEY: test
```

## ESLint 配置

```js
// eslint.config.mjs
import antfu from '@antfu/eslint-config'
import withNuxt from './.nuxt/eslint.config.mjs'

export default withNuxt(
  antfu({
    formatters: true,
    vue: true,
    pnpm: true,
    ignores: ['.eslintcache', 'cache/**', '.claude/**', 'README.md', 'docs/**'],
  }),
)
```

**对于单仓库（monorepo），添加：**

```js
ignores: ['apps/web/.nuxt/**', 'packages/**/dist/**']
```

## 包脚本

```json
{
  "scripts": {
    "dev": "nuxt dev",
    "build": "nuxt build",
    "preview": "nuxt preview",
    "prepare": "nuxt prepare",
    "lint": "eslint . --cache",
    "lint:fix": "eslint . --fix --cache",
    "typecheck": "nuxt typecheck"
  }
}
```

## 核心规范

| 规范            | 标准                                                  |
| --------------- | ----------------------------------------------------- |
| 包管理器        | pnpm，并在 CI 中使用 `--frozen-lockfile`              |
| Node 版本       | 22-24                                                 |
| ESLint 基础     | @antfu/eslint-config                                  |
| 格式化工具      | 通过 ESLint（`formatters: true`），无需单独的 Prettier |
| 缓存            | 在 lint 脚本中使用 `--cache` 标志                      |
| Prepare 步骤    | 在 CI 中 lint/typecheck 之前必须执行                  |

## NuxtHub 部署

```yaml
# .github/workflows/nuxthub.yml
name: Deploy to NuxtHub
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    permissions: {contents: read, id-token: write}
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with: {node-version: 22, cache: pnpm}
      - run: pnpm install
      - uses: nuxt-hub/action@v2
        with:
          project-key: your-project-key
```

> **对于 pnpm 目录、发布工作流、tsconfig 模式：** 请参见 `personal-ts-setup` 技能
