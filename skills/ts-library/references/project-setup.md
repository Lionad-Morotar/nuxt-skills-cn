# 项目设置

## 单包

```bash
# 克隆启动模板
cp -r ~/templates/antfu/starter-ts my-lib
cd my-lib && rm -rf .git && git init
pnpm install
```

或手动设置：

```bash
mkdir my-lib && cd my-lib
pnpm init
pnpm add -D typescript tsdown vitest eslint @antfu/eslint-config
```

### 目录结构

```
my-lib/
├── src/
│   ├── index.ts      # 主入口
│   └── types.ts      # 类型定义
├── test/
│   └── index.test.ts
├── dist/             # 构建输出（git 忽略）
├── package.json
├── tsconfig.json
├── tsdown.config.ts
├── eslint.config.ts
└── vitest.config.ts
```

## 单仓库

```bash
cp -r ~/templates/antfu/starter-monorepo my-monorepo
cd my-monorepo && rm -rf .git && git init
pnpm install
```

### 结构

```
my-monorepo/
├── packages/
│   ├── core/
│   │   ├── src/
│   │   ├── package.json
│   │   └── tsdown.config.ts
│   └── cli/
│       ├── src/
│       └── package.json
├── playground/          # 集成测试
├── pnpm-workspace.yaml
├── package.json         # 根脚本、开发依赖
├── tsconfig.json        # 基础配置
└── eslint.config.ts
```

### pnpm-workspace.yaml

```yaml
packages:
  - packages/*
  - playground

catalogs:
  build:
    tsdown: ^0.15.0
    unbuild: ^3.0.0
  lint:
    eslint: ^9.0.0
    '@antfu/eslint-config': ^4.0.0
  test:
    vitest: ^3.0.0
  types:
    typescript: ^5.7.0
```

## pnpm 目录

按用途组织依赖（来自 antfu 的博客文章）：

| 分类     | 内容                               |
| -------- | ---------------------------------- |
| build    | tsdown, unbuild, rollup 插件       |
| lint     | eslint, @antfu/eslint-config       |
| test     | vitest, @vue/test-utils            |
| types    | typescript, @types/\*              |
| prod     | 运行时依赖：consola, defu, pathe   |

### 使用目录

```json
{
  "devDependencies": {
    "tsdown": "catalog:build",
    "eslint": "catalog:lint",
    "vitest": "catalog:test",
    "typescript": "catalog:types"
  }
}
```

## ESLint 设置

```bash
pnpm add -D eslint @antfu/eslint-config
```

```typescript
// eslint.config.ts
import antfu from '@antfu/eslint-config'

export default antfu({
  type: 'lib',
  pnpm: true,
  formatters: true,
})
```

## Git 钩子

```bash
pnpm add -D simple-git-hooks lint-staged
```

```json
{
  "simple-git-hooks": { "pre-commit": "pnpm lint-staged" },
  "lint-staged": { "*": "eslint --fix" },
  "scripts": { "prepare": "simple-git-hooks" }
}
```

添加后运行 `pnpm prepare`。

## 脚本

```json
{
  "scripts": {
    "build": "tsdown",
    "dev": "tsdown --watch",
    "lint": "eslint .",
    "lint:fix": "eslint . --fix",
    "typecheck": "tsc --noEmit",
    "test": "vitest",
    "release": "bumpp",
    "prepublishOnly": "pnpm build"
  }
}
```
