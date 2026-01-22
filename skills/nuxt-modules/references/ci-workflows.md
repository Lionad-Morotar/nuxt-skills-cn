# CI 工作流模板

用于 GitHub Actions 的复制粘贴模板。

## 目录

- [ci.yml](#ciyml) - 代码检查、类型检查、测试
- [pkg.yml](#pkgyml) - 通过 pkg-pr-new 预览包
- [release.yml](#releaseyml) - npm 发布 + GitHub 发布
- [npm 可信发布设置](#npm-trusted-publishing-setup)

---

## ci.yml

在每次推送/拉取请求/标签推送时运行代码检查、类型检查和测试。

```yaml
name: ci

on:
  push:
    branches: [main]
    tags: ['v*']
  pull_request:
    branches: [main]

jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm

      - run: pnpm install
      - run: pnpm dev:prepare
      - run: pnpm lint
      - run: pnpm typecheck
      - run: pnpm test
```

## pkg.yml

通过 pkg-pr-new 为每次拉取请求发布预览包。

```yaml
name: pkg.new

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  pkg:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm

      - run: pnpm install
      - run: pnpm dev:prepare
      - run: pnpm prepack
      - run: pnpm dlx pkg-pr-new publish
```

## release.yml

由标签推送触发。等待 CI 完成后，通过 OIDC 发布到 npm 并创建 GitHub 发布。

```yaml
name: release

permissions:
  id-token: write
  contents: write
  actions: read

on:
  push:
    tags:
      - 'v*'

jobs:
  wait-for-ci:
    runs-on: ubuntu-latest
    steps:
      - name: Wait for CI to complete
        uses: lewagon/wait-on-check-action@v1.3.4
        with:
          ref: ${{ github.sha }}
          check-name: ci
          repo-token: ${{ secrets.GITHUB_TOKEN }}
          wait-interval: 10

  release:
    needs: wait-for-ci
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 24
          cache: pnpm
          registry-url: 'https://registry.npmjs.org'

      - run: pnpm install
      - run: pnpm dev:prepare
      - run: pnpm prepack

      - name: GitHub Release
        run: pnpm dlx changelogithub
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}

      - name: Publish to npm
        run: npm publish --provenance --access public
```

## npm 可信发布设置（OIDC）

**首选方式** - 无需 `NPM_TOKEN` 秘密。使用 OIDC 实现安全、无令牌的身份验证。

**另见：** [ts-library/ci-workflows.md](../../ts-library/references/ci-workflows.md) 了解通用 TypeScript 库 CI 模式。

### 要求

1. **Node.js 24+**（OIDC 需要 npm 11.5.1+ —— Node 22 的 npm 为 10.x，会失败）
2. **工作流权限**：`id-token: write`
3. **发布命令**：必须包含 `--provenance` 标志
4. **package.json**：必须有 `repository` 字段以进行来源验证
5. **npm 2FA 设置**：设置为“需要 2FA 或细粒度访问令牌”（第一项，允许使用令牌）

### package.json 要求

每个包必须有 `repository` 字段，否则来源验证失败：

```json
{
  "name": "my-package",
  "repository": { "type": "git", "url": "git+https://github.com/org/repo.git" }
}
```

### 设置步骤

1. **打开包设置**：`https://www.npmjs.com/package/<PACKAGE_NAME>/access`
2. **滚动至“发布权限”** 部分
3. **在可信发布者下点击“添加 GitHub Actions”**
4. **填写表单**：
   - 所有者：`<github-org-or-username>`
   - 仓库：`<repo-name>`
   - 工作流文件：`release.yml`
   - 环境变量：（留空）
5. **点击“添加”**

为单体仓库中的每个包重复此操作。

### 故障排除

| 错误                                         | 原因                    | 解决方案                                                            |
| --------------------------------------------- | ------------------------ | ------------------------------------------------------------------ |
| "Access token expired or revoked" E404        | npm 版本过旧              | 使用 Node.js 24（npm 11.5.1+）                                     |
| ENEEDAUTH                                     | 缺少 registry-url        | 在 setup-node 中添加 `registry-url: 'https://registry.npmjs.org'` |
| "repository.url is empty" E422                | 缺少 repository 字段       | 在 package.json 中添加 `repository` 字段                           |
| "npm/xyz not configured as trusted publisher" | 配置不匹配                 | 检查所有者、仓库、工作流文件名是否完全一致                         |

### 验证设置

当满足以下条件时，工作流将使用 OIDC：

- 设置了 `id-token: write` 权限
- 使用了 `--provenance` 标志
- 未设置 `NODE_AUTH_TOKEN` 环境变量

npm 自动检测 GitHub Actions 并通过 OIDC 进行身份验证。
