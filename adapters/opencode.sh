#!/bin/bash
set -e

# OpenCode adapter - converts Claude Code skills to OpenCode agents
# Usage: ./adapters/opencode.sh [skill-name]
# Generates merged .md files with YAML frontmatter for OpenCode

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
OUTPUT_DIR="$SCRIPT_DIR/dist/opencode"

mkdir -p "$OUTPUT_DIR"

convert_skill() {
  local skill="$1"
  local skill_dir="$SKILLS_DIR/$skill"
  local output_file="$OUTPUT_DIR/$skill.md"

  if [ ! -d "$skill_dir" ]; then
    echo "Skill directory not found: $skill_dir"
    return 1
  fi

  # Extract description from SKILL.md frontmatter
  local description=$(grep -A1 "^description:" "$skill_dir/SKILL.md" | head -1 | sed 's/^description: //')

  # Start with OpenCode frontmatter
  cat > "$output_file" << EOF
---
description: $description
mode: subagent
tools:
  write: false
  edit: false
---

EOF

  # Append SKILL.md content (skip frontmatter)
  sed -n '/^---$/,/^---$/!p' "$skill_dir/SKILL.md" | tail -n +2 >> "$output_file"

  # Append all other .md files
  for md_file in "$skill_dir"/*.md; do
    if [ "$(basename "$md_file")" != "SKILL.md" ]; then
      echo "" >> "$output_file"
      echo "---" >> "$output_file"
      echo "" >> "$output_file"
      cat "$md_file" >> "$output_file"
    fi
  done

  # Append reference files if they exist
  if [ -d "$skill_dir/references" ]; then
    for ref_file in "$skill_dir/references"/*.md; do
      if [ -f "$ref_file" ]; then
        echo "" >> "$output_file"
        echo "---" >> "$output_file"
        echo "" >> "$output_file"
        cat "$ref_file" >> "$output_file"
      fi
    done
  fi

  echo "Generated: $output_file"
}

# Convert specific skill or all
if [ -n "$1" ]; then
  convert_skill "$1"
else
  for skill in vue nuxt nuxthub; do
    convert_skill "$skill"
  done
fi

echo "OpenCode agents generated in $OUTPUT_DIR"
