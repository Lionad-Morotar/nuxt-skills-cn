# useManualRefHistory

当使用调用时，手动追踪 ref 的变更历史记录，并提供撤销与重做功能

**包：** `@vueuse/core`  
**分类：** 状态

## 用法

```ts
// @include: usage
// ---cut---
console.log(counter.value) // 1
undo()
console.log(counter.value) // 0
```

## 选项

| 选项      | 类型                                          | 默认值  | 描述                                                                               |
| --------- | --------------------------------------------- | ------- | ---------------------------------------------------------------------------------- |
| capacity  | `number`                                      | -       | 要保留的历史记录最大数量。默认为无限制。                                           |
| clone     | `boolean \| CloneFn<Raw>`                     | false   | 快照时克隆数据，简化写法为 dump: JSON.parse(JSON.stringify(value))。               |
| dump      | `(v: Raw) => Serialized`                      | -       | 将数据序列化至历史记录中                                                           |
| parse     | `(v: Serialized) => Raw`                      | -       | 从历史记录中反序列化数据                                                           |
| setSource | `(source: Ref<Raw>, v: Raw) => void`          | -       | 设置数据源                                                                         |

## 返回值

| 名称      | 类型       |
| --------- | ---------- |
| source    | `Ref`      |
| undoStack | `Ref`      |
| redoStack | `Ref`      |
| last      | `Ref`      |
| history   | `computed` |
| canUndo   | `computed` |
| canRedo   | `computed` |
| clear     | `Ref`      |
| commit    | `Ref`      |
| reset     | `Ref`      |
| undo      | `Ref`      |
| redo      | `Ref`      |

## 参考

[VueUse 文档](https://vueuse.org/core/useManualRefHistory/)
