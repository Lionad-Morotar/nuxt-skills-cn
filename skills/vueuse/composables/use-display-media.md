# useDisplayMedia

响应式流式传输。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useDisplayMedia } from '@vueuse/core'
import { useTemplateRef } from 'vue'

const { stream, start } = useDisplayMedia()

// 开始流式传输
start()

const videoRef = useTemplateRef('video')
watchEffect(() => {
  // 在视频元素上预览
  videoRef.value.srcObject = stream.value
})
</script>

<template>
  <video ref="video" />
</template>
```

## 选项

| 选项      | 类型                                            | 默认值  | 描述                             |
| --------- | ----------------------------------------------- | ------- | -------------------------------- |
| enabled   | `MaybeRef&lt;boolean&gt;`                       | false   | 流是否启用                       |
| video     | `boolean \| MediaTrackConstraints \| undefined` | -       | 流视频媒体约束                   |
| audio     | `boolean \| MediaTrackConstraints \| undefined` | -       | 流音频媒体约束                   |

## 返回值

| 名称        | 类型                                         |
| ----------- | -------------------------------------------- |
| isSupported | `useSupported`                               |
| stream      | `shallowRef&lt;MediaStream \| undefined&gt;` |
| start       | `Ref`                                        |
| stop        | `Ref`                                        |
| enabled     | `shallowRef`                                 |

## 参考

[VueUse 文档](https://vueuse.org/core/useDisplayMedia/)
