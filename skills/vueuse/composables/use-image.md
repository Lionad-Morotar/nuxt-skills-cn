# useImage

在浏览器中响应式加载图片，您可以等待结果后再显示图片或显示备用图片。

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useImage } from '@vueuse/core'

const avatarUrl = 'https://place.dog/300/200'
const { isLoading } = useImage({ src: avatarUrl })
</script>

<template>
  <span v-if="isLoading">Loading</span>
  <img v-else :src="avatarUrl">
</template>
```

## 选项

| 选项           | 类型                                 | 默认值  | 描述        |
| -------------- | ------------------------------------ | ------- | ----------- |
| src            | `string`                             | -       |             |
| srcset         | `string`                             | -       |             |
| sizes          | `string`                             | -       |             |
| alt            | `string`                             | -       |             |
| class          | `string`                             | -       |             |
| loading        | `HTMLImageElement['loading']`        | -       |             |
| crossorigin    | `string`                             | -       |             |
| referrerPolicy | `HTMLImageElement['referrerPolicy']` | -       |             |
| width          | `HTMLImageElement['width']`          | -       |             |
| height         | `HTMLImageElement['height']`         | -       |             |
| decoding       | `HTMLImageElement['decoding']`       | -       |             |
| fetchPriority  | `HTMLImageElement['fetchPriority']`  | -       |             |
| ismap          | `HTMLImageElement['isMap']`          | -       |             |
| usemap         | `HTMLImageElement['useMap']`         | -       |             |

## 参考

[VueUse 文档](https://vueuse.org/core/useImage/)
