# useSpeechRecognition

响应式语音识别。

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
import { useSpeechRecognition } from '@vueuse/core'

const {
  isSupported,
  isListening,
  isFinal,
  result,
  start,
  stop,
} = useSpeechRecognition()
```

## 选项

| 选项            | 类型                             | 默认值  | 描述                                                                                                                          |
| --------------- | -------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------- |
| continuous      | `boolean`                        | true    | 控制每次识别是否返回连续结果，或仅返回单个结果。                                                                              |
| interimResults  | `boolean`                        | true    | 控制是否应返回中间结果（true）或不返回（false）。中间结果是尚未最终确定的结果。                                               |
| lang            | `MaybeRefOrGetter&lt;string&gt;` | en-US   | 语音识别的语言                                                                                                                |
| maxAlternatives | `number`                         | 1       | 表示每个结果返回的最大备选数量。                                                                                              |

## 返回值

| 名称        | 类型                                                                  |
| ----------- | --------------------------------------------------------------------- |
| isSupported | `useSupported`                                                        |
| isListening | `shallowRef`                                                          |
| isFinal     | `shallowRef`                                                          |
| recognition | `Ref`                                                                 |
| result      | `shallowRef`                                                          |
| error       | `shallowRef&lt;SpeechRecognitionErrorEvent \| Error \| undefined&gt;` |
| toggle      | `Ref`                                                                 |
| start       | `Ref`                                                                 |
| stop        | `Ref`                                                                 |

## 参考

[VueUse 文档](https://vueuse.org/core/useSpeechRecognition/)
