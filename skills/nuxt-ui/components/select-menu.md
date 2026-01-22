# SelectMenu

一个高级的可搜索选择元素。

> 基于 [Reka UI SelectMenu](https://reka-ui.com/docs/components/combobox)

## 主要属性

- `items`：作为字符串、数字或布尔值的数组：

## ::component-code

prettier: true
ignore:

- modelValue
- items
- class
  external:
- items
- modelValue
  props:
  modelValue: 'Backlog'
  items: - Backlog - Todo - In Progress - Done
  class: 'w-48'

---

::

你也可以传入一个对象数组，包含以下属性：

- `label?: string`{lang="ts-type"}
- [`type?: "label" | "separator" | "item"`{lang="ts-type"}](#with-items-type)
- [`icon?: string`{lang="ts-type"}](#with-icons-in-items)
- [`avatar?: AvatarProps`{lang="ts-type"}](#with-avatar-in-items)
- [`chip?: ChipProps`{lang="ts-type"}](#with-chip-in-items)
- `disabled?: boolean`{lang="ts-type"}
- `onSelect?: (e: Event) => void`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { label?: ClassNameValue, separator?: ClassNameValue, item?: ClassNameValue, itemLeadingIcon?: ClassNameValue, itemLeadingAvatarSize?: ClassNameValue, itemLeadingAvatar?: ClassNameValue, itemLeadingChipSize?: ClassNameValue, itemLeadingChip?: ClassNameValue, itemLabel?: ClassNameValue, itemTrailing?: ClassNameValue, itemTrailingIcon?: ClassNameValue }`{lang="ts-type"}

## ::component-code

ignore:

- modelValue.
- `multiple`：用于允许多选，选中的项目将在触发器中以逗号分隔。
- `placeholder`：用于设置占位文本。
- `content`：用于控制 SelectMenu 内容的渲染方式，例如其 `align` 或 `side`。
- `arrow`：用于在 SelectMenu 上显示箭头。
- `color`：用于更改 SelectMenu 获得焦点时的边框颜色。
- `variant`：用于更改 SelectMenu 的变体。
- `size`：用于更改 SelectMenu 的尺寸。
- `icon`：用于在 SelectMenu 中显示 [Icon](/docs/components/icon)。
- `avatar`：用于在 SelectMenu 中显示 [Avatar](/docs/component/avatar)。

## 用法

```vue
<USelectMenu
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#leading`
