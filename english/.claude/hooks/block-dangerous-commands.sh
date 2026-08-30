#!/bin/bash
# PreToolUse hook: block destructive terraform/git commands before they run via Bash
set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

BLOCKED_PATTERNS=(
  "terraform apply"
  "terraform destroy"
  "git push --force"
  "git push -f"
  "git reset --hard"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if [[ "$COMMAND" == *"$pattern"* ]]; then
    echo "Blocked: \"$pattern\" is not allowed to run from Claude Code (project policy). If needed, the user must run it manually." >&2
    exit 2
  fi
done

exit 0
