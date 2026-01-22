# RadioGroup

一组单选按钮，用于从列表中选择一个选项。

> 基于 [Reka UI RadioGroup](https://reka-ui.com/docs/components/radio-group)

## 主要属性

- `items`：字符串或数字数组：

## ::component-code

prettier: true
ignore:

- modelValue
- items
  external:
- items
- modelValue
  props:
  modelValue: 'System'
  items: - 'System' - 'Light' - 'Dark'

---

您也可以传递一个对象数组，包含以下属性：

- `label?: string`{lang="ts-type"}
- `description?: string`{lang="ts-type"}
- [`value?: string`{lang="ts-type"}](#value-key)
- `disabled?: boolean`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { item?: ClassNameValue, container?: ClassNameValue, base?: ClassNameValue, 'indicator'?: ClassNameValue, wrapper?: ClassNameValue, label?: ClassNameValue, description?: ClassNameValue }`{lang="ts-type"}

## ::component-code

ignore:

- modelValue
- items
  external:
- items
- modelValue
  externalTypes:
- RadioGroupItem[]
  props:
  modelValue: 'system'
  items: - label: 'System'
  description: '这是第一个选项。
- `legend`：设置 RadioGroup 的标题。
- `color`：更改 RadioGroup 的颜色。
- `variant`：更改 RadioGroup 的变体。
- `size`：更改 RadioGroup 的尺寸。
- `orientation`：更改 RadioGroup 的方向。
- `indicator`：更改指示器的位置或隐藏它。
- `disabled`：禁用 RadioGroup。

## 使用方法

```vue
<URadioGroup
  <!-- 在此处添加属性 -->
/>
```
