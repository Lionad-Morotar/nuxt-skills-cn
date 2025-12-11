#!/bin/bash
set -e

# nuxt-skills installer
# Usage: ./install.sh <platform> [skill-name] [--project]
# Platforms: claude, opencode

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
DIST_DIR="$SCRIPT_DIR/dist"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

usage() {
  echo "Usage: $0 <platform> [skill-name] [--project]"
  echo ""
  echo "Platforms:"
  echo "  claude    Install to Claude Code (~/.claude/skills/)"
  echo "  opencode  Install to OpenCode (~/.config/opencode/agent/)"
  echo ""
  echo "Options:"
  echo "  skill-name  Install specific skill (vue, nuxt, nuxthub)"
  echo "  --project   Install to project directory instead of global"
  echo ""
  echo "Examples:"
  echo "  $0 claude                  # All skills to ~/.claude/skills/"
  echo "  $0 claude vue              # Only vue skill"
  echo "  $0 opencode --project      # All to .opencode/agent/"
  echo "  $0 opencode nuxt           # Only nuxt to ~/.config/opencode/agent/"
  exit 1
}

install_claude() {
  local skill="$1"
  local target_dir="$2"

  mkdir -p "$target_dir"

  if [ -n "$skill" ]; then
    if [ -d "$SKILLS_DIR/$skill" ]; then
      cp -r "$SKILLS_DIR/$skill" "$target_dir/"
      echo -e "${GREEN}✓${NC} Installed $skill to $target_dir/$skill"
    else
      echo -e "${RED}✗${NC} Skill '$skill' not found"
      exit 1
    fi
  else
    for s in vue nuxt nuxthub; do
      cp -r "$SKILLS_DIR/$s" "$target_dir/"
      echo -e "${GREEN}✓${NC} Installed $s"
    done
    echo -e "${BLUE}→${NC} All skills installed to $target_dir"
  fi
}

install_opencode() {
  local skill="$1"
  local target_dir="$2"

  mkdir -p "$target_dir"

  if [ -n "$skill" ]; then
    if [ -f "$DIST_DIR/opencode/$skill.md" ]; then
      cp "$DIST_DIR/opencode/$skill.md" "$target_dir/"
      echo -e "${GREEN}✓${NC} Installed $skill to $target_dir/$skill.md"
    else
      echo -e "${RED}✗${NC} Agent '$skill' not found in dist/opencode/"
      exit 1
    fi
  else
    for s in vue nuxt nuxthub; do
      if [ -f "$DIST_DIR/opencode/$s.md" ]; then
        cp "$DIST_DIR/opencode/$s.md" "$target_dir/"
        echo -e "${GREEN}✓${NC} Installed $s"
      fi
    done
    echo -e "${BLUE}→${NC} All agents installed to $target_dir"
  fi
}

# Parse arguments
PLATFORM=""
SKILL=""
PROJECT=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --project)
      PROJECT=true
      shift
      ;;
    claude|opencode)
      PLATFORM="$1"
      shift
      ;;
    vue|nuxt|nuxthub)
      SKILL="$1"
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo -e "${RED}Unknown argument: $1${NC}"
      usage
      ;;
  esac
done

if [ -z "$PLATFORM" ]; then
  echo -e "${RED}Error: Platform required${NC}"
  usage
fi

# Determine target directory
case $PLATFORM in
  claude)
    if [ "$PROJECT" = true ]; then
      TARGET_DIR=".claude/skills"
    else
      TARGET_DIR="$HOME/.claude/skills"
    fi
    install_claude "$SKILL" "$TARGET_DIR"
    ;;
  opencode)
    if [ "$PROJECT" = true ]; then
      TARGET_DIR=".opencode/agent"
    else
      TARGET_DIR="$HOME/.config/opencode/agent"
    fi
    install_opencode "$SKILL" "$TARGET_DIR"
    ;;
esac

echo ""
echo -e "${GREEN}Done!${NC}"
