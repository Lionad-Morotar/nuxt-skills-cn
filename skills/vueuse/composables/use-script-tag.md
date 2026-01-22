# useScriptTag

创建一个 script 标签，并支持在卸载时自动移除（删除）该 script 标签。

**包：** `@vueuse/core`  
**分类：** 浏览器

## 用法

```ts
import { useScriptTag } from '@vueuse/core'

useScriptTag(
  'https://player.twitch.tv/js/embed/v1.js',
  // script 标签加载后执行。
  (el: HTMLScriptElement) => {
    // 执行某些操作
  },
)
```

## 选项

| 选项      | 类型                           | 默认值          | 描述                                               |
| --------- | ------------------------------ | --------------- | -------------------------------------------------- |
| immediate | `boolean`                      | true            | 立即加载脚本                                       |
| async     | `boolean`                      | true            | 向 script 标签添加 `async` 属性                    |
| type      | `string`                       | text/javascript | 脚本类型                                           |
| manual    | `boolean`                      | false           | 手动控制加载和卸载的时间点                         |
| attrs     | `Record<string, string>`       | -               | 向 script 标签添加自定义属性                       |
| nonce     | `string`                       | undefined       | 用于 CSP（内容安全策略）的 nonce 值                |

## 返回值

| 名称      | 类型                                          |
| --------- | --------------------------------------------- |
| scriptTag | `shallowRef<HTMLScriptElement \| null>`       |
| load      | `Ref`                                         |
| unload    | `Ref`                                         |

## 参考

[VueUse 文档](https://vueuse.org/core/useScriptTag/)
