# 表格

一种响应式表格元素，用于以行和列的形式显示数据。

## 主要属性

- `data`：作为对象数组，列将根据对象的键自动生成。
- `columns`：作为 [ColumnDef](https://tanstack. 的数组。
- `meta`：作为对象（[TableMeta](https://tanstack.）
- `loading`：用于显示加载状态，使用 `loading-color` 属性更改颜色，使用 `loading-animation` 属性更改动画。
- `sticky`：用于使表头或表尾固定。
- `virtualize`：用于为大型数据集启用虚拟化，可作为布尔值或包含选项的对象（如 `{ estimateSize: 65, overscan: 12 }`）。

## 使用方法

```vue
<UTable
  <!-- 属性在此处 -->
/>
```
