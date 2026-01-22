# useDateFormat

根据传入的标记字符串获取格式化的日期，灵感来源于 dayjs。

**包：** `@vueuse/shared`  
**类别：** 时间

## 用法

```ts
<script setup lang="ts">
import { useDateFormat, useNow } from '@vueuse/core'

const formatted = useDateFormat(useNow(), 'YYYY-MM-DD HH:mm:ss')
</script>

<template>
  <div>{{ formatted }}</div>
</template>
```

## 选项

| 选项           | 类型                                                                                        | 默认值  | 描述                                                       |
| -------------- | ------------------------------------------------------------------------------------------- | ------- | ---------------------------------------------------------- |
| locales        | `MaybeRefOrGetter&lt;Intl.LocalesArgument&gt;`                                              | -       | 用于 dd/ddd/dddd/MMM/MMMM 格式的区域设置                   |
| customMeridiem | `(hours: number, minutes: number, isLowercase?: boolean, hasPeriod?: boolean) =&gt; string` | -       | 自定义函数，用于重新修改显示 meridiem 的方式               |

## 参考

[VueUse 文档](https://vueuse.org/core/useDateFormat/)
