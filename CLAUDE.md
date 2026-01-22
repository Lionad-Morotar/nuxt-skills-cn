# CLAUDE.md

本文档为在本仓库中使用代码时提供给 Claude Code（claude.ai/code）的指导。

## 目的

适用于 Vue 3、Nuxt 4+、NuxtHub v0.10 和 Nuxt 模块开发的 Claude Code 技能。纯文档仓库——无构建/测试命令。

## 结构

遵循 [agentskills](https://github.com/agentskills/agentskills) 标准格式。

- `skills/<name>/SKILL.md` - 入口点（包含名称/描述/许可证的 frontmatter）
- `skills/<name>/references/*.md` - 按需加载的子文件
- `.claude-plugin/marketplace.json` - Claude Code 商店清单

## 必须：开始工作前

**在进行任何更改之前，始终运行 `git pull`**。CI 自动提交格式修复，因此您的本地分支可能已过时。

**更改后，通过运行 `./sync-skills.sh` 将其同步至 `~/.claude/skills/`**，以便 Claude Code 使用最新版本。

## 必须：处理技能时

**创建或编辑任何技能内容时，始终使用 `example-skills:skill-creator` 技能**。这可确保技能遵循最佳实践。

### 更改技能时的检查清单

添加/编辑/删除技能时，请更新以下所有内容：

1. `skills/<name>/SKILL.md` - 主技能入口点
2. `skills/<name>/references/*.md` - 如适用，包含子文件
3. `.claude-plugin/marketplace.json` - 添加/更新插件条目
4. `README.md` - 更新技能表格和安装命令

**请勿跳过任何一项。** 所有内容都必须保持同步。

## 技能设计模式

技能使用渐进式加载——主 SKILL.md 文件较小（约 300 个 token），参考子文件由用户根据上下文加载。这可将上下文使用量保持在最低水平。
