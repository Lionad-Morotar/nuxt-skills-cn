# 面包屑

网站中用于导航的层级链接结构。

## 关键属性

- `items`：作为对象数组，包含以下属性：

  - `label?: string`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `avatar?: AvatarProps`{lang="ts-type"}
  - [`slot?: string`{lang="ts-type"}](#with-custom-slot)
  - `class?: any`{lang="ts-type"}
  - `ui?: { item?: ClassNameValue, link?: ClassNameValue, linkLeadingIcon?: ClassNameValue, linkLeadingAvatar?: ClassNameValue, linkLabel?: ClassNameValue, separator?: ClassNameValue, separatorIcon?: ClassNameValue }`{lang="ts-type"}

  可传递 [Link](/docs/components/link#props) 组件中的任意属性，例如 `to`、`target` 等。

  - `slot`：

## 用法

```vue
<UBreadcrumb
  <!-- 在此处传入属性 -->
/>
```

## 插槽

- `#item`
