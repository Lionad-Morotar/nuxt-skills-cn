# 时间轴

一种组件，用于显示带有日期、标题、图标或头像的事件序列。

## 主要属性

- `items`：作为包含以下属性的对象数组：

  - `date?: string`{lang="ts-type"}
  - `title?: string`{lang="ts-type"}
  - `description?: AvatarProps`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `avatar?: AvatarProps`{lang="ts-type"}
  - `value?: string | number`{lang="ts-type"}
  - [`slot?: string`{lang="ts-type"}](#with-custom-slot)
  - `class?: any`{lang="ts-type"}
  - `ui?: { item?: ClassNameValue, container?: ClassNameValue, indicator?: ClassNameValue, separator?: ClassNameValue, wrapper?: ClassNameValue, date?: ClassNameValue, title?: ClassNameValue, description?: ClassNameValue }`{lang="ts-type"}

## ::component-code

忽略：

- items
- class
- defaultValue

外部：

- items

外部类型：

- TimelineItem[]

属性：

默认值：2

items: - date: 'Mar 15, 2025'
  title: '项目启动'
  description: '与团队达成一致后正式启动项目。'

- `color`：用于更改时间轴中活动项目的颜色。
- `size`：用于更改时间轴的大小。
- `orientation`：用于更改时间轴的方向。
- `ui`：用于创建交替布局的时间轴。
- `slot`：

## 使用方法

```vue
<UTimeline
  <!-- 在此处添加属性 -->
/>
```
