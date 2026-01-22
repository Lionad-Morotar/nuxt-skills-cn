# 页面板块

用于页面的响应式板块。

## 主要属性

- `title`：用于设置板块的标题。
- `description`：用于设置板块的描述。
- `headline`：用于设置板块的标题语。
- `icon`：用于设置板块的图标。
- `features`：在描述下方显示 [PageFeature](/docs/components/page-feature) 列表，格式为对象数组，包含以下属性：

  - `title?: string`{lang="ts-type"}
  - `description?: string`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `orientation?: 'horizontal' | 'vertical'`{lang="ts-type"}

你可以传递 [Link](/docs/components/link#props) 组件的任意属性，例如 `to`、`target` 等。

- `links`：在描述下方显示 [Button](/docs/components/button) 列表。
- `orientation`：用于更改默认插槽的方向。
- `reverse`：用于反转默认插槽的方向。

## 用法

```vue
<UPageSection
  <!-- 在此处传入属性 -->
/>
```
