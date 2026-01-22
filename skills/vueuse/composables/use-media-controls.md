# useMediaControls

适用于 `<video>` 和 `<audio>` 元素的响应式媒体控制

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
<script setup lang="ts">
import { useMediaControls } from '@vueuse/core'
import { onMounted, useTemplateRef } from 'vue'

const video = useTemplateRef('video')
const { playing, currentTime, duration, volume } = useMediaControls(video, {
  src: 'video.mp4',
})

// 更改初始媒体属性
onMounted(() => {
  volume.value = 0.5
  currentTime.value = 60
})
</script>

<template>
  <video ref="video" />
  <button @click="playing = !playing">
    播放 / 暂停
  </button>
  <span>{{ currentTime }} / {{ duration }}</span>
</template>
```

## 选项

| 选项   | 类型                                                                   | 默认值  | 描述                                                             |
| ------ | ---------------------------------------------------------------------- | ------- | ---------------------------------------------------------------- |
| src    | `MaybeRefOrGetter<string \| UseMediaSource \| UseMediaSource[]>`       | -       | 媒体的源，可以是字符串、`UseMediaSource` 对象或一个列表           |
| tracks | `MaybeRefOrGetter<UseMediaTextTrackSource[]>`                          | -       | 媒体的文本轨道列表                                               |

## 返回值

| 名称                   | 类型                                |
| ---------------------- | ----------------------------------- |
| currentTime            | `shallowRef`                        |
| duration               | `shallowRef`                        |
| waiting                | `shallowRef`                        |
| seeking                | `shallowRef`                        |
| ended                  | `shallowRef`                        |
| stalled                | `shallowRef`                        |
| buffered               | `deepRef<[number, number][]>`       |
| playing                | `shallowRef`                        |
| rate                   | `shallowRef`                        |
| muted                  | `shallowRef`                        |
| selectedTrack          | `shallowRef<number>`                |
| enableTrack            | `Ref`                               |
| disableTrack           | `Ref`                               |
| togglePictureInPicture | `Ref`                               |
| isPictureInPicture     | `shallowRef`                        |
| onPlaybackError        | `Ref`                               |

## 参考

[VueUse 文档](https://vueuse.org/core/useMediaControls/)
