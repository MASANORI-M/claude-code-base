---
paths:
  - "backend/app/**/*.php"
  - "backend/routes/**/*.php"
---

# Laravel Backend Conventions

- Keep controllers thin. Move complex business logic into classes under `app/Services/` or `app/Actions/`.
- Don't write validation directly in controllers — use Form Request classes (`php artisan make:request`).
- Don't return Eloquent models directly in responses — shape them with an API Resource (`php artisan make:resource`).
- Define routes in `routes/api.php`, kept separate from the web routes in `routes/web.php`.
- Manage secrets (DB connection info, APP_KEY, etc.) via `.env` — don't hardcode them in `config/*.php`.
- Use the Eloquent ORM for DB access as the default; if raw SQL is required, leave a comment explaining why.
- Add at least one Feature test (`php artisan make:test --pest` or `--phpunit`) whenever adding a new endpoint.
- Always create schema changes with `php artisan make:migration` (see database.md).
