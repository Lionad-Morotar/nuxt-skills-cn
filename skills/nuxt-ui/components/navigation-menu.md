# NavigationMenu

一个可水平或垂直显示的链接列表。

> 基于 [Reka UI NavigationMenu](https://reka-ui.com/docs/components/navigation-menu)

## 主要属性

- `items`: 一个对象数组，具有以下属性：

- `label?: string`{lang="ts-type"}
- `icon?: string`{lang="ts-type"}
- `avatar?: AvatarProps`{lang="ts-type"}
- `badge?: string | number | BadgeProps`{lang="ts-type"}
- `tooltip?: TooltipProps`{lang="ts-type"}
- `trailingIcon?: string`{lang="ts-type"}
- `type?: 'label' | 'trigger' | 'link'`{lang="ts-type"}
- `defaultOpen?: boolean`{lang="ts-type"}
- `open?: boolean`{lang="ts-type"}
- `value?: string`{lang="ts-type"}
- `disabled?: boolean`{lang="ts-type"}
- [`slot?: string`{lang="ts-type"}](#with-custom-slot)
- `onSelect?: (e: Event) => void`{lang="ts-type"}
- `children?: NavigationMenuChildItem[]`{lang="ts-type"}
- `class?: any`{lang="ts-type"}
- `ui?: { linkLeadingAvatarSize?: ClassNameValue, linkLeadingAvatar?: ClassNameValue, linkLeadingIcon?: ClassNameValue, linkLabel?: ClassNameValue, linkLabelExternalIcon?: ClassNameValue, linkTrailing?: ClassNameValue, linkTrailingBadgeSize?: ClassNameValue, linkTrailingBadge?: ClassNameValue, linkTrailingIcon?: ClassNameValue, label?: ClassNameValue, link?: ClassNameValue, content?: ClassNameValue, childList?: ClassNameValue, childLabel?: ClassNameValue, childItem?: ClassNameValue, childLink?: ClassNameValue, childLinkIcon?: ClassNameValue, childLinkWrapper?: ClassNameValue, childLinkLabel?: ClassNameValue, childLinkLabelExternalIcon?: ClassNameValue, childLinkDescription?: ClassNameValue }`{lang="ts-type"}

你可以传递 [Link](/docs/components/link#props) 组件的任意属性，例如 `to`、`target` 等。

- `orientation`: 用于更改 NavigationMenu 的方向。
- `highlight`: 用于为活动项显示高亮边框。
- `color`: 用于更改 NavigationMenu 的颜色。
- `variant`: 用于更改 NavigationMenu 的变体。
- `arrow`: 当项目具有子项时，用于在 NavigationMenu 内容中显示箭头。
- `slot`:

## 使用方法

```vue
<UNavigationMenu
  <!-- 在此处传入属性 -->
/>
```

## 插槽

- `#content`
- `#item`
