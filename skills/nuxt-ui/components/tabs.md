# 标签页

一组标签面板，一次仅显示一个。

> 基于 [Reka UI Tabs](https://reka-ui.com/docs/components/tabs)

## 主要属性

- `items`：作为包含以下属性的对象数组：

  - `label?: string`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `avatar?: AvatarProps`{lang="ts-type"}
  - `badge?: string | number | BadgeProps`{lang="ts-type"}
  - `content?: string`{lang="ts-type"}
  - `value?: string | number`{lang="ts-type"}
  - `disabled?: boolean`{lang="ts-type"}
  - [`slot?: string`{lang="ts-type"}](#with-custom-slot)
  - `class?: any`{lang="ts-type"}
  - `ui?: { trigger?: ClassNameValue, leadingIcon?: ClassNameValue, leadingAvatar?: ClassNameValue, leadingAvatarSize?: ClassNameValue, label?: ClassNameValue, trailingBadge?: ClassNameValue, trailingBadgeSize?: ClassNameValue, content?: ClassNameValue }`{lang="ts-type"}

## ::component-code

忽略：

- items
- class

外部类型：

- items
  外部类型：
- TabsItem[]
  属性：
  items: - label: Account
  icon: 'i-lucide-user'
  content: '这是账户内容。
- `color`：用于更改标签页的颜色。
- `variant`：用于更改标签页的变体。
- `size`：用于更改标签页的尺寸。
- `orientation`：用于更改标签页的方向。
- `slot`：

## 用法

```vue
<UTabs
  <!-- 在此处添加属性 -->
/>
```

## 插槽

- `#content`
