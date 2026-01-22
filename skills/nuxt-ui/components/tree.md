# 树形组件

用于显示和交互分层数据结构的树形视图组件。

> 基于 [Reka UI Tree](https://reka-ui.com/docs/components/tree)

## 主要属性

- `items`：作为对象数组，每个对象具有以下属性：

- `icon?: string`{lang="ts-type"}
- `label?: string`{lang="ts-type"}
- `trailingIcon?: string`{lang="ts-type"}
- `defaultExpanded?: boolean`{lang="ts-type"}
- `disabled?: boolean`{lang="ts-type"}
- `slot?: string`{lang="ts-type"}
- `children?: TreeItem[]`{lang="ts-type"}
- `onToggle?: (e: TreeItemToggleEvent<TreeItem>) => void`{lang="ts-type"}
- `onSelect?: (e: TreeItemSelectEvent<TreeItem>) => void`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { item?: ClassNameValue, itemWithChildren?: ClassNameValue, link?: ClassNameValue, linkIcon?: ClassNameValue, linkLabel?: ClassNameValue, linkTrailing?: ClassNameValue, linkTrailingIcon?: ClassNameValue, listWithChildren?: ClassNameValue }`{lang="ts-type"}

::note
每个项目都需要一个唯一标识符。

- `multiple`：允许选择多个项目。
- `nested`：控制树形组件是以嵌套结构还是平面列表形式渲染。
- `color`：更改树形组件的颜色。
- `size`：更改树形组件的尺寸。
- `disabled`：禁止用户与树形组件进行任何交互。
- `virtualize`：为大型列表启用虚拟化，可传入布尔值或包含选项的对象（如 `{ estimateSize: 32, overscan: 12 }`）。
- `slot`:

## 使用方法

```vue
<UTree
  <!-- 在此处传入属性 -->
/>
```
