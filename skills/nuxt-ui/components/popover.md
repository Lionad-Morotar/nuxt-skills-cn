# 气泡框

一种浮动在触发元素周围的非模态对话框。

> 基于 [Reka UI 气泡框](https://reka-ui.com/docs/components/hover-card)

## 主要属性

- `mode`：用于更改气泡框的模式。
- `content`：用于控制气泡框内容的渲染方式，例如其 `align` 或 `side`。
- `arrow`：用于在气泡框上显示箭头。
- `modal`：用于控制气泡框是否阻止与外部内容的交互。
- `dismissible`：用于控制点击气泡框外部或按下 Escape 键时是否关闭气泡框。

## 用法

```vue
<UPopover
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#content`
