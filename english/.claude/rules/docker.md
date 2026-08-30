---
paths:
  - "docker-compose*.yml"
  - "**/Dockerfile*"
---

# Docker Operations Rules (Local Only)

- `docker-compose.yml` / `Dockerfile` are for the local development environment only. Production AWS infrastructure (ECS/Fargate, RDS, ALB, VPC, etc.) is managed with Terraform (under `terraform/`; see `.claude/rules/terraform.md`) and is out of scope for this file. Don't mix AWS deployment settings (e.g. converting to ECS task definitions) into these files.
- The base service setup is `frontend` (React), `backend` (Laravel on PHP-FPM), and `db` (MySQL). Decide as a project convention — when running `/setup-project` — whether to simplify Laravel with `php artisan serve` or add a separate webserver container such as nginx, confirming with the user.
- Default ports are `frontend:3000`, `backend:8000`, `db:3306`. If you change them, update the README too.
- Persist MySQL data with a named volume. Only discard it via `docker compose down -v`, and always confirm with the user before running it.
- Bind-mount the source directory into the `backend` container so code changes take effect immediately (prioritizing developer experience).
- Keep secrets (including Laravel's APP_KEY and DB connection info) in `.env`, and commit only `.env.example` (with empty/dummy values) to Git. Add `.env` itself to `.gitignore`.
- After changing `docker-compose.yml`, verify it starts with `/docker-up` before finishing your work.
