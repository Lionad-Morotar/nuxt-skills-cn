# 切换开关

单状态按钮切换器

**组件：** `Toggle`

## 切换开关

### 属性

| 属性           | 类型                 | 默认值     |
| -------------- | -------------------- | ---------- |
| `as`           | `AsTag \| Component` | `"button"` |
| `asChild`      | `boolean`            | -          |
| `defaultValue` | `boolean`            | -          |
| `disabled`     | `boolean`            | `false`    |
| `pressed`      | `boolean`            | -          |

### 事件

| 事件             | 参数               |
| ---------------- | ------------------ |
| `update:pressed` | `[value: boolean]` |

### 插槽

| 插槽      | 类型      |
| --------- | --------- |
| `pressed` | `boolean` |
