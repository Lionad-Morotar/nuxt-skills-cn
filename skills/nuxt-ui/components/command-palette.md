# 命令调色板

一个命令调色板，内置 Fuse.js 全文搜索功能，用于高效模糊匹配。

> 基于 [Reka UI CommandPalette](https://reka-ui.com/docs/components/listbox)

## 核心属性

- `groups`: 一个对象数组，包含以下属性：

- `id: string`{lang="ts-type"}
- `label?: string`{lang="ts-type"}
- `slot?: string`{lang="ts-type"}
- `items?: CommandPaletteItem[]`{lang="ts-type"}
- [`ignoreFilter?: boolean`{lang="ts-type"}](#with-ignore-filter)
- [`postFilter?: (searchTerm: string, items: T[]) => T[]`{lang="ts-type"}](#with-post-filtered-items)
- `highlightedIcon?: string`{lang="ts-type"}

::caution
你必须为每个组提供一个 `id`，否则该组将被忽略。

- `multiple`: 允许多选。
- `placeholder`: 更改占位符文本。
- `icon`: 自定义输入 [Icon](/docs/components/icon)。
- `loading`: 在命令调色板中显示加载图标。
- `close`: 显示一个 [Button](/docs/components/button) 来关闭命令调色板。
- `back`: 自定义或隐藏在进入子菜单时显示的返回按钮（使用 `false` 值）。
- `disabled`: 禁用命令调色板。
- `virtualize`: 启用虚拟化以处理大型列表，可传入布尔值或带有选项的对象，如 `{ estimateSize: 32, overscan: 12 }`。
- `slot`:

## 使用方式

```vue
<UCommandPalette
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#footer`
- `#item`
