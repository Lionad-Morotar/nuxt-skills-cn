# 组件

> 自动生成。运行 `npx tsx skills/reka-ui/scripts/generate-components.ts` 以更新。

## 表单

| 组件           | 描述                                       | 文件                          |
| -------------- | ------------------------------------------ | ----------------------------- |
| **checkbox**   | 具有不确定状态的选择控件                   | `components/checkbox.md`      |
| **combobox**   | 可搜索的下拉框，支持过滤                   | `components/combobox.md`      |
| **editable**   | 内联文本编辑，支持预览/编辑模式            | `components/editable.md`      |
| **label**      | 可访问的表单标签                           | `components/label.md`         |
| **listbox**    | 可访问的列表选择                           | `components/listbox.md`       |
| **numberField**| 数值输入框，支持递增/递减                  | `components/number-field.md`  |
| **pinInput**   | 多字符代码输入（OTP）                      | `components/pin-input.md`     |
| **radioGroup** | 互斥选择                                   | `components/radio-group.md`   |
| **select**     | 分组下拉选择                               | `components/select.md`        |
| **slider**     | 范围输入控件                               | `components/slider.md`        |
| **switch**     | 在两种状态之间切换                         | `components/switch.md`        |
| **tagsInput**  | 多标签输入与管理                           | `components/tags-input.md`    |
| **toggle**     | 单状态按钮切换                             | `components/toggle.md`        |
| **toggleGroup**| 具有组行为的多个切换项                     | `components/toggle-group.md`  |

## 日期

| 组件                | 描述                           | 文件                            |
| ------------------- | ------------------------------ | ------------------------------- |
| **calendar**        | 日期选择网格（alpha）          | `components/calendar.md`        |
| **dateField**       | 日期输入字段（alpha）          | `components/date-field.md`      |
| **datePicker**      | 带日历的日期选择器（alpha）    | `components/date-picker.md`     |
| **dateRangeField**  | 日期范围输入（alpha）          | `components/date-range-field.md`|
| **dateRangePicker** | 日期范围选择器（alpha）        | `components/date-range-picker.md`|
| **rangeCalendar**   | 日期范围日历（alpha）          | `components/range-calendar.md`  |
| **timeField**       | 时间输入字段（alpha）          | `components/time-field.md`      |

## 折叠

| 组件           | 描述                       | 文件                         |
| -------------- | -------------------------- | ---------------------------- |
| **accordion**  | 可折叠的内容部分           | `components/accordion.md`    |
| **collapsible**| 单个可折叠面板             | `components/collapsible.md`  |

## 覆盖层

| 组件             | 描述                         | 文件                           |
| ---------------- | ---------------------------- | ------------------------------ |
| **alertDialog**  | 需要操作的模态对话框         | `components/alert-dialog.md`   |
| **dialog**       | 模态对话框                   | `components/dialog.md`         |
| **hoverCard**    | 悬停显示的卡片               | `components/hover-card.md`     |
| **popover**      | 浮动内容面板                 | `components/popover.md`        |
| **tooltip**      | 信息提示悬停工具             | `components/tooltip.md`        |
| **toast**        | 临时通知                     | `components/toast.md`          |

## 菜单

| 组件               | 描述                           | 文件                              |
| ------------------ | ------------------------------ | --------------------------------- |
| **contextMenu**    | 右键上下文菜单                 | `components/context-menu.md`      |
| **dropdownMenu**   | 下拉操作菜单                   | `components/dropdown-menu.md`     |
| **menubar**        | 水平菜单栏                     | `components/menubar.md`           |
| **navigationMenu** | 网站导航菜单                   | `components/navigation-menu.md`   |

## 数据

| 组件             | 描述                           | 文件                           |
| ---------------- | ------------------------------ | ------------------------------ |
| **avatar**       | 用户图像，支持降级显示         | `components/avatar.md`         |
| **pagination**   | 页面导航                       | `components/pagination.md`     |
| **progress**     | 进度指示器                     | `components/progress.md`       |
| **scrollArea**   | 自定义滚动条容器               | `components/scroll-area.md`    |
| **separator**    | 视觉分隔符                     | `components/separator.md`      |
| **splitter**     | 可调整大小的分割面板           | `components/splitter.md`       |
| **stepper**      | 多步骤进度指示器               | `components/stepper.md`        |
| **tabs**         | 标签内容面板                   | `components/tabs.md`           |
| **tree**         | 层次结构树形视图               | `components/tree.md`           |

## 布局

| 组件             | 描述                         | 文件                            |
| ---------------- | ---------------------------- | ------------------------------- |
| **aspectRatio**  | 维持宽高比                   | `components/aspect-ratio.md`    |
| **toolbar**      | 带按钮/切换项的工具栏        | `components/toolbar.md`         |

## 工具

| 组件                 | 描述                           | 文件                              |
| -------------------- | ------------------------------ | --------------------------------- |
| **configProvider**   | 全局配置上下文                 | `components/config-provider.md`   |
| **focusScope**       | 焦点陷阱容器                   | `components/focus-scope.md`       |
| **presence**         | 动画显示控制                   | `components/presence.md`          |
| **primitive**        | 基础元素包装器                 | `components/primitive.md`         |
| **visuallyHidden**   | 仅屏幕阅读器内容               | `components/visually-hidden.md`   |

## 组合式函数

| 组合式函数              | 描述                                                             |
| ----------------------- | ---------------------------------------------------------------- |
| `useEmitAsProps`        | 将 emit 函数转换为 props，用于传递给子组件                       |
| `useFilter`             | 根据搜索查询过滤项目，支持自定义匹配逻辑                         |
| `useForwardProps`       | 将 props 转发给子组件，同时过滤已处理的项                        |
| `useForwardPropsEmits`  | 结合 useForwardProps 和 useEmitAsProps                           |
| `useForwardExpose`      | 将子组件暴露的方法/引用转发                                      |
| `useId`                 | 生成唯一 ID 用于无障碍属性                                       |
| `useDateFormatter`      | 支持本地化的日期格式化                                           |
| `useDirection`          | 获取/设置文本方向（ltr/rtl）                                     |
| `useLocale`             | 获取/设置国际化区域设置                                          |
