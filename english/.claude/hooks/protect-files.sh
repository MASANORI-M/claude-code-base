#!/bin/bash
# PreToolUse hook: block edits to files containing secrets or files that should not be overwritten
set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
FILE_PATH="${FILE_PATH//\\//}"

PROTECTED_PATTERNS=(".env" "docker-compose.override.yml" "id_rsa" ".pem" "storage/oauth-private.key" "storage/oauth-public.key" ".tfstate" ".tfvars" ".terraform/")

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "Blocked: $FILE_PATH is a protected file (matched pattern: $pattern). If this edit is necessary, ask the user to make it directly." >&2
    exit 2
  fi
done

exit 0
