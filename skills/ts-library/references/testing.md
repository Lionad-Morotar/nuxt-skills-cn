# 测试

## Vitest 设置

```bash
pnpm add -D vitest
```

### 基础配置

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    include: ['test/**/*.test.ts'],
    testTimeout: 30_000,
    reporters: 'dot',
  },
})
```

### 包含覆盖率

```typescript
export default defineConfig({
  test: {
    coverage: {
      provider: 'v8',
      include: ['src/**/*.ts'],
      exclude: ['src/types.ts'],
      reporter: ['text', 'lcovonly', 'html'],
    },
  },
})
```

## 工作区项目

对于单体仓库（monorepos），分别测试各个包：

```typescript
export default defineConfig({
  test: {
    projects: [
      'packages/*/vitest.config.ts',
      {
        extends: './vitest.config.ts',
        test: { name: 'unit', environment: 'node' },
      },
      {
        extends: './vitest.config.ts',
        test: { name: 'browser', browser: { enabled: true } },
      },
    ],
  },
})
```

## 基于固定文件的测试

使用文件夹中的测试用例进行转换测试：

```typescript
import { describe, expect, it } from 'vitest'
import { transform } from '../src'

const fixtures = import.meta.glob('./fixtures/*.ts', { as: 'raw' })

describe('transform', () => {
  for (const [path, getContent] of Object.entries(fixtures)) {
    it(path, async () => {
      const content = await getContent()
      const result = await transform(content)
      expect(result).toMatchSnapshot()
    })
  }
})
```

## 幂等性测试

确保转换是稳定的：

```typescript
it('transform is idempotent', async () => {
  const pass1 = (await transform(fixture))?.code ?? fixture
  expect(pass1).toMatchSnapshot()

  const pass2 = (await transform(pass1))?.code ?? pass1
  expect(pass2).toBe(pass1)  // 应当不变
})
```

## 类型级别测试

测试 TypeScript 类型：

```typescript
// vitest.config.ts
export default defineConfig({
  test: {
    typecheck: { enabled: true },
  },
})
```

```typescript
// test/types.test-d.ts
import { describe, expectTypeOf, it } from 'vitest'
import type { Input, Output } from '../src'

describe('types', () => {
  it('infers input correctly', () => {
    expectTypeOf<Input<typeof schema>>().toEqualTypeOf<{ id: string }>()
  })
})
```

## 多 TypeScript 版本测试

在多个 TypeScript 版本中进行测试（TanStack 模式）：

```yaml
# .github/workflows/ci.yml
jobs:
  test-types:
    strategy:
      matrix:
        ts: ['5.0', '5.2', '5.4', '5.6', '5.8']
    steps:
      - run: pnpm add -D typescript@${{ matrix.ts }}
      - run: pnpm typecheck
```

## 包验证

验证已发布的包：

```bash
# 检查导出是否正确
pnpm dlx publint

# 检查在不同模块解析下的类型是否工作
pnpm dlx @arethetypeswrong/cli --pack .
```

添加到 tsdown 配置中：

```typescript
export default defineConfig({
  attw: { profile: 'esm-only' },  // 或 'node16'
})
```

## 测试脚本

```json
{
  "scripts": {
    "test": "vitest",
    "test:run": "vitest run",
    "test:coverage": "vitest run --coverage",
    "test:types": "vitest typecheck"
  }
}
```

## 模拟

```typescript
import { vi } from 'vitest'

vi.mock('fs', () => ({
  readFileSync: vi.fn(() => 'mocked content'),
}))

// 监控方法调用
const spy = vi.spyOn(console, 'log')
expect(spy).toHaveBeenCalledWith('expected')
```

## 插件测试

在测试中使用你自己的插件：

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import MyPlugin from './src/vite'

export default defineConfig({
  plugins: [
    MyPlugin({ /* options */ }),
  ],
  test: {
    include: ['test/**/*.test.ts'],
  },
})
```
