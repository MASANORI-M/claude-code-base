---
description: Create a Pull Request from the current branch's changes
disable-model-invocation: true
argument-hint: [optional: extra context for the PR title/background]
---

Use `$ARGUMENTS` as context if provided.

1. Check `git status`, the current branch name, and the diff against `main` (`git log`, `git diff main...HEAD`).
2. Never create a PR directly from `main` — confirm you're on a working branch such as `feature/*`.
3. If there are unpushed changes, confirm with the user before pushing.
4. Summarize the changes and write a PR title (under 70 characters) and body (summary of changes and how it was verified).
5. Create the PR with `gh pr create`, and report the PR URL to the user once created.
