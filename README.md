<p align="center">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/nuxt-adan.jpg" alt="Nuxt Skills" width="100%">
</p>

<p align="center">Vue, Nuxt, and NuxtHub skills for AI coding assistants.</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/badge-claude-code.svg" alt="Claude Code">
  <img src="https://raw.githubusercontent.com/onmax/nuxt-skills/main/.github/badge-opencode.svg" alt="OpenCode">
</p>

## Skills

| Skill | Description |
|-------|-------------|
| **vue** | Vue 3 Composition API, components, composables, testing |
| **nuxt** | Nuxt 4+ server routes, routing, middleware, config |
| **nuxt-modules** | Creating Nuxt modules with defineNuxtModule, Kit utilities, testing |
| **nuxthub** | NuxtHub v0.10 database, KV, blob, cache, multi-cloud |

## Installation

### Claude Code

```bash
/plugin marketplace add onmax/nuxt-skills
/plugin install vue@nuxt-skills
/plugin install nuxt@nuxt-skills
/plugin install nuxt-modules@nuxt-skills
/plugin install nuxthub@nuxt-skills
```

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/onmax/nuxt-skills/main/scripts/opencode.sh | bash
```

Specific skill:
```bash
curl -fsSL https://raw.githubusercontent.com/onmax/nuxt-skills/main/scripts/opencode.sh | bash -s -- vue
```

Re-run to update.

### Manual (Claude Code)

```bash
git clone https://github.com/onmax/nuxt-skills.git
cp -r nuxt-skills/skills/vue ~/.claude/skills/
cp -r nuxt-skills/skills/nuxt ~/.claude/skills/
cp -r nuxt-skills/skills/nuxt-modules ~/.claude/skills/
cp -r nuxt-skills/skills/nuxthub ~/.claude/skills/
```

## Structure

```
nuxt-skills/
├── skills/                 # Source (Claude Code format)
│   ├── vue/
│   ├── nuxt/
│   ├── nuxt-modules/
│   └── nuxthub/
├── scripts/
│   └── opencode.sh        # OpenCode installer
└── .claude-plugin/
    └── marketplace.json   # Claude Code marketplace
```

## License

MIT
