# useCloned

响应式克隆 ref。默认情况下，用于执行克隆操作。

**包：** `@vueuse/core`  
**分类：** 工具函数

## 用法

```ts
import { useCloned } from '@vueuse/core'

const original = ref({ key: 'value' })

const { cloned } = useCloned(original)

original.value.key = 'some new value'

console.log(cloned.value.key) // 'value'
```

## 选项

| 选项   | 类型                  | 默认值  | 描述                   |
| ------ | --------------------- | ------- | ---------------------- |
| clone  | `(source: T) =&gt; T` | -       | 自定义克隆函数。       |
| manual | `boolean`             | false   | 手动同步 ref           |

## 返回值

| 名称       | 类型                        |
| ---------- | --------------------------- |
| cloned     | `deepRef`                   |
| isModified | `shallowRef&lt;boolean&gt;` |
| sync       | `Ref`                       |

## 参考

[VueUse 文档](https://vueuse.org/core/useCloned/)
