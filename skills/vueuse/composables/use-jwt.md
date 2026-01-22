# useJwt

`@vueuse/integrations` 的封装库。
**包:** `@vueuse/integrations`
**类别:** '@Integrations'

## 用法

```ts
import { useJwt } from '@vueuse/integrations/useJwt'
import { defineComponent } from 'vue'

const encodedJwt = ref('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwiaWF0IjoxNTE2MjM5MDIyfQ.L8i6g3PfcHlioHCCPURC9pmXT7gdJpx3kOoyAfNUwCc')
const { header, payload } = useJwt(encodedJwt)
```

## 选项

| 选项          | 类型                          | 默认值  | 描述                                            |
| ------------- | ----------------------------- | ------- | ----------------------------------------------- |
| fallbackValue | `Fallback`                    | null    | 解码时遇到错误返回的值                          |
| onError       | `(error: unknown) =&gt; void` | -       | 解码错误时的回调函数                            |

## 返回值

| 名称    | 类型       |
| ------- | ---------- |
| header  | `computed` |
| payload | `computed` |

## 参考

[VueUse 文档](https://vueuse.org/core/useJwt/)
