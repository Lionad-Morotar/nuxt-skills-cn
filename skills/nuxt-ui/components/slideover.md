# Slideover

从屏幕任意一侧滑入的对话框。

> 基于 [Reka UI Slideover](https://reka-ui.com/docs/components/dialog)

## 关键属性

- `title`：用于设置 Slideover 标题栏的标题。
- `description`：用于设置 Slideover 标题栏的描述。
- `close`：用于自定义或隐藏显示在 Slideover 标题栏中的关闭按钮（使用 `false` 值可隐藏）。
- `side`：用于设置 Slideover 从屏幕的哪一侧滑入。
- `transition`：用于控制 Slideover 是否具有动画效果。
- `overlay`：用于控制 Slideover 是否具有遮罩层。
- `modal`：用于控制 Slideover 是否阻止与外部内容的交互。
- `dismissible`：用于控制点击 Slideover 外部或按下 Esc 键时是否可关闭。

## 使用方法

```vue
<USlideover
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#content`
- `#header`
- `#body`
- `#footer`
