# useFileSystemAccess

使用 FileSystemAccessAPI 创建、读取和写入本地文件

**包：** `@vueuse/core`
**类别：** 浏览器

## 用法

```ts
import { useFileSystemAccess } from '@vueuse/core'

const {
  isSupported,
  data,
  file,
  fileName,
  fileMIME,
  fileSize,
  fileLastModified,
  create,
  open,
  save,
  saveAs,
  updateData
} = useFileSystemAccess()
```

## 返回值

| 名称             | 类型                                              |
| ---------------- | ------------------------------------------------- |
| isSupported      | `useSupported`                                    |
| data             | `shallowRef&lt;string \| ArrayBuffer \| Blob&gt;` |
| file             | `shallowRef&lt;File&gt;`                          |
| fileName         | `computed`                                        |
| fileMIME         | `computed`                                        |
| fileSize         | `computed`                                        |
| fileLastModified | `computed`                                        |
| open             | `Ref`                                             |
| create           | `Ref`                                             |
| save             | `Ref`                                             |
| saveAs           | `Ref`                                             |
| updateData       | `Ref`                                             |

## 参考

[VueUse 文档](https://vueuse.org/core/useFileSystemAccess/)
