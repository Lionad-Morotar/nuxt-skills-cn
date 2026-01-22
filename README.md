<p align="center">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/nuxt-skills.webp" alt="Nuxt Skills" width="100%">
  <br>
  <sub>设计灵感来源于 <a href="https://github.com/HugoRCD">HugoRCD</a> 的作品</sub>
</p>

<p align="center">Vue、Nuxt 和 NuxtHub 技能，适用于 AI 编码助手。</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/badge-claude-code.svg" alt="Claude Code">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/badge-copilot.svg" alt="GitHub Copilot">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/badge-codex.svg" alt="OpenAI Codex">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/badge-opencode.svg" alt="OpenCode">
</p>

<p align="center">
  <a href="https://github.com/nuxt/nuxt/discussions/34059">
    🔗 相关 Nuxt RFC：在 Nuxt 模块中捆绑代理技能
  </a>
</p>

## 安装

```bash
npx skills add onmax/nuxt-skills
```

[`skills`](https://www.npmjs.com/package/skills) CLI 会自动检测已安装的代理，并提供交互式选择器。使用 `-g` 可全局（用户范围）安装，或使用 `-y` 安装所有技能。

支持 Claude Code、Cursor、Codex、OpenCode、GitHub Copilot、Antigravity、Roo Code 等。

### Claude Code 商店

Claude Code 用户的替代方案：

```bash
# 添加商店
/plugin marketplace add onmax/nuxt-skills

# 安装单个技能
/plugin install vue@nuxt-skills
/plugin install nuxt@nuxt-skills

# 安装多个技能
/plugin install vue@nuxt-skills nuxt@nuxt-skills nuxt-ui@nuxt-skills
```

### 手动安装

克隆仓库并将技能文件夹复制到代理的技能目录中：

| 代理        | 项目路径           | 全局路径                     |
| ----------- | ------------------ | ---------------------------- |
| Claude Code | `.claude/skills/`  | `~/.claude/skills/`          |
| Cursor      | `.cursor/skills/`  | `~/.cursor/skills/`          |
| Codex       | `.codex/skills/`   | `~/.codex/skills/`           |
| OpenCode    | `.opencode/skill/` | `~/.config/opencode/skill/`  |
| Copilot     | `.github/skills/`  | —                            |

## 技能

| 技能                 | 描述                                                                            |
| -------------------- | ------------------------------------------------------------------------------- |
| **vue**              | Vue 3 Composition API、组件、组合式函数、测试                                  |
| **nuxt**             | Nuxt 4+ 服务器路由、路由、中间件、配置                                         |
| **nuxt-modules**     | 使用 defineNuxtModule 创建 Nuxt 模块、工具包实用程序、测试                     |
| **nuxthub**          | NuxtHub v0.10 数据库、键值对、二进制对象、缓存、多云                           |
| **nuxt-content**     | Nuxt Content v3 集合、查询、MDC 渲染、NuxtStudio                               |
| **nuxt-ui**          | Nuxt UI v4 组件、主题、表单、覆盖层、组合式函数                                |
| **nuxt-better-auth** | 使用 @onmax/nuxt-better-auth 的认证、useUserSession、路由保护、clientOnly       |
| **reka-ui**          | Reka UI 无头 Vue 组件、可访问原语、属性/事件/插槽                                |
| **document-writer**  | 编写 Nuxt 生态系统的文档——MDC、样式、结构、代码示例                             |
| **ts-library**       | TypeScript 库开发——导出、tsdown、API 模式、类型技巧、CI                        |
| **motion**           | Motion Vue 动画——motion 组件、组合式函数、滚动、手势                            |
| **vueuse**           | VueUse 组合式函数——状态、浏览器、传感器、网络、动画工具                         |

## 技能工作原理

技能遵循 [Agent Skills](https://agentskills.io) 开放格式。它们可以通过两种方式激活：

1. **自动发现** —— 代理读取每个技能的 `description` 并在与任务相关时加载
2. **手动调用** —— 输入 `/skill-name`（例如 `/nuxt`）以显式加载技能

| 您正在处理...         | 代理可能自动加载...     |
| --------------------- | ----------------------- |
| `.vue` 文件           | `vue` 技能              |
| `server/api/` 路由    | `nuxt` 技能             |
| `nuxt.config.ts`      | `nuxt` 技能             |
| NuxtHub 存储          | `nuxthub` 技能          |
| 认证/登录/会话        | `nuxt-better-auth`      |

## 结构

遵循 [agentskills](https://github.com/agentskills/agentskills) 标准格式。

```
nuxt-skills/
├── skills/                 # 技能（agentskills 格式）
│   ├── vue/
│   │   ├── SKILL.md        # 入口点，包含 frontmatter
│   │   └── references/     # 按需加载的子文件
│   ├── nuxt/
│   ├── nuxt-modules/
│   ├── nuxthub/
│   ├── nuxt-content/
│   ├── nuxt-ui/
│   ├── nuxt-better-auth/
│   ├── reka-ui/
│   ├── document-writer/
│   ├── ts-library/
│   ├── motion/
│   └── vueuse/
└── .claude-plugin/
    └── marketplace.json    # Claude Code 商店
```

## 自动维护

通过 GitHub Actions 保持技能更新：

| 工作流程                  | 计划周期              | 目的                                                              |
| ------------------------- | --------------------- | ----------------------------------------------------------------- |
| **update-skills.yml**     | 每周（周一）          | 从上游重新生成 reka-ui、nuxt-ui 和 vueuse 文档                     |
| **skill-maintenance.yml** | 每两周（每月 1 日和 15 日） | Claude 分析上游变更日志，如有更新需求则创建 PR                     |

维护工作流使用 [claude-code-action](https://github.com/anthropics/claude-code-action) 来智能检测上游源中的重大变更、新功能和弃用。

## 资源

- [Agent Skills 规范](https://agentskills.io) —— 扩展 AI 代理能力的开放格式
- [Claude Code 技能](https://code.claude.com/docs/en/skills) —— Claude Code 中的技能
- [VS Code 代理技能](https://code.visualstudio.com/docs/copilot/customization/agent-skills) —— VS Code 中的 GitHub Copilot 技能
- [GitHub 代理技能文档](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) —— 关于代理技能
- [OpenCode 技能](https://opencode.ai/docs/skills/) —— OpenCode 中的代理技能
- [awesome-copilot](https://github.com/github/awesome-copilot) —— 自定义代理和提示的社区集合

## 许可证

MIT
