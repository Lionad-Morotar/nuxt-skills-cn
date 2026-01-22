# 步骤条

一组用于指示多步骤流程进度的步骤。

> 基于 [Reka UI 步骤条](https://reka-ui.com/docs/components/stepper)

## 主要属性

- `items`：作为包含以下属性的对象数组：

  - `title?: string`{lang="ts-type"}
  - `description?: AvatarProps`{lang="ts-type"}
  - `content?: string`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `value?: string | number`{lang="ts-type"}
  - `disabled?: boolean`{lang="ts-type"}
  - [`slot?: string`{lang="ts-type"}](#with-custom-slot)
  - `class?: any`{lang="ts-type"}
  - `ui?: { item?: ClassNameValue, container?: ClassNameValue, trigger?: ClassNameValue, indicator?: ClassNameValue, icon?: ClassNameValue, separator?: ClassNameValue, wrapper?: ClassNameValue, title?: ClassNameValue, description?: ClassNameValue }`{lang="ts-type"}

## ::component-code

ignore:

- items
- class
  external:
- items
  externalTypes:
- StepperItem[]
  props:
  items: - title: '地址'
  description: '在此添加您的地址'
  icon: 'i-lucide-house' - title: '配送'
  description: '设置您偏好的配送方式'
  icon: 'i-lucide-truck' - title: '结账'
  description: '确认您的订单'
  class: 'w-full'

---

::

::note
点击项目以在步骤间导航。

- `color`：更改步骤条的颜色。
- `size`：更改步骤条的尺寸。
- `orientation`：更改步骤条的方向。
- `disabled`：禁用步骤间的导航。
- `slot`:

## 用法

```vue
<UStepper
  <!-- 这里放置属性 -->
/>
```

## 插槽

- `#content`
