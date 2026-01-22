# useCookies

`@vueuse/integrations` 的封装库。
**包：** `@vueuse/integrations`
**分类：** '@Integrations'

## 用法

```ts
<script setup lang="ts">
import { useCookies } from '@vueuse/integrations/useCookies'

const cookies = useCookies(['locale'])
</script>

<template>
  <div>
    <strong>locale</strong>: {{ cookies.get('locale') }}
    <hr>
    <pre>{{ cookies.getAll() }}</pre>
    <button @click="cookies.set('locale', 'ru-RU')">
      Russian
    </button>
    <button @click="cookies.set('locale', 'en-US')">
      English
    </button>
  </div>
</template>
```

## 参考

[VueUse 文档](https://vueuse.org/core/useCookies/)
