---
paths:
  - "**/*"
---

# Git Workflow Rules

- Use Conventional Commits format for commit messages (`feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:`, etc.).
- Direct pushes to `main` are forbidden. Work on branches such as `feature/*`, `fix/*`, and merge via Pull Request.
- Pull Request descriptions should include what changed and how it was verified (test results, verification via `/docker-up`, etc.).
- Always confirm with the user before destructive operations such as `git push --force`, `git reset --hard`, and `git branch -D`.
- Never include secrets in commits (real `.env` values, API keys, real `.tfvars` values, etc.). Check `git status` before committing to make sure no unintended files are included.
- Avoid indiscriminate staging like `git add -A` / `git add .` — stage only the relevant files explicitly with `git add`.
