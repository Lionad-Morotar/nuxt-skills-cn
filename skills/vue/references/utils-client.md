# 客户端工具

用于格式化、验证、转换和解析的纯函数。

## 快速参考

| 类别       | 示例                                         |
| ---------- | -------------------------------------------- |
| 格式化器   | `formatCurrency`、`formatDate`、`formatBytes` |
| 验证器     | `isValidEmail`、`isValidUrl`、`isValidPhone`  |
| 转换器     | `slugify`、`truncate`、`capitalize`           |
| 解析器     | `parseQuery`、`parseJSON`、`parseDate`        |

## 规则

**纯函数：**

- 相同输入 → 相同输出
- 无副作用
- 无外部状态变更
- 无 API 调用、无引用、无响应式逻辑

**不使用工具函数的情况：**

- 有状态逻辑 → 使用组合式函数
- Vue 特定逻辑 → 使用组合式函数
- 组件逻辑 → 保留在组件内
- API 调用 → 使用查询函数

## 结构

```ts
// utils/formatters.ts
export function formatCurrency(amount: number, currency = 'USD'): string {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency,
  }).format(amount)
}

export function formatRelativeTime(date: Date): string {
  const rtf = new Intl.RelativeTimeFormat('en', { numeric: 'auto' })
  const diff = date.getTime() - Date.now()
  const days = Math.floor(diff / (1000 * 60 * 60 * 24))
  return rtf.format(days, 'day')
}
```

**命名：** 描述性动词（`formatCurrency`、`validateEmail`、`parseQuery`）  
**组织：** 按类别分组（`formatters.ts`、`validators.ts`）  
**导出：** 仅命名导出

## 按类别示例

**格式化器：**

```ts
// utils/formatters.ts
export function formatBytes(bytes: number): string { ... }
export function formatPhone(phone: string): string { ... }
```

**验证器：**

```ts
// utils/validators.ts
export function isValidEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@][^\s.@]*\.[^\s@]+$/.test(email)
}

export function isValidUrl(url: string): boolean {
  try { new URL(url); return true }
  catch { return false }
}
```

**转换器：**

```ts
// utils/transformers.ts
export function slugify(text: string): string {
  return text.toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
}

export function truncate(text: string, length: number): string {
  return text.length > length ? `${text.slice(0, length)}...` : text
}
```

**解析器：**

```ts
// utils/parsers.ts
export function parseQuery(search: string): Record<string, string> {
  return Object.fromEntries(new URLSearchParams(search))
}

export function parseJSON<T>(json: string, fallback: T): T {
  try { return JSON.parse(json) }
  catch { return fallback }
}
```

## 常见错误

**副作用（非纯函数）：**

```ts
// ❌ 错误 —— 修改外部状态
let count = 0
export function increment() {
  count++
  return count
}

// ✅ 正确 —— 纯函数
export function add(a: number, b: number): number {
  return a + b
}
```

**将工具函数用于有状态逻辑：**

```ts
// ❌ 错误 —— 应使用组合式函数
export function useCounter() { ... }

// ✅ 正确 —— 纯转换函数
export function formatCount(count: number): string { ... }
```

## 组织方式

**小型项目采用扁平结构：**

```
utils/
├── formatters.ts
├── validators.ts
└── transformers.ts
```

**大型项目采用嵌套结构：**

```
utils/
├── formatters/
│   ├── date.ts
│   ├── currency.ts
│   └── index.ts
└── validators/
    ├── email.ts
    └── index.ts
```
