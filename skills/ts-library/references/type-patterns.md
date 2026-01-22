# 类型模式

## 实用类型

在各库中通用的辅助类型：

```typescript
// 异步或同步
export type Awaitable<T> = T | Promise<T>

// 单个或数组
export type Arrayable<T> = T | T[]

// 可为空
export type Nullable<T> = T | null | undefined

// 深度可选
export type DeepPartial<T> = {
  [P in keyof T]?: T[P] extends object ? DeepPartial<T[P]> : T[P]
}

// 简化交集以获得更好的 IDE 显示效果
export type Simplify<T> = { [K in keyof T]: T[K] } & {}

// 防止在特定位置进行类型推断
export type NoInfer<T> = [T][T extends any ? 0 : never]
```

## 条件提取

从结构中提取类型：

```typescript
// 从模式中提取输入类型
export type Input<T> = T extends { _input: infer U } ? U : unknown

// 提取输出类型
export type Output<T> = T extends { _output: infer U } ? U : unknown

// 从嵌套属性中提取
export type InferContext<T> = T extends { context: infer C } ? C : never
```

## 品牌类型

原始类型的名义类型：

```typescript
declare const brand: unique symbol

export type Brand<T, B> = T & { readonly [brand]: B }

export type UserId = Brand<string, 'UserId'>
export type PostId = Brand<string, 'PostId'>

// 无法混淆它们
function getUser(id: UserId) { /* ... */ }
getUser('abc' as UserId)  // 正确
getUser('abc' as PostId)  // 错误！
```

## 类型累积（构建器）

每个方法更新泛型参数：

```typescript
interface ProcedureBuilder<TContext, TInput, TOutput> {
  input<T>(schema: T): ProcedureBuilder<TContext, T, TOutput>
  output<T>(schema: T): ProcedureBuilder<TContext, TInput, T>
  query(fn: (opts: { ctx: TContext; input: TInput }) => TOutput): Procedure
}

// 类型在链中流动
const proc = builder
  .input(z.object({ id: z.string() }))  // TInput = { id: string }
  .output(z.object({ name: z.string() })) // TOutput = { name: string }
  .query(({ input }) => ({ name: input.id }))
```

## 模块增强

允许用户扩展库类型：

```typescript
// 库代码
export interface Register {}

export type DefaultError = Register extends { defaultError: infer E }
  ? E
  : Error

// 用户代码
declare module 'my-lib' {
  interface Register {
    defaultError: MyCustomError
  }
}
```

## 数据标记

使用符号附加类型元数据：

```typescript
declare const dataTagSymbol: unique symbol
declare const errorTagSymbol: unique symbol

export type DataTag<TType, TData, TError> = TType & {
  [dataTagSymbol]: TData
  [errorTagSymbol]: TError
}

// 提取标记类型
export type InferData<T> = T extends { [dataTagSymbol]: infer D } ? D : unknown
```

## 映射类型修改

列构建器模式（drizzle）：

```typescript
type NotNull<T extends ColumnBuilder> = T & { _: { notNull: true } }
type HasDefault<T extends ColumnBuilder> = T & { _: { hasDefault: true } }

class ColumnBuilder<T extends ColumnConfig> {
  notNull(): NotNull<this> {
    // ...
    return this as NotNull<this>
  }

  default(value: T['data']): HasDefault<this> {
    // ...
    return this as HasDefault<this>
  }
}
```

## 编译时错误

返回可读的错误信息：

```typescript
type TypeError<Message extends string> = { __error: Message }

type ValidateInput<T> = T extends string
  ? T
  : TypeError<'Input must be a string'>

// 显示：Type 'TypeError<"Input must be a string">' is not assignable...
```

## 函数重载

多种签名用于不同的输入：

```typescript
export function useEventListener<E extends keyof WindowEventMap>(
  event: E,
  listener: (ev: WindowEventMap[E]) => any
): void

export function useEventListener<E extends keyof DocumentEventMap>(
  target: Document,
  event: E,
  listener: (ev: DocumentEventMap[E]) => any
): void

export function useEventListener(...args: any[]) {
  // 实现
}
```

## 分布式条件

对每个联合成员应用：

```typescript
type ToArray<T> = T extends any ? T[] : never

type Result = ToArray<string | number>
// Result = string[] | number[]
```

通过元组禁用分布：

```typescript
type ToArrayNonDist<T> = [T] extends [any] ? T[] : never

type Result = ToArrayNonDist<string | number>
// Result = (string | number)[]
```
