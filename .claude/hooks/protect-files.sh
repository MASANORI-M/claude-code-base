#!/bin/bash
# PreToolUse hook: 機密情報や破棄したくないファイルへの編集をブロックする
set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
FILE_PATH="${FILE_PATH//\\//}"

PROTECTED_PATTERNS=(".env" "docker-compose.override.yml" "id_rsa" ".pem" "storage/oauth-private.key" "storage/oauth-public.key" ".tfstate" ".tfvars" ".terraform/")

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "Blocked: $FILE_PATH は保護対象ファイルです（$pattern に一致）。編集が必要な場合はユーザーに直接依頼してください。" >&2
    exit 2
  fi
done

exit 0
