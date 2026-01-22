# 数字字段

带增/减功能的数值输入框

**组件结构：** `NumberFieldRoot`、`NumberFieldInput`、`NumberFieldIncrement`、`NumberFieldDecrement`

## NumberFieldRoot

### 属性

| 属性            | 类型                  | 默认值    |
| --------------- | --------------------- | --------- |
| `as`            | `AsTag \| Component`  | `"div"`   |
| `asChild`       | `boolean`             | -         |
| `defaultValue`  | `number`              | -         |
| `disabled`      | `boolean`             | -         |
| `formatOptions` | `NumberFormatOptions` | -         |
| `id`            | `string`              | -         |
| `locale`        | `string`              | `"en-US"` |
| `max`           | `number`              | -         |
| `min`           | `number`              | -         |
| `modelValue`    | `number`              | -         |
| `name`          | `string`              | -         |
| `required`      | `boolean`             | -         |
| `step`          | `number`              | `1`       |

### 事件

| 事件                | 参数            |
| ------------------- | --------------- |
| `update:modelValue` | `[val: number]` |

### 插槽

| 插槽         | 类型     |
| ------------ | -------- |
| `modelValue` | `number` |
| `textValue`  | `string` |

## NumberFieldInput

### 属性

| 属性      | 类型                 | 默认值    |
| --------- | -------------------- | --------- |
| `as`      | `AsTag \| Component` | `"input"` |
| `asChild` | `boolean`            | -         |

## NumberFieldIncrement

### 属性

| 属性       | 类型                 | 默认值     |
| ---------- | -------------------- | ---------- |
| `as`       | `AsTag \| Component` | `"button"` |
| `asChild`  | `boolean`            | -          |
| `disabled` | `boolean`            | -          |

## NumberFieldDecrement

### 属性

| 属性       | 类型                 | 默认值     |
| ---------- | -------------------- | ---------- |
| `as`       | `AsTag \| Component` | `"button"` |
| `asChild`  | `boolean`            | -          |
| `disabled` | `boolean`            | -          |
