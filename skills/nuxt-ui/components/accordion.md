# 手风琴组件

一组堆叠的可折叠面板。

> 基于 [Reka UI 手风琴](https://reka-ui.com/docs/components/accordion)

## 关键属性

- `items`：由以下属性组成的对象数组：

- `label?: string`{lang="ts-type"}
- `icon?: string`{lang="ts-type"}
- `trailingIcon?: string`{lang="ts-type"}
- `content?: string`{lang="ts-type"}
- `value?: string`{lang="ts-type"}
- `disabled?: boolean`{lang="ts-type"}
- [`slot?: string`{lang="ts-type"}](#with-custom-slot)
- `class?: any`{lang="ts-type"}
- `ui?: { item?: ClassNameValue, header?: ClassNameValue, trigger?: ClassNameValue, leadingIcon?: ClassNameValue, label?: ClassNameValue, trailingIcon?: ClassNameValue, content?: ClassNameValue, body?: ClassNameValue }`{lang="ts-type"}

## ::component-code

忽略：

- items
  external:
- items
  externalTypes:
- AccordionItem[]
  hide:
- class
  props:
  class: 'px-4'
  items: - label: '图标'
  icon: 'i-lucide-smile'
  content: '您无需执行任何操作，@nuxt/icon 将自动处理。
- `disabled`:
- `slot`:

## 用法

```vue
<UAccordion
  <!-- 在此处添加属性 -->
/>
```

## 插槽

- `#body`
- `#content`
