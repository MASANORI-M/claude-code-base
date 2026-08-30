---
description: Investigate and fix a frontend bug
disable-model-invocation: true
argument-hint: [description of the bug]
---

Investigate and fix the frontend-side issue described in `$ARGUMENTS`.

1. Work out the reproduction conditions from `$ARGUMENTS` and the related code. Ask the user for repro steps if needed.
2. Investigate the relevant component and how it handles the API response with `Read`/`Grep` to identify the cause.
3. If the issue may actually be on the Laravel (backend) side, don't limit yourself to a frontend workaround — report that to the user (use `/backend-fix` for backend fixes).
4. Make a minimal fix at the root cause.
5. After fixing, check `docker compose logs frontend` for errors.
