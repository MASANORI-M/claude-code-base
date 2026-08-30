---
description: Edit or add functionality to an existing React component/page
disable-model-invocation: true
argument-hint: [target component name] [what to change]
---

Make a spec change or add functionality to the existing component specified in `$ARGUMENTS`.

1. Identify the target component and the change from `$ARGUMENTS`. Locate the target file with `Grep`/`Glob`.
2. Confirm you won't break the existing implementation style/props structure before changing it.
3. Implement per the conventions in `frontend.md`.
4. Check whether the change affects callers (parent components) as well.
5. After changing it, check `docker compose logs frontend` for errors.
