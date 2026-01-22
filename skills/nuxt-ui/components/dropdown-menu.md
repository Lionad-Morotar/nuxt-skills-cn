# 下拉菜单

点击元素时显示操作的菜单。

> 基于 [Reka UI 下拉菜单](https://reka-ui.com/docs/components/dropdown-menu)

## 主要属性

- `items`：作为对象数组，包含以下属性：

  - `label?: string`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `avatar?: AvatarProps`{lang="ts-type"}
  - `kbds?: string[] | KbdProps[]`{lang="ts-type"}
  - [`type?: "link" | "label" | "separator" | "checkbox"`{lang="ts-type"}](#with-checkbox-items)
  - [`color?: "error" | "primary" | "secondary" | "success" | "info" | "warning" | "neutral"`{lang="ts-type"}](#with-color-items)
  - [`checked?: boolean`{lang="ts-type"}](#with-checkbox-items)
  - `disabled?: boolean`{lang="ts-type"}
  - [`slot?: string`{lang="ts-type"}](#with-custom-slot)
  - `onSelect?: (e: Event) => void`{lang="ts-type"}
  - [`onUpdateChecked?: (checked: boolean) => void`{lang="ts-type"}](#with-checkbox-items)
  - `children?: DropdownMenuItem[] | DropdownMenuItem[][]`{lang="ts-type"}
  - `class?: any`{lang="ts-type"}
  - `ui?: { item?: ClassNameValue, label?: ClassNameValue, separator?: ClassNameValue, itemLeadingIcon?: ClassNameValue, itemLeadingAvatarSize?: ClassNameValue, itemLeadingAvatar?: ClassNameValue, itemLabel?: ClassNameValue, itemLabelExternalIcon?: ClassNameValue, itemTrailing?: ClassNameValue, itemTrailingIcon?: ClassNameValue, itemTrailingKbds?: ClassNameValue, itemTrailingKbdsSize?: ClassNameValue }`{lang="ts-type"}

  可传递 [Link](/docs/components/link#props) 组件的任意属性，如 `to`、`target` 等。

- `content`：用于控制下拉菜单内容的渲染方式，例如其 `align` 或 `side`。
- `arrow`：在下拉菜单上显示箭头。
- `size`：控制下拉菜单的大小。
- `modal`：控制下拉菜单是否阻止与外部内容的交互。
- `disabled`：禁用下拉菜单。
- `slot`：

## 使用方法

```vue
<UDropdownMenu
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#item`
