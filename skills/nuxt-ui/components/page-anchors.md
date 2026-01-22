# PageAnchors

页面中显示的锚点列表。

## 关键属性

- `links`: 一个对象数组，包含以下属性：

- `label: string`{lang="ts-type"}
- `icon?: string`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { item?: ClassNameValue, link?: ClassNameValue, linkLabel?: ClassNameValue, linkLabelExternalIcon?: ClassNameValue, linkLeading?: ClassNameValue, linkLeadingIcon?: ClassNameValue }`{lang="ts-type"}

您可以传递 [Link](/docs/components/link#props) 组件中的任意属性，例如 `to`、`target` 等。

## 用法

```vue
<UPageAnchors
  <!-- 在此处传入属性 -->
/>
```
