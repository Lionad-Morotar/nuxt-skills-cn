# useAuth

响应式 Firebase 认证绑定。它提供了一种响应式方式，因此您可以轻松对用户的认证状态变化做出反应。

**包：** `@vueuse/firebase`  
**类别：** '@Firebase'

## 用法

```ts
<script setup lang="ts">
import { useAuth } from '@vueuse/firebase/useAuth'
import { initializeApp } from 'firebase/app'
import { getAuth, GoogleAuthProvider, signInWithPopup } from 'firebase/auth'

const app = initializeApp({ /* config */ })
const auth = getAuth(app)
const { isAuthenticated, user } = useAuth(auth)

const signIn = () => signInWithPopup(auth, new GoogleAuthProvider())
</script>

<template>
  <pre v-if="isAuthenticated">{{ user }}</pre>
  <div v-else>
    <button @click="signIn">
      使用 Google 登录
    </button>
  </div>
</template>
```

## 返回值

| 名称            | 类型                          |
| --------------- | ----------------------------- |
| isAuthenticated | `computed`                    |
| user            | `deepRef<User \| null>`       |

## 参考

[VueUse 文档](https://vueuse.org/core/useAuth/)
