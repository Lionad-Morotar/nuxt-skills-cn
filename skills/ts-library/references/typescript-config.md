# TypeScript 配置

## 库基础配置

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "lib": ["ESNext"],
    "strict": true,
    "strictNullChecks": true,
    "noImplicitOverride": true,
    "noUnusedLocals": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "noEmit": true,
    "isolatedDeclarations": true,
    "verbatimModuleSyntax": true
  },
  "include": ["src"],
  "exclude": ["node_modules", "dist"]
}
```

## 关键选项说明

| 选项                   | 值       | 原因                                             |
| ---------------------- | -------- | ------------------------------------------------ |
| `target`               | ESNext   | 现代化输出，打包工具会降级处理                   |
| `module`               | ESNext   | ESM 输出                                         |
| `moduleResolution`     | Bundler  | 与现代打包工具兼容，支持无扩展导入               |
| `strict`               | true     | 早期捕获错误                                     |
| `noEmit`               | true     | 构建工具负责输出                                 |
| `isolatedDeclarations` | true     | 更快的 DTS 生成                                  |
| `verbatimModuleSyntax` | true     | 明确要求使用 `import type`                       |
| `skipLibCheck`         | true     | 更快的构建                                       |

## 单仓库配置

### 根目录 tsconfig.json

```json
{
  "compilerOptions": {
    "composite": true,
    "declaration": true,
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "strict": true,
    "verbatimModuleSyntax": true
  }
}
```

### 包级 tsconfig.json

```json
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "outDir": "dist",
    "rootDir": "src"
  },
  "include": ["src"],
  "references": [
    { "path": "../utils" }
  ]
}
```

## 路径别名

用于单仓库中的内部导入：

```json
{
  "compilerOptions": {
    "paths": {
      "@my-lib/core": ["./packages/core/src"],
      "@my-lib/utils": ["./packages/utils/src"],
      "#internal/*": ["./virtual-shared/*"]
    }
  }
}
```

## 打包工具与 Node 解析

**使用 `Bundler`** 来适配由打包工具（如 Vite、webpack 等）消费的库：

- 支持无扩展导入
- 支持 package.json 中的 `exports` 字段
- 现代、简洁设置

**使用 `Node16/NodeNext`** 用于仅 Node.js 的库：

- 需要显式扩展名（如 `.js`）
- 更严格，与 Node.js 行为完全一致

## 类型声明

让构建工具生成类型声明：

```typescript
// tsdown.config.ts
export default defineConfig({
  dts: true,                    // 生成 .d.ts
  dts: { resolve: ['@antfu/utils'] }  // 内联特定类型
})
```

或使用 unbuild：

```typescript
// build.config.ts
export default defineBuildConfig({
  declaration: 'node16',        // 兼容 Node.js
  declaration: true,            // 打包工具解析用
})
```

## 常见问题

### 模块未找到错误

检查 `moduleResolution` 是否与目标一致：

- Bundler：`"Bundler"`
- Node.js：`"Node16"` 或 `"NodeNext"`

### 类型导入不工作

启用 `verbatimModuleSyntax` 并显式使用：

```typescript
import type { Foo } from './types'
```

### 类型检查缓慢

启用 `skipLibCheck: true` 和 `isolatedDeclarations: true`。
