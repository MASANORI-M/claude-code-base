---
name: docker-down
description: Stop the development environment with Docker Compose (does not delete data)
disable-model-invocation: true
allowed-tools: Bash(docker compose *)
---

1. Run `docker compose down` (volumes are kept, so DB data is not deleted).
2. If the `-v` option (which also deletes volumes) is needed, always ask the user first — "This will delete all MySQL data, OK to proceed?" — before running it. Never add `-v` without asking.
