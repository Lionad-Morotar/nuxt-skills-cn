# 可折叠面板

单一可折叠面板

**组件：** `CollapsibleRoot`、`CollapsibleTrigger`、`CollapsibleContent`

## CollapsibleRoot

### 属性

| 属性          | 类型                 | 默认值   |
| ------------- | -------------------- | -------- |
| `as`          | `AsTag \| Component` | `"div"`  |
| `asChild`     | `boolean`            | -        |
| `defaultOpen` | `boolean`            | `false`  |
| `disabled`    | `boolean`            | -        |
| `open`        | `boolean`            | -        |

### 事件

| 事件          | 参数               |
| ------------- | ------------------ |
| `update:open` | `[value: boolean]` |

### 插槽

| 插槽   | 类型      |
| ------ | --------- |
| `open` | `boolean` |

## CollapsibleTrigger

### 属性

| 属性      | 类型                 | 默认值     |
| --------- | -------------------- | ---------- |
| `as`      | `AsTag \| Component` | `"button"` |
| `asChild` | `boolean`            | -          |

## CollapsibleContent

### 属性

| 属性         | 类型                 | 默认值  |
| ------------ | -------------------- | ------- |
| `as`         | `AsTag \| Component` | `"div"` |
| `asChild`    | `boolean`            | -       |
| `forceMount` | `boolean`            | -       |
