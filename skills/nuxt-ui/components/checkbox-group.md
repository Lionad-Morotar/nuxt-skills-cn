# 复选框组

一组用于从列表中选择多个选项的复选框按钮。

> 基于 [Reka UI 复选框组](https://reka-ui.com/docs/components/checkbox#group-root)

## 主要属性

- `items`：作为字符串或数字数组：

## ::component-code

prettier: true
ignore:

- modelValue
- items
  external:
- items
- modelValue
  props:
  modelValue: - 'System'
  items: - 'System' - 'Light' - 'Dark'

---

您也可以传递一个对象数组，包含以下属性：

- `label?: string`{lang="ts-type"}
- `description?: string`{lang="ts-type"}
- [`value?: string`{lang="ts-type"}](#value-key)
- `disabled?: boolean`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { item?: ClassNameValue, container?: ClassNameValue, base?: ClassNameValue, 'indicator'?: ClassNameValue, icon?: ClassNameValue, wrapper?: ClassNameValue, label?: ClassNameValue, description?: ClassNameValue }`{lang="ts-type"}

## ::component-code

ignore:

- modelValue
- items
  external:
- items
- modelValue
  externalTypes:
- CheckboxGroupItem[]
  props:
  modelValue: - 'system'
  items: - label: 'System'
  description: '这是第一个选项。
- `legend`：设置复选框组的标题。
- `color`：更改复选框组的颜色。
- `variant`：更改复选框组的变体。
- `size`：更改复选框组的尺寸。
- `orientation`：更改复选框组的方向。
- `indicator`：更改指示器的位置或隐藏它。
- `disabled`：禁用复选框组。

## 使用方法

```vue
<UCheckboxGroup
  <!-- 这里传入属性 -->
/>
```
