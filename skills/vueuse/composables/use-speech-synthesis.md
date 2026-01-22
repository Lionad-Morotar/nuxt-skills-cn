# useSpeechSynthesis

响应式 SpeechSynthesis。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
import { useSpeechSynthesis } from '@vueuse/core'

const {
  isSupported,
  isPlaying,
  status,
  voiceInfo,
  utterance,
  error,
  stop,
  toggle,
  speak,
} = useSpeechSynthesis()
```

## 选项

| 选项       | 类型                                                         | 默认值  | 描述                                                                   |
| ---------- | ------------------------------------------------------------ | ------- | ---------------------------------------------------------------------- |
| lang       | `MaybeRefOrGetter<string>`                                   | en-US   | SpeechSynthesis 的语言                                                 |
| pitch      | `MaybeRefOrGetter<SpeechSynthesisUtterance['pitch']>`        | 1       | 获取并设置语音将被说出的音高。                                         |
| rate       | `MaybeRefOrGetter<SpeechSynthesisUtterance['rate']>`         | 1       | 获取并设置语音将被说出的速度。                                         |
| voice      | `MaybeRef<SpeechSynthesisVoice>`                             | -       | 获取并设置将用于朗读语音的语音。                                       |
| volume     | `MaybeRefOrGetter<SpeechSynthesisUtterance['volume']>`       | 1       | 获取并设置语音将被说出的音量。                                         |
| onBoundary | `(event: SpeechSynthesisEvent) => void`                      | -       | 当边界事件被触发时调用的回调函数。                                     |

## 返回值

| 名称        | 类型                                                       |
| ----------- | ---------------------------------------------------------- |
| isSupported | `useSupported`                                             |
| isPlaying   | `shallowRef`                                               |
| status      | `shallowRef<UseSpeechSynthesisStatus>`                     |
| utterance   | `computed`                                                 |
| error       | `shallowRef<SpeechSynthesisErrorEvent | undefined>`       |
| stop        | `Ref`                                                      |
| toggle      | `Ref`                                                      |
| speak       | `Ref`                                                      |

## 参考

[VueUse 文档](https://vueuse.org/core/useSpeechSynthesis/)
