# 轮播图

一个使用 Embla 构建的带动画和滑动功能的轮播组件。

## 核心属性

- `items`：以数组形式传递，并使用默认插槽渲染每一项：

## ::component-example

name: 'carousel-items-example'
class: 'p-8'

---

您也可以传递一个对象数组，包含以下属性：

- `class?: any`{lang="ts-type"}
- `ui?: { item?: ClassNameValue }`{lang="ts-type"}

您可以通过 [`basis`](https://tailwindcss.

- `orientation`：用于更改进度条的方向。
- `arrows`：用于显示上一页和下一页按钮。
- `dots`：用于显示一系列圆点，以跳转到特定幻灯片。
- `autoplay`：作为布尔值或对象来配置 [Autoplay 插件](https://www.
- `fade`：作为布尔值或对象来配置 [Fade 插件](https://www.

## 使用方法

```vue
<UCarousel
  <!-- 在此处添加属性 -->
/>
```
