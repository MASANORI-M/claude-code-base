#!/bin/bash
# PreToolUse hook: 破壊的なterraform/gitコマンドをBash実行前にブロックする
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
    echo "Blocked: \"$pattern\" はClaude Codeからの実行を禁止しています（プロジェクト方針）。必要な場合はユーザー自身が手動で実行してください。" >&2
    exit 2
  fi
done

exit 0
