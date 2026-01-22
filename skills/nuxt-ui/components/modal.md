# 模态框

一种对话窗口，可用于显示消息或请求用户输入。

> 基于 [Reka UI 模态框](https://reka-ui.com/docs/components/dialog)

## 主要属性

- `title`：用于设置模态框标题栏的标题。
- `description`：用于设置模态框标题栏的描述。
- `close`：用于自定义或隐藏显示在模态框标题栏中的关闭按钮（设置为 `false` 时隐藏）。
- `transition`：用于控制模态框是否具有动画效果。
- `overlay`：用于控制模态框是否具有遮罩层。
- `modal`：用于控制模态框是否阻止外部内容的交互。
- `dismissible`：用于控制点击模态框外部或按下 Esc 键时是否关闭模态框。
- `scrollable`：用于使模态框内容在遮罩层内可滚动。
- `fullscreen`：用于将模态框设置为全屏显示。

## 用法

```vue
<UModal
  <!-- 属性在此处 -->
/>
```

## 插槽

- `#content`
- `#header`
- `#body`
- `#footer`
