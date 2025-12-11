---
description: Use when editing .vue files, creating Vue 3 components, writing composables, or testing Vue code - provides Composition API patterns, props/emits best practices, VueUse integration, and reactive destructuring guidance
mode: subagent
tools:
  write: false
  edit: false
---

# Vue 3 Development

Reference for Vue 3 Composition API patterns, component architecture, and testing practices.

## Overview

Progressive reference system for Vue 3 projects. Load only files relevant to current task to minimize context usage (~250 tokens base, 500-1500 per sub-file).

## When to Use

**Use this skill when:**
- Writing `.vue` components
- Creating composables (`use*` functions)
- Building client-side utilities
- Testing Vue components/composables

**Use `nuxt` skill instead for:**
- Server routes, API endpoints
- File-based routing, middleware
- Nuxt-specific patterns

## Quick Reference

| Working on... | Load this file |
|--------------|----------------|
| `.vue` in `components/` | components.md |
| File in `composables/` | composables.md |
| File in `utils/` | utils-client.md |
| `.spec.ts` or `.test.ts` | testing.md |

## Loading Files

**Load one file at a time based on file context:**

```bash
# Component work
cat ~/.claude/skills/vue/components.md

# Composable work
cat ~/.claude/skills/vue/composables.md

# Utils work
cat ~/.claude/skills/vue/utils-client.md

# Testing
cat ~/.claude/skills/vue/testing.md
```

**DO NOT load all files at once** - wastes context on irrelevant patterns.

## Available Guidance

**components.md** - Props with reactive destructuring, emits patterns, defineModel for v-model, slots shorthand

**composables.md** - Composition API structure, VueUse integration, lifecycle hooks, async patterns

**utils-client.md** - Pure functions, formatters, validators, transformers, when NOT to use utils

**testing.md** - Vitest + @vue/test-utils, component testing, composable testing, mocking patterns

## Examples

Working examples in `resources/examples/`:
- `component-example.vue` - Full component with all patterns
- `composable-example.ts` - Reusable composition function

---

# Vue Components

Patterns for Vue 3 components using Composition API with `<script setup>`.

## Quick Reference

| Pattern | Syntax |
|---------|--------|
| Props (destructured) | `const { name = 'default' } = defineProps<{ name?: string }>()` |
| Props (template-only) | `defineProps<{ name: string }>()` |
| Emits | `const emit = defineEmits<{ click: [id: number] }>()` |
| Two-way binding | `const model = defineModel<string>()` |
| Slots shorthand | `<template #header>` not `<template v-slot:header>` |

## Naming

**Files:** PascalCase (`UserProfile.vue`) OR kebab-case (`user-profile.vue`) - be consistent

**Component names in code:** Always PascalCase

**Composition:** General → Specific: `SearchButtonClear.vue` not `ClearSearchButton.vue`

## Props

**Destructure with defaults (Vue 3.5+)** when used in script or need defaults:

```ts
const { count = 0, message = 'Hello' } = defineProps<{
  count?: number
  message?: string
  required: boolean
}>()

// Use directly - maintains reactivity
console.log(count + 1)
```

**Non-destructured** only if props ONLY used in template:

```ts
defineProps<{ count: number }>()
// Template: {{ count }}
```

**Same-name shorthand (Vue 3.4+):** `:count` instead of `:count="count"`

```vue
<MyComponent :count :user :items />
<!-- Same as: :count="count" :user="user" :items="items" -->
```

[Reactive destructuring docs](https://vuejs.org/guide/components/props#reactive-props-destructure)

## Emits

Type-safe event definitions:

```ts
const emit = defineEmits<{
  update: [id: number, value: string]  // multiple args
  close: []                             // no args
}>()

// Usage
emit('update', 123, 'new value')
emit('close')
```

**Template syntax:** kebab-case (`@update-item`) vs camelCase in script (`updateItem`)

## Slots

**Always use shorthand:** `<template #header>` not `<template v-slot:header>`

**Always explicit `<template>` tags** for all slots

```vue
<template>
  <Card>
    <template #header>
      <h2>Title</h2>
    </template>
    <template #default>
      Content
    </template>
  </Card>
</template>
```

## defineModel() - Two-Way Binding

Replaces manual `modelValue` prop + `update:modelValue` emit.

### Basic

```vue
<script setup lang="ts">
const title = defineModel<string>()
</script>

<template>
  <input v-model="title">
</template>
```

### With Options

```vue
<script setup lang="ts">
const [title, modifiers] = defineModel<string>({
  default: 'default value',
  required: true,
  get: (value) => value.trim(),
  set: (value) => {
    if (modifiers.capitalize) {
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
    return value
  },
})
</script>
```

### Multiple Models

Default assumes `modelValue` prop. For multiple bindings, use explicit names:

```vue
<script setup lang="ts">
const firstName = defineModel<string>('firstName')
const age = defineModel<number>('age')
</script>

<!-- Usage -->
<UserForm v-model:first-name="user.firstName" v-model:age="user.age" />
```

[v-model modifiers docs](https://vuejs.org/guide/components/v-model.md#handling-v-model-modifiers)

## Reusable Templates

For typed, scoped template snippets within a component:

```vue
<script setup lang="ts">
import { createReusableTemplate } from '@vueuse/core'

const [DefineItem, UseItem] = createReusableTemplate<{
  item: SearchItem
  icon: string
  color?: 'red' | 'green' | 'blue'
}>()
</script>

<template>
  <DefineItem v-slot="{ item, icon, color }">
    <div :class="color">
      <Icon :name="icon" />
      {{ item.name }}
    </div>
  </DefineItem>

  <!-- Reuse multiple times -->
  <UseItem v-for="item in items" :key="item.id" :item :icon="getIcon(item)" />
</template>
```

## Common Mistakes

**Using `const props =` with destructured values:**
```ts
// ❌ Wrong
const props = defineProps<{ count: number }>()
const { count } = props  // Loses reactivity
```

**Forgetting TypeScript types:**
```ts
// ❌ Wrong
const emit = defineEmits(['update'])

// ✅ Correct
const emit = defineEmits<{ update: [id: number] }>()
```

**Components >300 lines:** Split into smaller components or extract logic to composables

---

# Vue Composables

Reusable functions encapsulating stateful logic using Composition API.

## Core Rules

1. **VueUse first** - check [vueuse.org](https://vueuse.org) before writing custom
2. **No async composables** - lose lifecycle context when awaited in other composables
3. **Top-level only** - never call in event handlers, conditionals, or loops
4. **readonly() exports** - protect internal state from external mutation
5. **useState() for SSR** - use Nuxt's `useState()` not global refs

## Quick Reference

| Pattern | Example |
|---------|---------|
| Naming | `useAuth`, `useCounter`, `useDebounce` |
| State | `const count = ref(0)` |
| Computed | `const double = computed(() => count.value * 2)` |
| Lifecycle | `onMounted(() => ...)`, `onUnmounted(() => ...)` |
| Return | `return { count, increment }` |

## Structure

```ts
// composables/useCounter.ts
import { ref, readonly } from 'vue'

export function useCounter(initialValue = 0) {
  const count = ref(initialValue)

  function increment() { count.value++ }
  function decrement() { count.value-- }
  function reset() { count.value = initialValue }

  return {
    count: readonly(count),  // readonly if shouldn't be mutated
    increment,
    decrement,
    reset,
  }
}
```

## Naming

**Always prefix with `use`:** `useAuth`, `useLocalStorage`, `useDebounce`

**File = function:** `useAuth.ts` exports `useAuth`

## Best Practices

✅ Return object with named properties (destructuring-friendly)
✅ Accept options object for configuration
✅ Use `readonly()` for state that shouldn't mutate
✅ Handle cleanup (`onUnmounted`, `onScopeDispose`)
✅ Add JSDoc for complex functions

## Lifecycle

Hooks execute in component context:

```ts
export function useEventListener(target: EventTarget, event: string, handler: Function) {
  onMounted(() => target.addEventListener(event, handler))
  onUnmounted(() => target.removeEventListener(event, handler))
}
```

## Async Pattern

```ts
export function useAsyncData<T>(fetcher: () => Promise<T>) {
  const data = ref<T | null>(null)
  const error = ref<Error | null>(null)
  const loading = ref(false)

  async function execute() {
    loading.value = true
    error.value = null
    try {
      data.value = await fetcher()
    } catch (e) {
      error.value = e as Error
    } finally {
      loading.value = false
    }
  }

  execute()
  return { data, error, loading, refetch: execute }
}
```

**Data fetching:** Prefer Pinia Colada queries over custom composables.

## VueUse Integration

**Check VueUse FIRST** - most patterns already implemented: [vueuse.org/functions.html](https://vueuse.org/functions.html)

**Available categories:**
- DOM: `useEventListener`, `useIntersectionObserver`
- State: `useLocalStorage`, `useSessionStorage`
- Sensors: `useMouse`, `useScroll`, `useNetwork`
- Animation: `useTransition`, `useInterval`
- Utilities: `useDebounce`, `useThrottle`, `useFetch`

Only create custom when VueUse doesn't cover your case.

## Advanced Patterns

### Singleton Composable

Share state across all components using the same composable:

```ts
import { createSharedComposable } from '@vueuse/core'

function useMapControlsBase() {
  const mapInstance = ref<Map | null>(null)
  const flyTo = (coords: [number, number]) => mapInstance.value?.flyTo(coords)
  return { mapInstance, flyTo }
}

export const useMapControls = createSharedComposable(useMapControlsBase)
```

### Cancellable Fetch with AbortController

```ts
export function useSearch() {
  let abortController: AbortController | null = null

  watch(query, async (newQuery) => {
    abortController?.abort()
    abortController = new AbortController()

    try {
      const data = await $fetch('/api/search', {
        query: { q: newQuery },
        signal: abortController.signal,
      })
    } catch (e) {
      if (e.name !== 'AbortError') throw e
    }
  })
}
```

### Step-Based State Machine

```ts
export function useSendFlow() {
  const step = ref<'input' | 'confirm' | 'success'>('input')
  const amount = ref('')

  const next = () => {
    if (step.value === 'input') step.value = 'confirm'
    else if (step.value === 'confirm') step.value = 'success'
  }

  return { step, amount, next }
}
```

### Client-Only Guards

```ts
export function useUserLocation() {
  const location = ref<GeolocationPosition | null>(null)

  if (import.meta.client) {
    navigator.geolocation.getCurrentPosition(pos => location.value = pos)
  }

  return { location }
}
```

### Auto-Save with Debounce

```ts
export function useAutoSave(content: Ref<string>) {
  const hasChanges = ref(false)

  const save = useDebounceFn(async () => {
    if (!hasChanges.value) return
    await $fetch('/api/save', { method: 'POST', body: { content: content.value } })
    hasChanges.value = false
  }, 1000)

  watch(content, () => {
    hasChanges.value = true
    save()
  })

  return { hasChanges }
}
```

### Tagged Logger

```ts
import { consola } from 'consola'

export function useSearch() {
  const logger = consola.withTag('search')

  watch(query, (q) => {
    logger.info('Query changed:', q)
  })
}
```

## Common Mistakes

**Not using `readonly()` for internal state:**
```ts
// ❌ Wrong - exposes mutable ref
return { count }

// ✅ Correct - prevents external mutation
return { count: readonly(count) }
```

**Missing cleanup:**
```ts
// ❌ Wrong - listener never removed
onMounted(() => target.addEventListener('click', handler))

// ✅ Correct - cleanup on unmount
onMounted(() => target.addEventListener('click', handler))
onUnmounted(() => target.removeEventListener('click', handler))
```

---

# Vue Testing

Test patterns for Vue 3 components, composables, and utilities.

## Quick Reference

| Test Type | Pattern |
|-----------|---------|
| Component | `mount(Component, { props, slots })` |
| User interaction | `await wrapper.trigger('click')` |
| Emitted events | `wrapper.emitted('update')` |
| Composable | Call directly, test return values |
| Utils | Pure function testing (easiest) |

## Stack

- **Vitest** - test runner
- **@vue/test-utils** - component mounting, interaction
- **@testing-library/vue** - user-centric alternative
- **happy-dom / jsdom** - DOM environment

## File Location

Colocate tests with code:
```
Button.vue → Button.spec.ts
useAuth.ts → useAuth.spec.ts
formatters.ts → formatters.spec.ts
```

## Component Tests

### Basic

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

### Emits

```ts
it('emits update with payload', async () => {
  const wrapper = mount(Input)
  await wrapper.find('input').setValue('new value')
  expect(wrapper.emitted('update:modelValue')?.[0]).toEqual(['new value'])
})
```

### Slots

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

## Composable Tests

Call directly, no mounting needed:

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

## Utils Tests

Easiest - pure functions:

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

## Mocking

**Composables:**
```ts
import { vi } from 'vitest'

vi.mock('./useAuth', () => ({
  useAuth: vi.fn(() => ({
    user: { id: 1, name: 'Test' },
    isAuthenticated: true
  }))
}))
```

**API calls:**
```ts
global.fetch = vi.fn(() =>
  Promise.resolve({
    json: () => Promise.resolve({ data: [] })
  })
)
```

## Best Practices

✅ Test behavior (what user sees/does), not implementation
✅ Arrange-Act-Assert structure
✅ One assertion per test
✅ Descriptive test names
✅ Mock external dependencies

❌ Don't test Vue internals (reactivity)
❌ Don't test third-party libraries
❌ Don't test trivial getters/setters
❌ Don't test implementation details

## What to Test

**Test:**
- User interactions (clicks, inputs)
- Conditional rendering
- Props validation, emitted events
- Computed values, business logic

**Skip:**
- Vue internals, third-party libs
- Trivial getters/setters
- Implementation details

## Running

```bash
pnpm test                          # all
pnpm exec vitest Button.spec.ts   # specific
pnpm exec vitest --watch           # watch
pnpm test --coverage               # coverage
```

**Docs:** [vitest.dev](https://vitest.dev/) · [test-utils.vuejs.org](https://test-utils.vuejs.org/)

---

# Client Utilities

Pure functions for formatting, validation, transformation, and parsing.

## Quick Reference

| Category | Examples |
|----------|----------|
| Formatters | `formatCurrency`, `formatDate`, `formatBytes` |
| Validators | `isValidEmail`, `isValidUrl`, `isValidPhone` |
| Transformers | `slugify`, `truncate`, `capitalize` |
| Parsers | `parseQuery`, `parseJSON`, `parseDate` |

## Rules

**Pure functions:**
- Same input → same output
- No side effects
- No external state mutation
- No API calls, no refs, no reactive

**When NOT to use utils:**
- Stateful logic → use composables
- Vue-specific → use composables
- Component logic → keep in component
- API calls → use queries

## Structure

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

**Naming:** Descriptive verbs (`formatCurrency`, `validateEmail`, `parseQuery`)
**Organization:** Group by category (`formatters.ts`, `validators.ts`)
**Exports:** Named exports only

## Examples by Category

**Formatters:**
```ts
// utils/formatters.ts
export function formatBytes(bytes: number): string { ... }
export function formatPhone(phone: string): string { ... }
```

**Validators:**
```ts
// utils/validators.ts
export function isValidEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

export function isValidUrl(url: string): boolean {
  try { new URL(url); return true }
  catch { return false }
}
```

**Transformers:**
```ts
// utils/transformers.ts
export function slugify(text: string): string {
  return text.toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
}

export function truncate(text: string, length: number): string {
  return text.length > length ? text.slice(0, length) + '...' : text
}
```

**Parsers:**
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

## Common Mistakes

**Side effects (not pure):**
```ts
// ❌ Wrong - mutates external state
let count = 0
export function increment() {
  count++
  return count
}

// ✅ Correct - pure
export function add(a: number, b: number): number {
  return a + b
}
```

**Using utils for stateful logic:**
```ts
// ❌ Wrong - should be composable
export function useCounter() { ... }

// ✅ Correct - pure transformation
export function formatCount(count: number): string { ... }
```

## Organization

**Flat for small projects:**
```
utils/
├── formatters.ts
├── validators.ts
└── transformers.ts
```

**Nested for large projects:**
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
