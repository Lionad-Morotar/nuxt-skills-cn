# 定价计划

一个可定制的定价计划，用于价格页面展示。

## 主要属性

- `title`：用于设置定价计划的标题。
- `description`：用于设置定价计划的描述。
- `badge`：在定价计划标题旁显示一个 [Badge](/docs/components/badge)。
- `price`：用于设置定价计划的价格。
- `discount`：用于设置折扣价，该价格将与原价一同显示（原价将以删除线形式呈现）。
- `features`：作为字符串数组，用于在定价计划中显示功能列表：

## ::component-code

prettier: true
hide:

- class
  ignore:
- title
- description
- price
- features
  props:
  title: 'Solo'
  description: '适用于独立开发者和极客。
- `button`：包含 [Button](/docs/components/button) 组件的任意属性，用于在定价计划底部显示按钮。
- `variant`：用于更改定价计划的变体。
- `orientation`：用于更改定价计划的方向。
- `tagline`：用于在价格上方显示标语文本。

## 使用方法

```vue
<UPricingPlan
  <!-- 在此处传入属性 -->
/>
```
