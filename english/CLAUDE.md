# Project Overview

- Stack: React.js (frontend) / Laravel (backend API) / MySQL (DB)
- Development environment: Local development runs on Docker. Production/staging environments are built on AWS, with infrastructure managed by Terraform (under `terraform/`)
- Repository management: GitHub

## Directory Structure

- `frontend/` — React.js app
- `backend/` — Laravel app
- `docker-compose.yml` — Container configuration (frontend / backend / db, plus a webserver if needed)
- `terraform/` — Production/staging AWS infrastructure definitions (`envs/dev/`, `envs/prod/`, shared `modules/`)

## Getting Started

- Repository initialization (first time only): `/git-init`
- Initial setup: `/setup-project`
- Start: `/docker-up` (internally runs `docker compose up -d --build`)
- Stop: `/docker-down`
- Ports: frontend=3000, backend=8000, db=3306

## Custom Commands (Frontend/Backend Development)

Available under `.claude/commands/`. Explicitly invoke creation, editing, fixing, and test-writing as needed.
Example: `/frontend-new UserProfile`, `/backend-fix 500 error on login`

## Custom Commands (git / Terraform)

- git: `/git-commit` (create a commit following the convention), `/git-pr` (create a PR)
- Terraform: `/terraform-new` (add a new resource), `/terraform-edit` (modify an existing resource), `/terraform-fix` (investigate/fix an issue), `/terraform-plan` (run plan; never applies)

## Basic Principles

- Local development (frontend/backend/db) is Docker-only. Production AWS infrastructure is managed with Terraform
- **Claude Code must never run `terraform apply` / `terraform destroy`.** Stop at reviewing the plan output; the user must always run apply manually
- Manage secrets via `.env` (app) or AWS Secrets Manager / SSM Parameter Store (infrastructure) — never hardcode them in code, docker-compose.yml, or `.tf`/`.tfvars` files
- See `.claude/rules/` for detailed conventions (frontend.md, backend.md, docker.md, database.md, git.md, terraform.md)
- Always confirm with the user before destructive operations (deleting DB data, `docker compose down -v`, `migrate:fresh`, `terraform apply`/`destroy`, `git push --force`, `git reset --hard`)
