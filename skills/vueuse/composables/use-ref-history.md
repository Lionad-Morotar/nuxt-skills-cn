# useRefHistory

追踪 ref 的变更历史，同时提供撤销与重做功能

**包：** `@vueuse/core`
**分类：** 状态

## 用法

```ts
// @include: usage
// ---cut---
counter.value += 1

await nextTick()
console.log(history.value)
/* [
  { snapshot: 1, timestamp: 1601912898062 },
  { snapshot: 0, timestamp: 1601912898061 }
] */
```

## 选项

| 选项         | 类型                                                        | 默认值  | 描述                                                                               |
| ------------ | ----------------------------------------------------------- | ------- | ---------------------------------------------------------------------------------- |
| deep         | `boolean`                                                   | false   | 监听深层变化，默认为 false                                                         |
| capacity     | `number`                                                    | -       | 要保留的历史最大数量。默认为无限制。                                               |
| clone        | `boolean \| CloneFn<Raw>`                                   | false   | 拍摄快照时进行克隆，简写为 dump：JSON.parse(JSON.stringify(value))。               |
| dump         | `(v: Raw) => Serialized`                                    | -       | 将数据序列化到历史记录中                                                           |
| parse        | `(v: Serialized) => Raw`                                    | -       | 从历史记录中反序列化数据                                                           |
| shouldCommit | `(oldValue: Raw \| undefined, newValue: Raw) => boolean`    | -       | 判断是否应继续提交的函数                                                           |

## 返回值

| 名称       | 类型  |
| ---------- | ----- |
| isTracking | `Ref` |
| pause      | `Ref` |
| resume     | `Ref` |
| commit     | `Ref` |
| batch      | `Ref` |
| dispose    | `Ref` |

## 参考

[VueUse 文档](https://vueuse.org/core/useRefHistory/)
