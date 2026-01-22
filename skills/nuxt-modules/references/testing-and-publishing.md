# 测试与发布

端到端测试、最佳实践及模块发布。

## 端到端测试设置

```bash
npm install -D @nuxt/test-utils vitest
```

```ts
// vitest.config.ts
import { defineVitestConfig } from '@nuxt/test-utils/config'

export default defineVitestConfig({
  test: { environment: 'nuxt' }
})
```

## 测试示例

创建一个使用你模块的最小 Nuxt 应用：

```ts
// test/fixtures/basic/nuxt.config.ts
import MyModule from '../../../src/module'

export default defineNuxtConfig({
  modules: [MyModule],
  myModule: { enabled: true }
})
```

```vue
<!-- test/fixtures/basic/pages/index.vue -->
<template>
  <MyButton>Click me</MyButton>
</template>
```

## 编写测试

```ts
import { fileURLToPath } from 'node:url'
import { $fetch, setup } from '@nuxt/test-utils/e2e'
// test/basic.test.ts
import { describe, expect, it } from 'vitest'

describe('basic', async () => {
  await setup({
    rootDir: fileURLToPath(new URL('./fixtures/basic', import.meta.url))
  })

  it('renders component', async () => {
    const html = await $fetch('/')
    expect(html).toContain('Click me')
  })

  it('api works', async () => {
    const data = await $fetch('/api/_my-module/status')
    expect(data).toEqual({ status: 'ok' })
  })
})
```

## 手动测试

```bash
# 在模块目录中
npm pack

# 在测试项目中
npm install /path/to/my-module-1.0.0.tgz
```

---

## 最佳实践

### 异步设置

保持设置快速。若设置超过 1 秒，Nuxt 会发出警告。

```ts
// 错误 - 阻塞式
async setup(options, nuxt) {
  const data = await fetchRemoteConfig()  // 慢！
}

// 正确 - 延迟到钩子中执行
setup(options, nuxt) {
  nuxt.hook('ready', async () => {
    const data = await fetchRemoteConfig()
  })
}
```

### 所有导出添加前缀

避免命名冲突：

| 类型          | 错误         | 正确              |
| ------------- | ------------ | ----------------- |
| 组件          | `<Button>`   | `<FooButton>`     |
| 可组合式函数  | `useData()`  | `useFooData()`    |
| 服务端路由    | `/api/track` | `/api/_foo/track` |
| 插件          | `$helper`    | `$fooHelper`      |

### 生命周期钩子

用于一次性设置任务：

```ts
export default defineNuxtModule({
  meta: { name: 'my-module', version: '2.0.0' },

  async onInstall(nuxt) {
    await generateInitialConfig(nuxt.options.rootDir)
  },

  async onUpgrade(options, nuxt, previousVersion) {
    if (semver.lt(previousVersion, '2.0.0')) {
      await migrateFromV1()
    }
  }
})
```

### 仅支持 TypeScript + ESM

```ts
// 始终导出带类型的选项
// 仅支持 ESM，不支持 CommonJS
import { something } from 'package'

export interface ModuleOptions {
  apiKey: string
  debug?: boolean
} // 正确
const { something } = require('package') // 错误
```

### 错误信息

```ts
setup(options, nuxt) {
  if (!options.apiKey) {
    throw new Error('[my-module] `apiKey` option is required')
  }
}
```

---

## 发布

两步流程：本地版本升级 → CI 发布。必须在打标签前通过 CI。

### 设置

```bash
pnpm add -D bumpp
```

```json
{
  "scripts": {
    "release": "bumpp && git push --follow-tags"
  }
}
```

### 流程

```bash
pnpm release  # 提示版本、提交、打标签并推送
# → CI release.yml 在 v* 标签触发 → npm 发布 + GitHub 发布
```

### 提交规范

| 前缀                         | 版本更新 |
| ---------------------------- | -------- |
| `feat:`                      | minor    |
| `fix:`, `chore:`, `docs:`   | patch    |
| `feat!:` 或 `BREAKING CHANGE:` | major    |

### CI 工作流

完整的 CI/CD 包含三个工作流：

| 文件          | 触发条件   | 目的                          |
| ------------- | ---------- | ----------------------------- |
| `ci.yml`      | push/PR    | 代码检查、类型检查、测试       |
| `pkg.yml`     | push/PR    | 通过 pkg-pr-new 预览包         |
| `release.yml` | 标签 `v*`  | npm 发布 + GitHub 发布        |

**模板来源：** [references/ci-workflows.md](references/ci-workflows.md)

---

## 发布

### 命名规范

| 作用域     | 示例                  | 描述                            |
| ---------- | --------------------- | ------------------------------- |
| `@nuxtjs/` | `@nuxtjs/tailwindcss` | 社区模块（nuxt-modules 组织）   |
| `nuxt-`    | `nuxt-my-module`      | 第三方模块                      |
| `@org/`    | `@myorg/nuxt-auth`    | 组织作用域                      |

### 文档检查清单

- [ ] **为什么** - 该模块解决了什么问题？
- [ ] **安装** - 如何安装与配置？
- [ ] **用法** - 基本示例
- [ ] **选项** - 所有配置项及类型
- [ ] **演示** - StackBlitz 链接

### 版本兼容性

```ts
meta: {
  compatibility: { nuxt: '>=3.0.0' }
}
```

使用 “X for Nuxt” 命名方式，而非 “X for Nuxt 3” —— 版本由 `meta.compatibility` 处理。

## 资源

- [@nuxt/test-utils](https://nuxt.com/docs/getting-started/testing)
- [发布模块](https://nuxt.com/docs/guide/going-further/modules#publishing)
- [Nuxt 模块目录](https://nuxt.com/modules)
