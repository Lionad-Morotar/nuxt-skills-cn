# onLongPress

监听元素上的长按操作。

**包：** `@vueuse/core`  
**类别：** 传感器

## 用法

```ts
<script setup lang="ts">
import { onLongPress } from '@vueuse/core'
import { shallowRef, useTemplateRef } from 'vue'

const htmlRefHook = useTemplateRef('htmlRefHook')
const longPressedHook = shallowRef(false)

function onLongPressCallbackHook(e: PointerEvent) {
  longPressedHook.value = true
}
function resetHook() {
  longPressedHook.value = false
}

onLongPress(
  htmlRefHook,
  onLongPressCallbackHook,
  {
    modifiers: {
      prevent: true
    }
  }
)
</script>

<template>
  <p>长按状态：{{ longPressedHook }}</p>

  <button ref="htmlRefHook" class="ml-2 button small">
    长按
  </button>

  <button class="ml-2 button small" @click="resetHook">
    重置
  </button>
</template>
```

## 选项

| 选项              | 类型                                                                    | 默认值  | 描述                                             |
| ----------------- | ----------------------------------------------------------------------- | ------- | ------------------------------------------------ |
| delay             | `number \| ((ev: PointerEvent) =&gt; number)`                           | 500     | 触发 `longpress` 的延迟时间（毫秒）              |
| distanceThreshold | `number \| false`                                                       | 10      | 允许移动的距离（像素），超出则不触发长按        |
| onMouseUp         | `(duration: number, distance: number, isLongPress: boolean) =&gt; void` | -       | 当引用元素被释放时调用的函数。                  |

## 参考

[VueUse 文档](https://vueuse.org/core/onLongPress/)
