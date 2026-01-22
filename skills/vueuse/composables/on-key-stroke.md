# onKeyStroke

监听键盘按键。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
import { onKeyStroke } from '@vueuse/core'

onKeyStroke('ArrowDown', (e) => {
  e.preventDefault()
})
```

## 选项

| 选项   | 类型                              | 默认值  | 描述                                                                     |
| ------ | --------------------------------- | ------- | ------------------------------------------------------------------------ |
| dedupe | `MaybeRefOrGetter<boolean>`       | false   | 设置为 `true` 以在按键被持续按下时忽略重复事件。                         |

## 参考

[VueUse 文档](https://vueuse.org/core/onKeyStroke/)
