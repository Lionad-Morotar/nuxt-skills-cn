# API 设计模式

## 选项模式

面向用户的选项及其内部解析版本：

```typescript
export interface Options {
  verbose?: boolean
  include?: string[]
  exclude?: string[]
}

export interface ResolvedOptions extends Required<Options> {
  root: string
}

function resolveOptions(options: Options = {}): ResolvedOptions {
  return {
    verbose: options.verbose ?? false,
    include: options.include ?? ['**/*'],
    exclude: options.exclude ?? ['node_modules'],
    root: process.cwd(),
  }
}
```

## 工厂函数

创建已配置的实例：

```typescript
export function createContext(options: Options = {}) {
  const resolved = resolveOptions(options)
  const filter = createFilter(resolved.include, resolved.exclude)

  return {
    options: resolved,
    filter,
    transform(code: string, id: string) { /* ... */ },
    async scanDirs() { /* ... */ },
  }
}

// 使用方式
const ctx = createContext({ verbose: true })
await ctx.scanDirs()
```

## 构建器模式

支持链式调用的 API 并累积类型：

```typescript
export function createBuilder<TContext = unknown>() {
  return {
    context<T>(): Builder<T, unknown, unknown> {
      return this as any
    },
    input<T>(schema: T): Builder<TContext, T, unknown> {
      return this as any
    },
    output<T>(schema: T): Builder<TContext, unknown, T> {
      return this as any
    },
    build(): Procedure<TContext> { /* ... */ },
  }
}

// 使用方式 —— 类型在链中流动
const procedure = createBuilder()
  .context<{ user: User }>()
  .input(z.object({ id: z.string() }))
  .build()
```

## 插件模式（unplugin）

基于单一实现的通用插件：

```typescript
import { createUnplugin } from 'unplugin'

export default createUnplugin<Options>((options) => {
  const ctx = createContext(options)

  return {
    name: 'my-plugin',
    enforce: 'pre',

    transformInclude(id) {
      return ctx.filter(id)
    },

    transform(code, id) {
      return ctx.transform(code, id)
    },

    // 打包工具特定钩子
    vite: {
      configResolved(config) { /* Vite 特定 */ },
    },
    webpack(compiler) {
      compiler.hooks.watchRun.tap('my-plugin', () => { /* ... */ })
    },
  }
})
```

按打包工具导出入口：

```typescript
// src/vite.ts
import unplugin from '.'
export default unplugin.vite

// src/webpack.ts
import unplugin from '.'
export default unplugin.webpack
```

## 惰性获取（Tree-shaking）

延迟执行特定打包工具的代码直到被访问：

```typescript
export function createPlugin<T>(factory: PluginFactory<T>) {
  return {
    get vite() { return getVitePlugin(factory) },
    get webpack() { return getWebpackPlugin(factory) },
    get rollup() { return getRollupPlugin(factory) },
  }
}
```

仅执行被访问的 getter，其余代码会被 tree-shaken。

## 智能默认值

检测环境而非要求配置：

```typescript
import { isPackageExists } from 'local-pkg'

function resolveOptions(options: Options) {
  return {
    vue: options.vue ?? isPackageExists('vue'),
    react: options.react ?? isPackageExists('react'),
    typescript: options.typescript ?? isPackageExists('typescript'),
  }
}
```

## 解析器模式

灵活的解析方式，支持函数或对象：

```typescript
export type Resolver = ResolverFunction | ResolverObject

export type ResolverFunction = (name: string) => ResolveResult | undefined
export interface ResolverObject {
  type: 'component' | 'directive'
  resolve: ResolverFunction
}

export function ElementPlusResolver(): Resolver[] {
  return [
    { type: 'component', resolve: (name) => resolveComponent(name) },
    { type: 'directive', resolve: (name) => resolveDirective(name) },
  ]
}
```

## 流式 API（验证）

方法链式调用并克隆以确保不可变性：

```typescript
class Schema<T> {
  private _def: SchemaDef

  min(value: number): Schema<T> {
    return new Schema({ ...this._def, min: value })
  }

  max(value: number): Schema<T> {
    return new Schema({ ...this._def, max: value })
  }

  optional(): Schema<T | undefined> {
    return new Schema({ ...this._def, optional: true })
  }
}

// 使用方式
const schema = z.string().min(5).max(10).optional()
```

## 条件导出

清晰的公共 API：

```typescript
// src/index.ts
export * from './config'
export * from './types'
export { createContext } from './context'
export { default } from './plugin'
```
