---
description: Create a new React component/page
disable-model-invocation: true
argument-hint: [component name] [brief description]
---

Create a new React component (or page) per `$ARGUMENTS`.

1. Determine the name and purpose (component or page, and its props) from `$ARGUMENTS`. Ask briefly if unclear.
2. Decide where to place it based on the existing structure under `frontend/src/` (`components/` / `pages/` etc.).
3. Implement per the conventions in `frontend.md` (function components + Hooks, API calls consolidated under `src/api/`).
4. If it uses an API, check whether the corresponding API call function already exists under `frontend/src/api/`; add it if not.
5. After creating it, check `docker compose logs frontend` for compile errors.
