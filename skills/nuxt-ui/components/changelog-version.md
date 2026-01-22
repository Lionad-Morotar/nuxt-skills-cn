# 更新日志版本

一个可定制的文章组件，用于在更新日志中显示。

## 主要属性

- `title`：用于显示更新日志版本的标题。
- `description`：用于显示更新日志版本的描述。
- `date`：用于显示更新日志版本的日期。
- `badge`：用于在更新日志版本上显示一个[徽章](/docs/components/badge)。
- `image`：用于在博客文章中显示图片。
- `authors`：用于在更新日志版本中以对象数组的形式显示[用户](/docs/components/user)列表，对象具有以下属性：

- `name?: string`{lang="ts-type"}
- `description?: string`{lang="ts-type"}
- `avatar?: Omit<AvatarProps, 'size'>`{lang="ts-type"}
- `chip?: boolean | Omit<ChipProps, 'size' | 'inset'>`{lang="ts-type"}
- `size?: UserProps['size']`{lang="ts-type"}
- `orientation?: UserProps['orientation']`{lang="ts-type"}

你可以传递来自[链接](/docs/components/link#props)组件的任意属性，例如 `to`、`target` 等。

- `indicator`：用于隐藏左侧的指示点。


## 使用方法

```vue
<UChangelogVersion
  <!-- 在此处传入属性 -->
/>
```
