# InputMenu

一个支持实时建议的自动补全输入框。

> 基于 [Reka UI InputMenu](https://reka-ui.com/docs/components/combobox)

## 主要属性

- `items`：作为字符串、数字或布尔值的数组：

## ::component-code

prettier: true
ignore:

- modelValue
- items
  external:
- items
- modelValue
  props:
  modelValue: 'Backlog'
  items: - Backlog - Todo - In Progress - Done

---

::

你也可以传递一个对象数组，包含以下属性：

- `label?: string`{lang="ts-type"}
- [`type?: "label" | "separator" | "item"`{lang="ts-type"}](#with-items-type)
- [`icon?: string`{lang="ts-type"}](#with-icons-in-items)
- [`avatar?: AvatarProps`{lang="ts-type"}](#with-avatar-in-items)
- [`chip?: ChipProps`{lang="ts-type"}](#with-chip-in-items)
- `disabled?: boolean`{lang="ts-type"}
- `onSelect?: (e: Event) => void`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { tagsItem?: ClassNameValue, tagsItemText?: ClassNameValue, tagsItemDelete?: ClassNameValue, tagsItemDeleteIcon?: ClassNameValue, label?: ClassNameValue, separator?: ClassNameValue, item?: ClassNameValue, itemLeadingIcon?: ClassNameValue, itemLeadingAvatarSize?: ClassNameValue, itemLeadingAvatar?: ClassNameValue, itemLeadingChip?: ClassNameValue, itemLeadingChipSize?: ClassNameValue, itemLabel?: ClassNameValue, itemTrailing?: ClassNameValue, itemTrailingIcon?: ClassNameValue }`{lang="ts-type"}

## ::component-code

ignore:

- modelValue.
- `multiple`：允许多选，所选项将以标签形式显示。
- `placeholder`：设置占位文本。
- `content`：控制 InputMenu 内容的渲染方式，例如其 `align` 或 `side`。
- `arrow`：在 InputMenu 上显示箭头。
- `color`：当 InputMenu 获得焦点时更改边框颜色。
- `variant`：更改 InputMenu 的变体样式。
- `size`：更改 InputMenu 的尺寸大小。
- `icon`：在 InputMenu 中显示 [Icon](/docs/components/icon)。
- `avatar`：在 InputMenu 中显示 [Avatar](/docs/components/avatar)。

## 使用方法

```vue
<UInputMenu
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#leading`
