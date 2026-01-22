# 选择

一个用于从选项列表中进行选择的元素。

> 基于 [Reka UI Select](https://reka-ui.com/docs/components/select)

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

你也可以传入一个对象数组，具有以下属性：

- `label?: string`{lang="ts-type"}
- [`value?: string`{lang="ts-type"}](#value-key)
- [`type?: "label" | "separator" | "item"`{lang="ts-type"}](#with-items-type)
- [`icon?: string`{lang="ts-type"}](#with-icons-in-items)
- [`avatar?: AvatarProps`{lang="ts-type"}](#with-avatar-in-items)
- [`chip?: ChipProps`{lang="ts-type"}](#with-chip-in-items)
- `disabled?: boolean`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { label?: ClassNameValue, separator?: ClassNameValue, item?: ClassNameValue, itemLeadingIcon?: ClassNameValue, itemLeadingAvatarSize?: ClassNameValue, itemLeadingAvatar?: ClassNameValue, itemLeadingChipSize?: ClassNameValue, itemLeadingChip?: ClassNameValue, itemLabel?: ClassNameValue, itemTrailing?: ClassNameValue, itemTrailingIcon?: ClassNameValue }`{lang="ts-type"}

## ::component-code

ignore:

- modelValue
- items
- class
  external:
- items
- modelValue
  externalTypes:
- SelectItem[]
  props:
  modelValue: 'backlog'
  items: - label: 'Backlog'
  value: 'backlog' - label: 'Todo'
  value: 'todo' - label: 'In Progress'
  value: 'in_progress' - label: 'Done'
  value: 'done'
  class: 'w-48'

---

::

::caution
使用对象时，你需要在 `v-model` 指令或 `default-value` 属性中引用对象的 `value` 属性。

- `multiple`：允许进行多项选择，选中的项将在触发器中以逗号分隔。
- `placeholder`：设置占位符文本。
- `content`：控制选择器内容的渲染方式，例如其 `align` 或 `side` 等。
- `arrow`：在选择器上显示箭头。
- `color`：更改选择器获得焦点时的环形颜色。
- `variant`：更改选择器的变体。
- `size`：更改选择器的尺寸。
- `icon`：在选择器中显示 [Icon](/docs/components/icon)。
- `avatar`：在选择器中显示 [Avatar](/docs/components/avatar)。

## 使用方法

```vue
<USelect
  <!-- 这里填写属性 -->
/>
```

## 插槽

- `#leading`
