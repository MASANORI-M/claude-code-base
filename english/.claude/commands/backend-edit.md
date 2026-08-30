---
description: Edit or add functionality to an existing Laravel API endpoint
disable-model-invocation: true
argument-hint: [target endpoint/Model name] [what to change]
---

Make a spec change or add functionality to the existing API endpoint specified in `$ARGUMENTS`.

1. Identify the target Controller/Model/Request from `$ARGUMENTS`.
2. If a schema change is needed, add a new migration instead of editing an existing one (per database.md).
3. Implement per the conventions in `backend.md` (Form Request validation, API Resource response shaping, etc.).
4. If the change affects the response shape seen by the frontend, call that out explicitly to the user.
5. Confirm existing Feature tests still pass, updating them if necessary.
