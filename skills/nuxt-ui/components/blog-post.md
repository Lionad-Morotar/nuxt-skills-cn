# BlogPost

一个可自定义的文章组件，用于在博客页面中显示。

## 主要属性

- `title`：用于显示 BlogPost 的标题。
- `description`：用于显示 BlogPost 的描述。
- `date`：用于显示 BlogPost 的日期。
- `badge`：用于在 BlogPost 中显示一个 [Badge](/docs/components/badge)。
- `image`：用于在 BlogPost 中显示图片。
- `authors`：用于以对象数组的形式显示 [User](/docs/components/user) 列表，对象具有以下属性：

  - `name?: string`{lang="ts-type"}
  - `description?: string`{lang="ts-type"}
  - `avatar?: Omit<AvatarProps, 'size'>`{lang="ts-type"}
  - `chip?: boolean | Omit<ChipProps, 'size' | 'inset'>`{lang="ts-type"}
  - `size?: UserProps['size']`{lang="ts-type"}
  - `orientation?: UserProps['orientation']`{lang="ts-type"}

你可以传递 [Link](/docs/components/link#props) 组件的任意属性，例如 `to`、`target` 等。

- `variant`：用于更改 BlogPost 的样式。
- `orientation`：用于更改 BlogPost 的显示方向。

## 使用方法

```vue
<UBlogPost
  <!-- 在此处传入属性 -->
/>
```
