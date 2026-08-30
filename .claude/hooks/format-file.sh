#!/bin/bash
# PostToolUse hook: Edit/Write の後に、編集されたファイルの拡張子に応じて自動フォーマットする
set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

case "$FILE_PATH" in
  *.js|*.jsx|*.ts|*.tsx|*.css|*.json)
    if [ -d "$CLAUDE_PROJECT_DIR/frontend" ] && command -v npx >/dev/null 2>&1; then
      (cd "$CLAUDE_PROJECT_DIR/frontend" && npx --no-install prettier --write "$FILE_PATH" 2>/dev/null) || true
    fi
    ;;
  *.php)
    if [ -f "$CLAUDE_PROJECT_DIR/backend/vendor/bin/pint" ]; then
      (cd "$CLAUDE_PROJECT_DIR/backend" && ./vendor/bin/pint "$FILE_PATH" 2>/dev/null) || true
    fi
    ;;
esac

exit 0
