# nuxt-skills

Vue, Nuxt, and NuxtHub skills for AI coding assistants.

## Skills

| Skill | Description |
|-------|-------------|
| **vue** | Vue 3 Composition API, components, composables, testing |
| **nuxt** | Nuxt 4+ server routes, routing, middleware, config |
| **nuxthub** | NuxtHub v0.10 database, KV, blob, cache, multi-cloud |

## Installation

### Claude Code

```bash
/plugin marketplace add maxidev/nuxt-skills
/plugin install vue@nuxt-skills
/plugin install nuxt@nuxt-skills
/plugin install nuxthub@nuxt-skills
```

Or install all:
```bash
/plugin marketplace add maxidev/nuxt-skills
# Then use /plugin menu to install
```

### OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/maxidev/nuxt-skills/main/install.sh | bash -s -- opencode
```

Or specific skill:
```bash
curl -fsSL https://raw.githubusercontent.com/maxidev/nuxt-skills/main/install.sh | bash -s -- opencode vue
```

### Manual

Clone and run:
```bash
git clone https://github.com/maxidev/nuxt-skills.git
cd nuxt-skills

# Claude Code
./install.sh claude              # All skills
./install.sh claude vue          # Specific skill
./install.sh claude --project    # Project-local install

# OpenCode
./install.sh opencode            # All agents
./install.sh opencode nuxt       # Specific agent
```

## Structure

```
nuxt-skills/
├── skills/                 # Source (Claude Code format)
│   ├── vue/
│   ├── nuxt/
│   └── nuxthub/
├── dist/
│   └── opencode/          # Pre-generated OpenCode agents
├── adapters/
│   └── opencode.sh        # Converter script
└── .claude-plugin/
    └── marketplace.json   # Claude Code marketplace
```

## Regenerating OpenCode Agents

After editing skills:
```bash
./adapters/opencode.sh
```

## License

MIT
