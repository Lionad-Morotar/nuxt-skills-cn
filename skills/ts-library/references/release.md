# 发布工作流

## 工具

| 工具        | 目的                           |
| ----------- | ------------------------------ |
| bumpp       | 交互式版本升级                 |
| changelogen | 从提交生成变更日志             |
| pkg-pr-new  | PR 预览包                      |

## bumpp（版本升级）

```bash
pnpm add -D bumpp
```

```json
{
  "scripts": {
    "release": "bumpp"
  }
}
```

交互式提示补丁/次版本/主版本。选项：

```json
{
  "scripts": {
    "release": "bumpp --commit --tag --push"
  }
}
```

对于单体仓库：

```bash
bumpp -r    # 递归处理
bumpp packages/*/package.json  # 指定包
```

## changelogen（变更日志）

```bash
pnpm add -D changelogen
```

```json
{
  "scripts": {
    "changelog": "changelogen --release"
  }
}
```

组合工作流：

```json
{
  "scripts": {
    "release": "changelogen --release && bumpp"
  }
}
```

## 完整发布流程

```json
{
  "scripts": {
    "release": "pnpm lint && pnpm test && changelogen --release && bumpp --commit --tag --push"
  }
}
```

CI 在推送标签时发布到 npm。

## pkg-pr-new（PR 预览）

适用于可发布的包。在 PR 上创建安装链接。

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

对于单体仓库：

```bash
pnpm dlx pkg-pr-new publish --compact --pnpm './packages/*'
```

PR 评论显示：

```
pnpm add https://pkg.pr.new/your-org/your-package@123
```

## 约定式提交

为了让 changelogen 正常工作：

```
feat: 添加深色模式支持
fix: 修复解析器中的内存泄漏
docs: 更新 README
chore: 更新依赖项
```

## npm 发布

### 基于令牌（传统）

```yaml
- run: pnpm publish --access public --no-git-checks
  env:
    NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

### OIDC（推荐）

无需令牌。请参见 ci-workflows.md 了解完整设置。

```yaml
- run: pnpm publish --access public --no-git-checks --provenance
```

## 单体仓库发布

使用 pnpm：

```bash
pnpm -r publish --access public
```

使用 bumpp：

```bash
bumpp -r && pnpm -r publish
```

## 预发布版本

```bash
bumpp --preid beta   # 1.0.0 -> 1.0.1-beta.0
bumpp --preid alpha  # 1.0.0 -> 1.0.1-alpha.0
```

## Package.json 要求

```json
{
  "name": "@scope/package",
  "version": "1.0.0",
  "repository": {
    "type": "git",
    "url": "git+https://github.com/org/repo.git"
  },
  "publishConfig": {
    "access": "public"
  }
}
```

`repository` 是 npm provenance 所必需的。
