# Vue 组件

使用 Composition API 和 `<script setup>` 的 Vue 3 组件模式。

## 快速参考

| 模式                  | 语法                                                            |
| --------------------- | --------------------------------------------------------------- |
| Props（解构）         | `const { name = 'default' } = defineProps<{ name?: string }>()` |
| Props（仅模板）       | `defineProps<{ name: string }>()`                               |
| Emits                 | `const emit = defineEmits<{ click: [id: number] }>()`           |
| 双向绑定              | `const model = defineModel<string>()`                           |
| Slots 简写            | `<template #header>` 而非 `<template v-slot:header>`             |

## 命名

**文件命名：** PascalCase（`UserProfile.vue`）或 kebab-case（`user-profile.vue`）——保持一致

**代码中的组件名称：** 始终使用 PascalCase

**组合方式：** 通用 → 具体：`SearchButtonClear.vue` 而非 `ClearSearchButton.vue`

## Props

**在脚本中使用或需要默认值时，使用带默认值的解构（Vue 3.5+）：**

```ts
const { count = 0, message = 'Hello' } = defineProps<{
  count?: number
  message?: string
  required: boolean
}>()

// 直接使用 —— 维持响应性
console.log(count + 1)

// ⚠️ 传递给监听器/函数时，需包裹在 getter 中：
watch(() => count, (newVal) => { ... }) // ✅ 正确
watch(count, (newVal) => { ... })        // ❌ 不生效
```

**若 Props 仅用于模板，则不进行解构：**

```ts
defineProps<{ count: number }>()
// 模板中使用：{{ count }}
```

**同名简写（Vue 3.4+）：** 使用 `:count` 而非 `:count="count"`

```vue
<MyComponent :count :user :items />
<!-- 等同于：:count="count" :user="user" :items="items" -->
```

[响应式解构文档](https://vuejs.org/guide/components/props#reactive-props-destructure)

## Emits

类型安全的事件定义：

```ts
const emit = defineEmits<{
  update: [id: number, value: string] // 多参数
  close: [] // 无参数
}>()

// 使用方式
emit('update', 123, 'new value')
emit('close')
```

**模板语法：** kebab-case（`@update-item`）与脚本中 camelCase（`updateItem`）一致

## Slots

**始终使用简写：** `<template #header>` 而非 `<template v-slot:header>`

**所有 slot 始终使用显式的 `<template>` 标签**

```vue
<template>
  <Card>
    <template #header>
      <h2>标题</h2>
    </template>
    <template #default>
      内容
    </template>
  </Card>
</template>
```

## defineModel() - 双向绑定

替代手动设置 `modelValue` prop 和 `update:modelValue` emit。

### 基本用法

```vue
<script setup lang="ts">
const title = defineModel<string>()
</script>

<template>
  <input v-model="title">
</template>
```

### 带选项

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

**⚠️ 注意：** 使用 `default` 但父组件未提供值时，父组件和子组件可能不同步（父组件为 `undefined`，子组件使用默认值）。请在父组件提供匹配的默认值或设为必需属性。

### 多个模型

默认假定 `modelValue` prop。多个绑定时，请使用显式名称：

```vue
<script setup lang="ts">
const firstName = defineModel<string>('firstName')
const age = defineModel<number>('age')
</script>

<!-- 使用方式 -->
<UserForm v-model:first-name="user.firstName" v-model:age="user.age" />
```

[v-model 修饰符文档](https://vuejs.org/guide/components/v-model#handling-v-model-modifiers)

## 可复用模板

为组件内的类型化、作用域模板片段创建可复用模板：

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

  <!-- 多次复用 -->
  <UseItem v-for="item in items" :key="item.id" :item :icon="getIcon(item)" />
</template>
```

## 模板引用（Vue 3.5+）

使用 `useTemplateRef()` 获取类型安全的模板引用，支持 IDE 提示：

```vue
<script setup lang="ts">
import { useTemplateRef, onMounted } from 'vue'

const input = useTemplateRef<HTMLInputElement>('my-input')

onMounted(() => {
  input.value?.focus()
})
</script>

<template>
  <input ref="my-input">
</template>
```

**相比 `ref()` 的优势：**

- 类型安全，支持泛型
- 更好的 IDE 自动补全与重构支持
- 显式引用名称作为字符串字面量

**动态引用：**

```vue
<script setup lang="ts">
const items = ref(['a', 'b', 'c'])
const itemRefs = useTemplateRef<HTMLElement>('item')

// 挂载后访问引用
onMounted(() => {
  console.log(itemRefs.value) // 元素数组
})
</script>

<template>
  <div v-for="item in items" :key="item" ref="item">
    {{ item }}
  </div>
</template>
```

## SSR 水合（Vue 3.5+）

**忽略水合不匹配：** 对于服务端与客户端之间不同的值：

```vue
<template>
  <!-- 仅客户端显示的值 -->
  <span data-allow-mismatch>{{ new Date().toLocaleString() }}</span>

  <!-- 明确的不匹配类型 -->
  <span data-allow-mismatch="text">{{ timestamp }}</span>
  <span data-allow-mismatch="children">
    <ClientOnly>...</ClientOnly>
  </span>
  <span data-allow-mismatch="style">...</span>
  <span data-allow-mismatch="class">...</span>
  <span data-allow-mismatch="attribute">...</span>
</template>
```

**生成 SSR 稳定的 ID：**

```vue
<script setup lang="ts">
import { useId } from 'vue'

const id = useId() // 在服务端和客户端保持一致
</script>

<template>
  <label :for="id">名称</label>
  <input :id="id">
</template>
```

## 延迟传送（Vue 3.5+）

将内容传送到当前循环中稍后渲染的元素：

```vue
<template>
  <!-- 先渲染 -->
  <Teleport defer to="#late-div">
    <span>延迟内容</span>
  </Teleport>

  <!-- 后渲染，但 Teleport 等待 -->
  <div id="late-div"></div>
</template>
```

不使用 `defer` 时，若 `#late-div` 尚未存在，则传送会失败。

## 常见错误

**使用 `const props =` 进行解构：**

```ts
// ❌ 错误
const props = defineProps<{ count: number }>()
const { count } = props // 失去响应性
```

**忘记 TypeScript 类型定义：**

```ts
// ❌ 错误
const emit = defineEmits(['update'])

// ✅ 正确
const emit = defineEmits<{ update: [id: number] }>()
```

**组件超过 300 行：** 应拆分为更小的组件或提取逻辑到组合式函数中
