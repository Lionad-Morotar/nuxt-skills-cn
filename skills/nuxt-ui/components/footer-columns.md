# 页脚列

页脚中显示的链接列表，以列为形式呈现。

## 主要属性

- `columns`: 由对象组成的数组，具有以下属性：

- `label: string`{lang="ts-type"}
- `children?: FooterColumnLink[]`{lang="ts-type"}

每个列包含一个 `children` 数组，其中的对象定义了链接。

## 用法

```vue
<UFooterColumns
  <!-- 在此处传入属性 -->
/>
```
