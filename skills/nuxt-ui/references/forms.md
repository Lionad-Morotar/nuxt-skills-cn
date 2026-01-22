# 表单

## 表单组件

| 组件        | 目的             | 关键属性                                     | 版本 |
| ----------- | ---------------- | -------------------------------------------- | ---- |
| `UInput`    | 文本输入         | `type`、`placeholder`、`icon`、`loading`     |      |
| `UTextarea` | 多行文本         | `rows`、`autoresize`、`maxrows`              |      |
| `USelect`   | 原生选择器       | `options`、`placeholder`                     |      |
| `USelectMenu` | 自定义选择器   | `options`、`searchable`、`multiple`          |      |
| `UInputMenu` | 自动补全输入框   | `options`、`searchable`                      |      |
| `UCheckbox` | 单个复选框       | `label`、`description`                       |      |
| `UCheckboxGroup` | 多个复选框   | `items`、`orientation`                       |      |
| `URadioGroup` | 单选选项组     | `items`、`orientation`                       |      |
| `USwitch`   | 切换开关         | `label`、`description`、`on-icon`、`off-icon` |      |
| `USlider`   | 范围滑块         | `min`、`max`、`step`                         |      |
| `UPinInput` | 验证码/OTP 输入 | `length`、`type`、`mask`                     |      |
| `UInputNumber` | 数字输入框    | `min`、`max`、`step`、`format-options`       |      |
| `UInputDate` | 日期选择器      | `mode`、`range`、`locale`                    | v4.2+ |
| `UInputTime` | 时间选择器      | `hour-cycle`、`minute-step`                  | v4.2+ |
| `UInputTags` | 标签输入框      | `max`、`placeholder`                         |      |
| `UColorPicker` | 颜色选择器    | `format`、`swatches`                         |      |
| `UFileUpload` | 文件上传        | `accept`、`multiple`、`max-files`            |      |

## 基础输入示例

```vue
<script setup>
const email = ref('')
const bio = ref('')
const country = ref('')
</script>

<template>
  <!-- 文本输入框 -->
  <UInput v-model="email" type="email" placeholder="Email" icon="i-heroicons-envelope" />

  <!-- 带验证状态 -->
  <UInput v-model="email" :color="emailError ? 'error' : undefined" />

  <!-- 多行文本输入框 -->
  <UTextarea v-model="bio" placeholder="Bio" :rows="3" autoresize />

  <!-- 选择器 -->
  <USelect v-model="country" :options="['USA', 'Canada', 'Mexico']" placeholder="Country" />
</template>
```

## SelectMenu（自定义下拉菜单）

```vue
<script setup>
const selected = ref()
const options = [
  { label: 'John', value: 'john', avatar: { src: '/john.png' } },
  { label: 'Jane', value: 'jane', avatar: { src: '/jane.png' } }
]
</script>

<template>
  <USelectMenu v-model="selected" :options="options" searchable placeholder="Select user">
    <template #option="{ option }">
      <UAvatar v-bind="option.avatar" size="xs" />
      <span>{{ option.label }}</span>
    </template>
  </USelectMenu>
</template>
```

## 复选框与单选按钮

```vue
<script setup>
const agreed = ref(false)
const plan = ref('free')
const features = ref([])
</script>

<template>
  <!-- 单个复选框 -->
  <UCheckbox v-model="agreed" label="I agree to terms" description="Required" />

  <!-- 单选按钮组 -->
  <URadioGroup
    v-model="plan"
    :items="[
      { label: 'Free', value: 'free', description: '$0/mo' },
      { label: 'Pro', value: 'pro', description: '$10/mo' }
    ]"
  />

  <!-- 复选框组 -->
  <UCheckboxGroup
    v-model="features"
    :items="[
      { label: 'Dark mode', value: 'dark' },
      { label: 'Notifications', value: 'notifications' }
    ]"
  />
</template>
```

## 表单验证

使用标准模式（Zod、Valibot、Yup、Joi 等）

### 使用 Zod

```vue
<script setup lang="ts">
import { z } from 'zod'

const schema = z.object({
  email: z.string().email('Invalid email'),
  password: z.string().min(8, 'Min 8 characters')
})

type Schema = z.output<typeof schema>

const state = reactive<Partial<Schema>>({
  email: '',
  password: ''
})

const form = ref()

async function onSubmit() {
  await form.value.validate()
  // 提交逻辑
}
</script>

<template>
  <UForm ref="form" :schema="schema" :state="state" @submit="onSubmit">
    <UFormField name="email" label="Email">
      <UInput v-model="state.email" type="email" />
    </UFormField>

    <UFormField name="password" label="Password">
      <UInput v-model="state.password" type="password" />
    </UFormField>

    <UButton type="submit">Submit</UButton>
  </UForm>
</template>
```

### 使用 Valibot

```vue
<script setup lang="ts">
import * as v from 'valibot'

const schema = v.object({
  email: v.pipe(v.string(), v.email('Invalid email')),
  password: v.pipe(v.string(), v.minLength(8, 'Min 8 characters'))
})

type Schema = v.InferOutput<typeof schema>

const state = reactive<Partial<Schema>>({
  email: '',
  password: ''
})
</script>

<template>
  <UForm :schema="schema" :state="state" @submit="onSubmit">
    <!-- 与上述相同 -->
  </UForm>
</template>
```

## UFormField 属性

```vue
<UFormField
  name="email"              <!-- 字段名称（与状态键匹配） -->
  label="Email"             <!-- 标签文本 -->
  description="Your email"  <!-- 帮助文本 -->
  hint="Optional"           <!-- 右对齐提示 -->
  required                  <!-- 显示星号 -->
  :help="error?.message"    <!-- 错误信息 -->
>
  <UInput v-model="state.email" />
</UFormField>
```

## UFieldGroup（字段组）

```vue
<UFieldGroup label="Name">
  <UInput v-model="firstName" placeholder="First" />
  <UInput v-model="lastName" placeholder="Last" />
</UFieldGroup>
```

## 输入状态

```vue
<!-- 禁用 -->
<UInput disabled placeholder="Disabled" />

<!-- 加载中 -->
<UInput :loading="true" placeholder="Loading..." />

<!-- 带图标 -->
<UInput icon="i-heroicons-magnifying-glass" placeholder="Search" />

<!-- 尾部图标 -->
<UInput trailing-icon="i-heroicons-x-mark" placeholder="Clearable" />
```

## 文件上传

```vue
<script setup>
const { files, open, reset } = useFileUpload()
</script>

<template>
  <UFileUpload v-model="files" accept="image/*" multiple :max-files="5">
    <UButton @click="open">Upload</UButton>
  </UFileUpload>
</template>
```

## 日期与时间选择器（v4.2+）

### 日期选择器

```vue
<script setup>
const date = ref(new Date())
const range = ref({ start: new Date(), end: new Date() })
</script>

<template>
  <!-- 单个日期 -->
  <UInputDate v-model="date" />

  <!-- 日期范围 -->
  <UInputDate v-model="range" mode="range" />

  <!-- 带本地化 -->
  <UInputDate v-model="date" locale="es" />
</template>
```

### 时间选择器

```vue
<script setup>
import { Time } from '@internationalized/date'

const time = ref(new Time(12, 0))
</script>

<template>
  <!-- 基础时间选择器 -->
  <UInputTime v-model="time" />

  <!-- 24小时格式 -->
  <UInputTime v-model="time" hour-cycle="24" />

  <!-- 自定义步长（分钟） -->
  <UInputTime v-model="time" :minute-step="15" />
</template>
```

## 常见模式

### 登录表单

```vue
<UForm :schema="loginSchema" :state="state" @submit="login">
  <UFormField name="email" label="Email" required>
    <UInput v-model="state.email" type="email" icon="i-heroicons-envelope" />
  </UFormField>
  <UFormField name="password" label="Password" required>
    <UInput v-model="state.password" type="password" icon="i-heroicons-lock-closed" />
  </UFormField>
  <UButton type="submit" block :loading="loading">Sign in</UButton>
</UForm>
```

### 设置表单

```vue
<UForm :state="settings" @submit="save">
  <UFormField name="notifications" label="Notifications">
    <USwitch v-model="settings.notifications" label="Enable notifications" />
  </UFormField>
  <UFormField name="theme" label="Theme">
    <URadioGroup v-model="settings.theme" :items="themeOptions" />
  </UFormField>
  <UButton type="submit">Save</UButton>
</UForm>
```

## 最佳实践

| 做法                             | 不做法                      |
| -------------------------------- | --------------------------- |
| 使用 UForm + UFormField          | 构建自定义表单包装器        |
| 使用标准模式（Zod/Valibot）     | 编写自定义验证逻辑          |
| 在表单输入框中使用 v-model       | 手动同步表单状态            |
| 使用 `required` 属性显示星号     | 手动添加星号                |
| 使用 `description` 提供帮助文本  | 使用独立的帮助元素          |
