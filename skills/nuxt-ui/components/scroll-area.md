# ScrollArea

创建可滚动容器，支持为大型列表启用虚拟化。

> 基于 [Reka UI ScrollArea](https://reka-ui.com/docs/components/scroll-area)

## 主要属性

- `orientation`：控制滚动方向（`'vertical'` 或 `'horizontal'`）。
- `items`：要在可滚动区域内渲染的数据数组。
- `virtualize`：启用大型数据集的性能优化（仅渲染可见项）。支持 `estimateSize`、`lanes` 和 `gap`。
- `as`：指定底层 HTML 元素或组件（默认为 `'div'`）。
- `ui`：用于自定义根元素、视口和项样式的对象。

## 使用方法

```vue
<UScrollArea
  <!-- 属性在此处 -->
/>
```
