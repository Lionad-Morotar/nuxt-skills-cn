# Vue 组合式函数

使用组合式 API 封装有状态逻辑的可重用函数。

## 核心规则

1. **优先使用 VueUse** - 在编写自定义函数前请先查看 [vueuse.org](https://vueuse.org)
2. **禁止异步组合式函数** - 在其他组合式函数中等待时会丢失生命周期上下文
3. **仅在顶层调用** - 永远不要在事件处理程序、条件语句或循环中调用
4. **导出只读状态** - 防止外部修改内部状态
5. **SSR 使用 useState()** - 使用 Nuxt 的 `useState()` 而非全局引用

## 快速参考

| 模式      | 示例                                             |
| --------- | ------------------------------------------------ |
| 命名      | `useAuth`, `useCounter`, `useDebounce`           |
| 状态      | `const count = ref(0)`                           |
| 计算属性  | `const double = computed(() => count.value * 2)` |
| 生命周期  | `onMounted(() => ...)`, `onUnmounted(() => ...)` |
| 返回值    | `return { count, increment }`                    |

## 结构

```ts
// composables/useCounter.ts
import { readonly, ref } from 'vue'

export function useCounter(initialValue = 0) {
  const count = ref(initialValue)

  function increment() { count.value++ }
  function decrement() { count.value-- }
  function reset() { count.value = initialValue }

  return {
    count: readonly(count), // 如果不应被修改，则设为只读
    increment,
    decrement,
    reset,
  }
}
```

## 命名

**始终以 `use` 开头：** `useAuth`, `useLocalStorage`, `useDebounce`

**文件名 = 函数名：** `useAuth.ts` 导出 `useAuth`

## 最佳实践

**应做：**

- 返回具有命名属性的对象（便于解构）
- 接收选项对象用于配置
- 对不应修改的状态使用 `readonly()`
- 处理清理逻辑（`onUnmounted`, `onScopeDispose`）
- 为复杂函数添加 JSDoc 注释

## 生命周期

钩子在组件上下文中执行：

```ts
export function useEventListener(target: EventTarget, event: string, handler: Function) {
  onMounted(() => target.addEventListener(event, handler))
  onUnmounted(() => target.removeEventListener(event, handler))
}
```

**监听器清理（Vue 3.5+）：**

```ts
import { watch, onWatcherCleanup } from 'vue'

export function usePolling(url: Ref<string>) {
  watch(url, (newUrl) => {
    const interval = setInterval(() => {
      fetch(newUrl).then(/* ... */)
    }, 1000)

    // 监听器重新运行或停止时清理
    onWatcherCleanup(() => {
      clearInterval(interval)
    })
  })
}
```

**使用 `onWatcherCleanup()` 的优势：**

- 比返回清理函数更简洁
- 支持异步监听器
- 可在同一个监听器中多次调用

## 异步模式

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
    }
    catch (e) {
      error.value = e as Error
    }
    finally {
      loading.value = false
    }
  }

  execute()
  return { data, error, loading, refetch: execute }
}
```

**数据获取：** 优先使用 Pinia Colada 查询而非自定义组合式函数。

## VueUse

> 如需 VueUse 组合式函数参考，请使用 `vueuse` 技能。

在编写自定义组合式函数前请检查 VueUse - 大多数模式已实现。

> **如为 Nuxt 特定组合式函数**（useFetch, useRequestURL）：请查阅 `nuxt` 技能中的 nuxt-composables.md

## 高级模式

### 单例组合式函数

通过同一组合式函数在所有组件间共享状态：

```ts
import { createSharedComposable } from '@vueuse/core'

function useMapControlsBase() {
  const mapInstance = ref<Map | null>(null)
  const flyTo = (coords: [number, number]) => mapInstance.value?.flyTo(coords)
  return { mapInstance, flyTo }
}

export const useMapControls = createSharedComposable(useMapControlsBase)
```

### 带 AbortController 的可取消请求

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
    }
    catch (e) {
      if (e.name !== 'AbortError')
        throw e
    }
  })
}
```

### 基于步骤的状态机

```ts
export function useSendFlow() {
  const step = ref<'input' | 'confirm' | 'success'>('input')
  const amount = ref('')

  const next = () => {
    if (step.value === 'input')
      step.value = 'confirm'
    else if (step.value === 'confirm')
      step.value = 'success'
  }

  return { step, amount, next }
}
```

### 仅客户端保护

```ts
export function useUserLocation() {
  const location = ref<GeolocationPosition | null>(null)

  if (import.meta.client) {
    navigator.geolocation.getCurrentPosition(pos => location.value = pos)
  }

  return { location }
}
```

### 自定义元素组合式函数（Vue 3.5+）

对于自定义元素组件，使用内置辅助函数：

```ts
import { useHost, useShadowRoot } from 'vue'

export function useCustomElement() {
  const host = useHost() // 主元素引用
  const shadowRoot = useShadowRoot() // Shadow DOM 根

  onMounted(() => {
    console.log('Host:', host)
    console.log('Shadow:', shadowRoot)
  })

  return { host, shadowRoot }
}
```

**可用场景：**

- 在自定义元素中使用 `<script setup>` 的组件
- Options API 中通过 `this.$host` 访问

### 带防抖的自动保存

```ts
export function useAutoSave(content: Ref<string>) {
  const hasChanges = ref(false)

  const save = useDebounceFn(async () => {
    if (!hasChanges.value)
      return
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

### 带标签的日志记录器

```ts
import { consola } from 'consola'

export function useSearch() {
  const logger = consola.withTag('search')

  watch(query, (q) => {
    logger.info('Query changed:', q)
  })
}
```

## 常见错误

**未对内部状态使用 `readonly()`：**

```ts
// ❌ 错误 - 暴露了可变引用
return { count }

// ✅ 正确 - 防止外部修改
return { count: readonly(count) }
```

**遗漏清理逻辑：**

```ts
// ❌ 错误 - 监听器从未移除
onMounted(() => target.addEventListener('click', handler))

// ✅ 正确 - 在卸载时清理
onMounted(() => target.addEventListener('click', handler))
onUnmounted(() => target.removeEventListener('click', handler))
```
