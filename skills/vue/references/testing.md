# Vue 测试

Vue 3 组件、组合式函数和工具的测试模式。

## 快速参考

| 测试类型         | 模式                                  |
| ---------------- | ------------------------------------- |
| 组件             | `mount(Component, { props, slots })`  |
| 用户交互         | `await wrapper.trigger('click')`      |
| 触发事件         | `wrapper.emitted('update')`           |
| 组合式函数       | 直接调用，测试返回值                  |
| 工具函数         | 纯函数测试（最简单）                  |

## 技术栈

- **Vitest** - 测试运行器
- **@vue/test-utils** - 组件挂载与交互
- **@testing-library/vue** - 以用户为中心的替代方案
- **happy-dom / jsdom** - DOM 环境

## 文件位置

将测试文件与代码 colocated：

```
Button.vue → Button.spec.ts
useAuth.ts → useAuth.spec.ts
formatters.ts → formatters.spec.ts
```

## 组件测试

### 基础

```ts
import { mount } from '@vue/test-utils'
import Button from './Button.vue'

it('renders slot', () => {
  const wrapper = mount(Button, {
    slots: { default: 'Click me' }
  })
  expect(wrapper.text()).toBe('Click me')
})

it('emits on click', async () => {
  const wrapper = mount(Button)
  await wrapper.trigger('click')
  expect(wrapper.emitted('click')).toHaveLength(1)
})
```

### Props

```ts
it('applies variant class', () => {
  const wrapper = mount(Button, {
    props: { variant: 'primary' }
  })
  expect(wrapper.classes()).toContain('btn-primary')
})
```

### 触发事件

```ts
it('emits update with payload', async () => {
  const wrapper = mount(Input)
  await wrapper.find('input').setValue('new value')
  expect(wrapper.emitted('update:modelValue')?.[0]).toEqual(['new value'])
})
```

### 插槽

```ts
it('renders named slots', () => {
  const wrapper = mount(Card, {
    slots: {
      header: '<h1>Title</h1>',
      default: '<p>Content</p>'
    }
  })
  expect(wrapper.html()).toContain('<h1>Title</h1>')
})
```

## 组合式函数测试

直接调用，无需挂载：

```ts
import { useCounter } from './useCounter'

it('increments count', () => {
  const { count, increment } = useCounter(0)
  expect(count.value).toBe(0)
  increment()
  expect(count.value).toBe(1)
})

it('resets to initial', () => {
  const { count, increment, reset } = useCounter(5)
  increment()
  increment()
  expect(count.value).toBe(7)
  reset()
  expect(count.value).toBe(5)
})
```

## 工具函数测试

最简单 —— 纯函数：

```ts
import { formatCurrency, slugify } from './formatters'

describe('formatCurrency', () => {
  it('formats USD', () => {
    expect(formatCurrency(10.5)).toBe('$10.50')
  })
})

describe('slugify', () => {
  it('converts to lowercase', () => {
    expect(slugify('Hello World')).toBe('hello-world')
  })

  it('removes special chars', () => {
    expect(slugify('Hello! World?')).toBe('hello-world')
  })
})
```

## Mock

**组合式函数：**

```ts
import { vi } from 'vitest'

vi.mock('./useAuth', () => ({
  useAuth: vi.fn(() => ({
    user: { id: 1, name: 'Test' },
    isAuthenticated: true
  }))
}))
```

**API 调用：**

```ts
global.fetch = vi.fn(() =>
  Promise.resolve({
    json: () => Promise.resolve({ data: [] })
  })
)
```

## 最佳实践

**建议：**

- 测试行为（用户所见/所做），而非实现细节
- 使用 Arrange-Act-Assert 结构
- 每个测试只包含一个断言
- 使用描述性的测试名称
- Mock 外部依赖

**避免：**

- 测试 Vue 内部机制（响应式）
- 测试第三方库
- 测试简单 getter/setter
- 测试实现细节

## 应该测试的内容

**测试：**

- 用户交互（点击、输入）
- 条件渲染
- Props 验证、触发事件
- 计算属性、业务逻辑

**跳过：**

- Vue 内部机制、第三方库
- 简单的 getter/setter
- 实现细节

## 运行

```bash
pnpm test                          # 全部测试
pnpm exec vitest Button.spec.ts   # 指定文件
pnpm exec vitest --watch           # 监控模式
pnpm test --coverage               # 代码覆盖率
```

**文档：** [vitest.dev](https://vitest.dev/) · [test-utils.vuejs.org](https://test-utils.vuejs.org/)
