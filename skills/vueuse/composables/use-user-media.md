# useUserMedia

响应式流式传输。

**包：** `@vueuse/core`  
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useUserMedia } from '@vueuse/core'
import { useTemplateRef, watchEffect } from 'vue'

const { stream, start } = useUserMedia()
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

| 选项         | 类型                        | 默认值   | 描述                                     |
| ------------ | --------------------------- | -------- | ---------------------------------------- |
| enabled      | `MaybeRef<boolean>`         | false    | 若启用流式传输                           |
| autoSwitch   | `MaybeRef<boolean>`         | true     | 当 deviceIds 或 constraints 更改时重新创建流式传输 |

## 返回值

| 名称         | 类型           |
| ------------ | -------------- |
| isSupported  | `useSupported` |
| stream       | `Ref`          |
| start        | `Ref`          |
| stop         | `Ref`          |
| restart      | `Ref`          |
| constraints  | `deepRef`      |
| enabled      | `shallowRef`   |
| autoSwitch   | `shallowRef`   |

## 参考资料

[VueUse 文档](https://vueuse.org/core/useUserMedia/)
