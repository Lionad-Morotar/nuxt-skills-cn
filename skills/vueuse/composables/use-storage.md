# useStorage

创建一个响应式引用，可用于访问和修改本地存储（LocalStorage）或会话存储（SessionStorage）。

**包：** `@vueuse/core`  
**分类：** 状态

## 用法

```ts
import { useStorage } from '@vueuse/core'

// 绑定对象
const state = useStorage('my-store', { hello: 'hi', greeting: 'Hello' })

// 绑定布尔值
const flag = useStorage('my-flag', true) // 返回 Ref<boolean>

// 绑定数字
const count = useStorage('my-count', 0) // 返回 Ref<number>

// 使用会话存储绑定字符串
const id = useStorage('my-id', 'some-string-id', sessionStorage) // 返回 Ref<string>

// 从存储中删除数据
state.value = null
```

## 选项

| 选项                     | 类型                                                  | 默认值   | 描述                                                             |
| ------------------------ | ----------------------------------------------------- | -------- | ---------------------------------------------------------------- |
| deep                     | `boolean`                                             | true     | 监听深层变化                                                     |
| listenToStorageChanges   | `boolean`                                             | true     | 监听存储更改，适用于多标签页应用程序                             |
| writeDefaults            | `boolean`                                             | true     | 当存储中不存在默认值时将其写入存储                               |
| mergeDefaults            | `boolean \| ((storageValue: T, defaults: T) => T)`     | false    | 将默认值与从存储中读取的值合并                                   |
| serializer               | `Serializer<T>`                                       | -        | 自定义数据序列化                                                 |
| onError                  | `(error: unknown) => void`                            | -        | 错误回调                                                         |
| shallow                  | `boolean`                                             | false    | 使用浅层引用作为引用                                             |
| initOnMounted            | `boolean`                                             | false    | 在组件挂载前等待读取存储                                         |

## 参考

[VueUse 文档](https://vueuse.org/core/useStorage/)
