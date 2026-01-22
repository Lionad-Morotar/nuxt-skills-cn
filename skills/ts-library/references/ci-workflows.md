# CI 工作流

## 基础 CI

```yaml
# .github/workflows/ci.yml
name: CI
on:
  push:
    branches: [main]
  pull_request:

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install
      - run: pnpm lint

  typecheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install
      - run: pnpm typecheck

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install
      - run: pnpm test
```

## 矩阵测试

```yaml
jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest]
        node: [20, 22, 24]
        include:
          - os: macos-latest
            node: 24
          - os: windows-latest
            node: 24
      fail-fast: false
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
          cache: pnpm
      - run: pnpm install
      - run: pnpm test
```

## 跳过仅文档更改

```yaml
jobs:
  changed:
    runs-on: ubuntu-latest
    outputs:
      should_skip: ${{ steps.check.outputs.only_changed == 'true' }}
    steps:
      - uses: tj-actions/changed-files@v47
        id: check
        with:
          files: |
            docs/**
            **.md

  test:
    needs: changed
    if: needs.changed.outputs.should_skip != 'true'
    # ... job 剩余部分
```

## 自动修复提交

```yaml
- run: pnpm lint:fix
- uses: stefanzweifel/git-auto-commit-action@v5
  if: github.event_name == 'push'
  with:
    commit_message: 'chore: lint fix'
```

## 基于标签的发布（令牌方式）

```yaml
# .github/workflows/release.yml
name: Release
on:
  push:
    tags: ['v*']

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
          registry-url: https://registry.npmjs.org
      - run: pnpm install
      - run: pnpm build
      - run: pnpm publish --access public --no-git-checks
        env:
          NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

## 基于标签的发布（OIDC - 推荐）

无需 NPM_TOKEN。使用 GitHub OIDC 实现无令牌身份验证并附带来源证明。

```yaml
name: Release
permissions:
  id-token: write
  contents: write
  actions: read
on:
  push:
    tags: ['v*']

jobs:
  wait-for-ci:
    runs-on: ubuntu-latest
    steps:
      - uses: lewagon/wait-on-check-action@v1.3.4
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
          node-version: 24  # 必需：npm 11.5.1+
          cache: pnpm
          registry-url: https://registry.npmjs.org
      - run: pnpm install
      - run: pnpm build
      - run: pnpm dlx changelogithub
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      - run: pnpm publish --access public --no-git-checks --provenance
```

### OIDC 设置步骤

1. 打开 `https://www.npmjs.com/package/<PACKAGE_NAME>/access`
2. 滚动至 "Publishing access" 部分
3. 在 Trusted Publishers 下点击 "Add GitHub Actions"
4. 填写：所有者、仓库、工作流文件（`release.yml`）、环境（留空）
5. 点击 "Add"

### OIDC 要求

1. **Node.js 24+**（npm 11.5.1+ 必需 — Node 22 使用 npm 10.x 会失败）
2. **权限**：`id-token: write`
3. **发布标志**：`--provenance`
4. **package.json**：必须包含 `repository` 字段
5. **npm 2FA**："Require 2FA or granular access token"（允许 OIDC）

### 故障排除

| 错误                                   | 原因                 | 修复                                       |
| -------------------------------------- | -------------------- | ------------------------------------------ |
| "Access token expired" E404            | npm 版本过旧         | 使用 Node.js 24                            |
| ENEEDAUTH                              | 缺少 registry-url    | 在 setup-node 中添加 `registry-url`        |
| "repository.url is empty" E422         | 字段缺失             | 在 package.json 中添加 `repository`        |
| "not configured as trusted publisher"  | 配置不匹配           | 检查所有者、仓库、工作流是否完全一致       |

## 单体仓库矩阵

```yaml
jobs:
  test:
    strategy:
      matrix:
        package: [core, utils, cli]
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install
      - run: pnpm --filter ${{ matrix.package }} test
```

## 并发控制

取消过期运行：

```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.event.number || github.sha }}
  cancel-in-progress: true
```

## PR 中的 pkg-pr-new

```yaml
# .github/workflows/pkg-pr-new.yml
name: Publish PR
on: pull_request

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install
      - run: pnpm build
      - run: pnpm dlx pkg-pr-new publish --compact --pnpm
```

## CI 中的包验证

```yaml
- run: pnpm build
- run: pnpm dlx publint
- run: pnpm dlx @arethetypeswrong/cli --pack .
```
