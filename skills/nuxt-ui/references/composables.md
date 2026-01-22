# 组合式函数

## useToast

显示通知。需要 `<UApp>` 包装器。

```ts
const toast = useToast()

// 添加通知
toast.add({
  title: '成功',
  description: '项目已保存',
  color: 'success',
  icon: 'i-heroicons-check-circle',
  timeout: 5000
})

// 移除特定通知
toast.remove('toast-id')

// 清除所有通知
toast.clear()
```

参见 overlays.md 获取完整的通知选项。

## useOverlay

程序化创建模态框、滑动面板和抽屉。

```ts
const overlay = useOverlay()

// 创建模态框
const modal = overlay.create(MyModalComponent, {
  props: { title: '确认' },
  modal: true // 默认值：true
})

// 等待结果
const result = await modal.result

// 程序化关闭
modal.close(returnValue)
```

### 确认对话框模式

```vue
<!-- ConfirmDialog.vue -->
<script setup>
const props = defineProps<{ title: string; message: string }>()
const emit = defineEmits(['confirm', 'cancel'])
</script>

<template>
  <UModal :open="true">
    <template #header>{{ title }}</template>
    <p>{{ message }}</p>
    <template #footer>
      <UButton variant="ghost" @click="emit('cancel')">取消</UButton>
      <UButton color="error" @click="emit('confirm')">确认</UButton>
    </template>
  </UModal>
</template>
```

```ts
// 使用方式
const overlay = useOverlay()

async function confirmDelete() {
  const modal = overlay.create(ConfirmDialog, {
    props: { title: '删除？', message: '此操作无法撤销。' },
    events: {
      confirm: () => modal.close(true),
      cancel: () => modal.close(false)
    }
  })

  if (await modal.result) {
    // 删除项目
  }
}
```

## defineShortcuts

定义键盘快捷键。

```ts
defineShortcuts({
  // 单个按键
  escape: () => closeModal(),

  // 组合键（meta = Mac 上的 Cmd，Windows 上的 Ctrl）
  meta_k: () => openSearch(),
  meta_shift_p: () => openCommandPalette(),

  // Ctrl 特定键
  ctrl_s: () => save(),

  // Alt/Option
  alt_n: () => newItem(),

  // 方向键
  arrowup: () => navigateUp(),
  arrowdown: () => navigateDown(),

  // 带条件
  meta_enter: {
    handler: () => submit(),
    whenever: [isFormValid]
  }
})
```

### 快捷键语法

| 键     | 含义                        |
| ------- | -------------------------- |
| `meta`  | Cmd（Mac）/ Ctrl（Windows） |
| `ctrl`  | Ctrl 键                   |
| `alt`   | Alt / Option 键           |
| `shift` | Shift 键                  |
| `_`     | 键分隔符                  |

### 提取快捷键（用于显示）

```ts
const shortcuts = extractShortcuts({
  meta_k: () => {},
  escape: () => {}
})
// 返回：{ meta_k: { key: 'K', metaKey: true }, ... }
```

## useKbd

检测当前键盘状态。

```ts
const kbd = useKbd()

// 响应式状态
kbd.meta // 如果按下 Cmd/Ctrl 则为 true
kbd.ctrl // 如果按下 Ctrl 则为 true
kbd.shift // 如果按下 Shift 则为 true
kbd.alt // 如果按下 Alt/Option 则为 true
```

## useScrollspy

跟踪滚动位置以实现锚点导航。

```ts
const { activeId } = useScrollspy({
  ids: ['section-1', 'section-2', 'section-3'],
  offset: 100 // 距离顶部的像素数
})

// activeId.value = 'section-2'（当前可见）
```

### 配合目录使用

```vue
<script setup>
const sections = ['intro', 'features', 'pricing']
const { activeId } = useScrollspy({ ids: sections })
</script>

<template>
  <nav>
    <a
      v-for="id in sections"
      :href="`#${id}`"
      :class="{ 'font-bold': activeId === id }"
    >
      {{ id }}
    </a>
  </nav>
</template>
```

## useFileUpload

处理文件上传。

```ts
const { files, open, reset, remove } = useFileUpload({
  accept: 'image/*',
  multiple: true,
  maxFiles: 5,
  maxSize: 5 * 1024 * 1024 // 5MB
})

// 打开文件选择器
open()

// 已选文件
files.value // FileList

// 重置选择
reset()

// 移除特定文件
remove(index)
```

### 配合 UFileUpload 使用

```vue
<script setup>
const { files, open, reset } = useFileUpload()
</script>

<template>
  <UFileUpload v-model="files" accept="image/*" @change="handleFiles">
    <template #default="{ dragover }">
      <div :class="{ 'border-primary': dragover }">
        将文件拖至此处或 <UButton @click="open">浏览</UButton>
      </div>
    </template>
  </UFileUpload>
</template>
```

## defineLocale

定义/扩展 i18n 语言环境。

```ts
// locales/es.ts
export default defineLocale({
  name: 'Español',
  code: 'es',
  messages: {
    select: {
      placeholder: 'Seleccionar...',
      noResults: 'Sin resultados'
    },
    pagination: {
      previous: 'Anterior',
      next: 'Siguiente'
    }
  }
})
```

### 扩展现有语言环境

```ts
import en from '@nuxt/ui/locale/en'

export default extendLocale(en, {
  messages: {
    select: {
      placeholder: 'Choose an option...'
    }
  }
})
```

### 在应用中使用

```vue
<script setup>
import es from '~/locales/es'
</script>

<template>
  <UApp :locale="es">
    <NuxtPage />
  </UApp>
</template>
```

## useFormField

在自定义组件中访问表单字段上下文。

```ts
// 在自定义表单组件内
const { name, error, disabled } = useFormField()

// name: 来自 UFormField 的字段名称
// error: 验证错误信息
// disabled: 如果字段被禁用则为 true
```

### 自定义输入组件

```vue
<script setup>
const props = defineProps<{ modelValue: string }>()
const emit = defineEmits(['update:modelValue'])

const { error } = useFormField()
</script>

<template>
  <input
    :value="modelValue"
    :class="{ 'border-error': error }"
    @input="emit('update:modelValue', $event.target.value)"
  />
  <span v-if="error" class="text-error">{{ error }}</span>
</template>
```

## 快速参考

| 组合式函数         | 目的                            |
| ------------------ | ------------------------------- |
| `useToast`         | 显示通知                        |
| `useOverlay`       | 程序化模态框/滑动面板           |
| `defineShortcuts`  | 键盘快捷键                      |
| `useKbd`           | 键盘状态检测                    |
| `useScrollspy`     | 跟踪滚动以实现目录导航          |
| `useFileUpload`    | 文件上传处理                    |
| `defineLocale`     | i18n 语言环境定义               |
| `extendLocale`     | 扩展现有语言环境                |
| `useFormField`     | 表单字段上下文                  |
| `extractShortcuts` | 解析快捷键定义                  |
