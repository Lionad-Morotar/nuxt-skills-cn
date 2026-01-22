# useInfiniteScroll

元素的无限滚动。

**包：** `@vueuse/core`
**分类：** 传感器

## 用法

```ts
<script setup lang="ts">
import { useInfiniteScroll } from '@vueuse/core'
import { ref, useTemplateRef } from 'vue'

const el = useTemplateRef('el')
const data = ref([1, 2, 3, 4, 5, 6])

const { reset } = useInfiniteScroll(
  el,
  () => {
    // 加载更多
    data.value.push(...moreData)
  },
  {
    distance: 10,
    canLoadMore: () => {
      // 指示是否还有更多内容可加载，以停止 onLoadMore 触发
      // if (noMoreContent) return false
      return true // 仅为演示目的
    },
  }
)

function resetList() {
  data.value = []
  reset()
}
</script>

<template>
  <div ref="el">
    <div v-for="item in data">
      {{ item }}
    </div>
  </div>
  <button @click="resetList()">
    重置
  </button>
</template>
```

## 选项

| 选项        | 类型                                     | 默认值  | 描述                                                                          |
| ----------- | ---------------------------------------- | ------- | ----------------------------------------------------------------------------- |
| distance    | `number`                                 | 0       | 元素底部与视口底部之间的最小距离                                              |
| direction   | `'top' \| 'bottom' \| 'left' \| 'right'` | bottom  | 监听滚动的方向                                                                |
| interval    | `number`                                 | 100     | 两次加载更多之间的间隔时间（避免触发过多）                                    |
| canLoadMore | `(el: T) =&gt; boolean`                  | -       | 一个函数，用于判断特定元素是否还能加载更多内容                                |

## 返回值

| 名称      | 类型       |
| --------- | ---------- |
| isLoading | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useInfiniteScroll/)
