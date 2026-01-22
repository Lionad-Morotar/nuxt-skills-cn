# useMouse

响应式鼠标位置

**包：** `@vueuse/core`
**类别：** 传感器

## 用法

```ts
<template>
  <UseMouse v-slot="{ x, y }">
    x: {{ x }}
    y: {{ y }}
  </UseMouse>
</template>
```

## 选项

| 选项             | 类型                                                                 | 默认值  | 描述                                                                           |
| ---------------- | -------------------------------------------------------------------- | ------- | ------------------------------------------------------------------------------ |
| type             | `UseMouseCoordType \| UseMouseEventExtractor`                        | page    | 鼠标位置基于页面、客户端、屏幕，或相对于前一位置                                |
| target           | `MaybeRefOrGetter<Window \| EventTarget \| null \| undefined>`       | Window  | 在 `target` 元素上监听事件                                                     |
| touch            | `boolean`                                                            | true    | 监听 `touchmove` 事件                                                          |
| scroll           | `boolean`                                                            | true    | 在窗口上监听 `scroll` 事件，仅在类型为 `page` 时有效                           |
| resetOnTouchEnds | `boolean`                                                            | false   | 当触发 `touchend` 事件时重置为初始值                                          |
| initialValue     | `Position`                                                           | -       | 初始值                                                                         |

## 返回值

| 名称       | 类型                                   |
| ---------- | -------------------------------------- |
| x          | `shallowRef`                           |
| y          | `shallowRef`                           |
| sourceType | `shallowRef<UseMouseSourceType>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useMouse/)
