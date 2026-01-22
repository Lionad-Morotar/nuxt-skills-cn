# 包导出

## 基础单入口

```json
{
  "name": "my-lib",
  "version": "1.0.0",
  "type": "module",
  "exports": {
    ".": {
      "types": "./dist/index.d.mts",
      "import": "./dist/index.mjs",
      "require": "./dist/index.cjs"
    }
  },
  "main": "./dist/index.cjs",
  "module": "./dist/index.mjs",
  "types": "./dist/index.d.mts",
  "sideEffects": false,
  "files": ["dist"]
}
```

## 多入口点

```json
{
  "exports": {
    ".": {
      "types": "./dist/index.d.mts",
      "import": "./dist/index.mjs",
      "require": "./dist/index.cjs"
    },
    "./utils": {
      "types": "./dist/utils.d.mts",
      "import": "./dist/utils.mjs",
      "require": "./dist/utils.cjs"
    },
    "./*": "./dist/*"
  }
}
```

## 插件入口模式（unplugin-*）

```json
{
  "exports": {
    ".": {
      "types": "./dist/index.d.mts",
      "import": "./dist/index.mjs",
      "require": "./dist/index.cjs"
    },
    "./vite": {
      "types": "./dist/vite.d.mts",
      "import": "./dist/vite.mjs",
      "require": "./dist/vite.cjs"
    },
    "./webpack": {
      "types": "./dist/webpack.d.mts",
      "import": "./dist/webpack.mjs",
      "require": "./dist/webpack.cjs"
    },
    "./nuxt": {
      "types": "./dist/nuxt.d.mts",
      "import": "./dist/nuxt.mjs",
      "require": "./dist/nuxt.cjs"
    }
  }
}
```

## 环境感知导出

```json
{
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "node": {
        "import": { "production": "./dist/index.prod.mjs", "development": "./dist/index.mjs" },
        "require": { "production": "./dist/index.prod.cjs", "development": "./dist/index.cjs" }
      },
      "import": "./dist/index.mjs",
      "require": "./dist/index.cjs"
    }
  }
}
```

## typesVersions 回退

用于不支持 exports 的旧版 TypeScript：

```json
{
  "typesVersions": {
    "*": {
      "*": ["./dist/*", "./*"]
    }
  }
}
```

## 字段参考

| 字段          | 目的                             |
| ------------- | -------------------------------- |
| `exports`     | 现代入口点（Node 12.7+）         |
| `main`        | CJS 回退，适用于旧 bundler       |
| `module`      | ESM 回退，适用于 bundler         |
| `types`       | TypeScript 回退                  |
| `sideEffects` | `false` 启用 tree-shaking        |
| `files`       | 发布到 npm 的内容                |

## 条件顺序

顺序很重要！将最具体的条件放在前面：

```json
{
  ".": {
    "types": "...",      // 总是放在最前
    "import": "...",     // ESM
    "require": "..."     // CJS 回退
  }
}
```

## 同级依赖

外部依赖，消费者必须提供：

```json
{
  "peerDependencies": {
    "vue": "^3.0.0"
  },
  "peerDependenciesMeta": {
    "vue": { "optional": true }
  }
}
```

## 包验证

```bash
# 检查导出是否正确
pnpm dlx publint
pnpm dlx @arethetypeswrong/cli
```

添加到 CI 中以实现持续验证。
