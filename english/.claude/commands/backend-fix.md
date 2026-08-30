---
description: Investigate and fix a bug on the backend (Laravel)
disable-model-invocation: true
argument-hint: [description of the bug]
---

Investigate and fix the backend-side issue described in `$ARGUMENTS`.

1. Work out the reproduction steps. Check `docker compose logs backend` and `backend/storage/logs/laravel.log` for errors.
2. Investigate the relevant Controller/Service/Model/migration with `Read`/`Grep` to identify the cause.
3. If it's a DB schema issue, don't edit existing migrations directly — add a new migration instead.
4. Make a minimal fix at the root cause.
5. After fixing, run the related Feature tests to confirm. Add a test if none exists, to prevent regressions.
