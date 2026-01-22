# 覆盖层

**先决条件**：所有覆盖层都需要在应用根目录中使用 `<UApp>` 包装器。

## Toast（通知）

### 基本用法

```vue
<script setup>
const toast = useToast()

function showToast() {
  toast.add({
    title: '成功！',
    description: '您的更改已保存。',
    color: 'success',
    icon: 'i-heroicons-check-circle'
  })
}
</script>

<template>
  <UButton @click="showToast">显示 Toast</UButton>
</template>
```

### Toast 选项

```ts
toast.add({
  id: 'unique-id', // 自定义 ID（省略时自动生成）
  title: '标题', // Toast 标题
  description: '详情', // Toast 内容
  color: 'success', // primary, success, error, warning, info
  icon: 'i-heroicons-check', // 左侧图标
  avatar: { src: '...' }, // 使用头像代替图标
  timeout: 5000, // 自动关闭（0 = 不关闭）
  actions: [{ // 操作按钮
    label: '撤销',
    click: () => {}
  }],
  callback: () => {} // 在关闭时调用
})
```

### Toast 类型

```ts
// 成功
toast.add({ title: '已保存', color: 'success', icon: 'i-heroicons-check-circle' })

// 错误
toast.add({ title: '错误', color: 'error', icon: 'i-heroicons-x-circle' })

// 警告
toast.add({ title: '警告', color: 'warning', icon: 'i-heroicons-exclamation-triangle' })

// 信息
toast.add({ title: '信息', color: 'info', icon: 'i-heroicons-information-circle' })

// 移除 toast
toast.remove('toast-id')

// 清空所有
toast.clear()
```

## 模态框

### 基本模态框

```vue
<script setup>
const isOpen = ref(false)
</script>

<template>
  <UButton @click="isOpen = true">打开模态框</UButton>

  <UModal v-model:open="isOpen">
    <template #header>
      <h3>模态框标题</h3>
    </template>

    <p>模态框内容...</p>

    <template #footer>
      <UButton variant="ghost" @click="isOpen = false">取消</UButton>
      <UButton @click="save">保存</UButton>
    </template>
  </UModal>
</template>
```

### 模态框属性

```vue
<UModal
  v-model:open="isOpen"
  title="模态框标题"          <!-- 替代 #header 插槽 -->
  description="副标题"       <!-- 标题下方 -->
  :close="true"                <!-- 显示关闭按钮 -->
  :close-icon="'i-heroicons-x-mark'"
  :overlay="true"              <!-- 显示背景 -->
  :transition="true"           <!-- 启用动画 -->
  :prevent-close="false"       <!-- 阻止点击背景关闭 -->
  fullscreen                   <!-- 全屏模式 -->
>
```

### 编程式模态框（useOverlay）

```vue
<script setup>
const overlay = useOverlay()

async function openConfirm() {
  const modal = overlay.create(ConfirmModal, {
    props: { title: '确认操作？' },
    events: {
      confirm: () => modal.close(true),
      cancel: () => modal.close(false)
    }
  })

  const result = await modal.result
  if (result) {
    // 用户确认
  }
}
</script>
```

## 滑动面板

从屏幕边缘出现的侧边覆盖层。

```vue
<script setup>
const isOpen = ref(false)
</script>

<template>
  <UButton @click="isOpen = true">打开滑动面板</UButton>

  <USlideover v-model:open="isOpen" title="设置" side="right">
    <div class="p-4">
      设置内容...
    </div>
  </USlideover>
</template>
```

### 滑动面板属性

```vue
<USlideover
  v-model:open="isOpen"
  title="标题"
  description="副标题"
  side="right"              <!-- left, right, top, bottom -->
  :overlay="true"
  :transition="true"
  :prevent-close="false"
>
```

## 抽屉

底部抽屉覆盖层（vaul-vue）。

```vue
<script setup>
const isOpen = ref(false)
</script>

<template>
  <UButton @click="isOpen = true">打开抽屉</UButton>

  <UDrawer v-model:open="isOpen">
    <div class="p-4">
      抽屉内容...
    </div>
  </UDrawer>
</template>
```

### 抽屉属性

```vue
<UDrawer
  v-model:open="isOpen"
  title="抽屉标题"
  description="副标题"
  handle                     <!-- 显示拖拽手柄 -->
  :should-scale-background="true"
  :close-threshold="0.25"    <!-- 滑动关闭阈值 -->
>
```

## 浮动面板

```vue
<UPopover>
  <UButton>打开浮动面板</UButton>

  <template #content>
    <div class="p-4">
      浮动面板内容
    </div>
  </template>
</UPopover>
```

### 浮动面板属性

```vue
<UPopover
  :open="isOpen"
  side="bottom"              <!-- top, right, bottom, left -->
  align="center"             <!-- start, center, end -->
  :arrow="true"
  :delay="{ open: 0, close: 0 }"
>
```

## 工具提示

```vue
<UTooltip text="有用的提示">
  <UButton icon="i-heroicons-question-mark-circle" />
</UTooltip>

<!-- 带插槽内容 -->
<UTooltip>
  <UButton>悬停我</UButton>
  <template #content>
    <p>丰富的工具提示内容</p>
  </template>
</UTooltip>
```

## 下拉菜单

```vue
<script setup>
const items = [
  { label: '编辑', icon: 'i-heroicons-pencil', click: () => {} },
  { label: '复制', icon: 'i-heroicons-document-duplicate' },
  { type: 'separator' },
  { label: '删除', icon: 'i-heroicons-trash', color: 'error' }
]
</script>

<template>
  <UDropdownMenu :items="items">
    <UButton icon="i-heroicons-ellipsis-vertical" variant="ghost" />
  </UDropdownMenu>
</template>
```

### 嵌套项

```vue
<script setup>
const items = [
  { label: '新建', children: [
    { label: '文件', click: () => {} },
    { label: '文件夹', click: () => {} }
  ]},
  { label: '删除' }
]
</script>
```

## 上下文菜单

右键菜单。

```vue
<UContextMenu :items="items">
  <div class="h-40 border rounded flex items-center justify-center">
    在此处右键单击
  </div>
</UContextMenu>
```

## 命令面板

基于搜索的命令菜单（由 Fuse.js 提供支持）。

```vue
<script setup>
const isOpen = ref(false)

const groups = [{
  key: 'actions',
  label: '操作',
  items: [
    { label: '新建文件', icon: 'i-heroicons-document-plus', click: () => {} },
    { label: '新建文件夹', icon: 'i-heroicons-folder-plus', click: () => {} }
  ]
}, {
  key: 'navigation',
  label: '导航',
  items: [
    { label: '首页', to: '/' },
    { label: '设置', to: '/settings' }
  ]
}]
</script>

<template>
  <UCommandPalette v-model:open="isOpen" :groups="groups" placeholder="搜索..." />
</template>
```

### 键盘快捷键

```vue
<script setup>
defineShortcuts({
  meta_k: () => { isOpen.value = true }
})
</script>
```

## 最佳实践

| 应该使用                            | 不应使用                         |
| ----------------------------------- | -------------------------------- |
| 使用 useToast 显示通知              | 自建自定义 Toast 系统            |
| 使用 UModal 显示对话框              | 用警告弹窗处理复杂界面           |
| 使用 Slideover 显示面板             | 在侧边内容中使用模态框           |
| 使用 Drawer 适配移动端抽屉          | 在移动端使用滑动面板             |
| 使用 CommandPalette 实现搜索        | 自建自定义搜索界面               |
| 使用程序化覆盖层处理确认操作      | 创建确认组件                     |
