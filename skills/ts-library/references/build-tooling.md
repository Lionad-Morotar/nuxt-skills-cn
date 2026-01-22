# 构建工具

## 工具选择

| 工具                | 使用场景                                     |
| ------------------- | -------------------------------------------- |
| **tsdown**          | 大多数库——快速、简单、现代                   |
| **unbuild**         | 复杂构建、Nuxt 模块、自动外部依赖             |
| **rollup/rolldown** | 需要精细控制的大项目                         |

## tsdown（推荐）

```bash
pnpm add -D tsdown
```

### 基础配置

```typescript
// tsdown.config.ts
import { defineConfig } from 'tsdown'

export default defineConfig({
  entry: ['src/index.ts'],
  format: ['esm', 'cjs'],
  dts: true,
  clean: true,
})
```

### 多入口配置

```typescript
export default defineConfig({
  entry: ['src/index.ts', 'src/cli.ts', 'src/utils.ts'],
  format: ['esm', 'cjs'],
  dts: true,
  external: ['vue', 'vite'],
})
```

### 插件模式（unplugin-*）

```typescript
export default defineConfig({
  entry: ['src/*.ts'],          // 全局匹配所有入口
  format: ['esm', 'cjs'],
  dts: true,
  exports: true,                // 自动生成 package.json 的 exports 字段
  attw: { profile: 'esm-only' }, // 类型检查配置文件
})
```

### 高级选项

```typescript
export default defineConfig({
  entry: ['src/index.ts'],
  format: ['esm', 'cjs'],
  dts: {
    resolve: ['@antfu/utils'],  // 在声明中内联特定依赖
  },
  external: ['vue'],
  define: {
    __DEV__: 'false',
  },
  hooks: {
    'build:done': async () => {
      // 构建后任务
    },
  },
})
```

## unbuild

```bash
pnpm add -D unbuild
```

### 基础配置

```typescript
// build.config.ts
import { defineBuildConfig } from 'unbuild'

export default defineBuildConfig({
  entries: ['src/index'],
  declaration: true,
  rollup: {
    emitCJS: true,
  },
})
```

### 包含外部依赖

```typescript
export default defineBuildConfig({
  entries: ['src/index', 'src/cli'],
  declaration: true,
  externals: ['vue', 'vite'],
  rollup: {
    emitCJS: true,
    inlineDependencies: true,
    dts: { respectExternal: true },
  },
})
```

## 输出格式

### ESM 仅输出（现代）

```typescript
export default defineConfig({
  format: ['esm'],
})
```

### 双 CJS/ESM（推荐）

```typescript
export default defineConfig({
  format: ['esm', 'cjs'],
})
```

### 包含 IIFE 用于 CDN

```typescript
export default defineConfig([
  { format: ['esm', 'cjs'], dts: true },
  { format: 'iife', globalName: 'MyLib', minify: true },
])
```

## 定义标志

常见的编译时标志：

```typescript
export default defineConfig({
  define: {
    __DEV__: `(process.env.NODE_ENV !== 'production')`,
    __TEST__: 'false',
    __BROWSER__: 'true',
    __VERSION__: JSON.stringify(pkg.version),
  },
})
```

## 构建脚本

```json
{
  "scripts": {
    "build": "tsdown",
    "dev": "tsdown --watch",
    "prepublishOnly": "pnpm build"
  }
}
```

## 故障排除

### CJS 默认导出问题

某些打包工具需要显式默认导出：

```typescript
export default defineConfig({
  hooks: {
    'build:done': async () => {
      // 如需，修补 CJS 文件
    },
  },
})
```

### 输出中缺失类型

确保设置 `dts: true` 并检查 tsconfig 中的 `isolatedDeclarations`。

### 外部依赖不生效

确认包在 `peerDependencies` 中，并列入 `external` 列表。
