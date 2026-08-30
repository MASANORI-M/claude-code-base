---
paths:
  - "backend/database/**"
---

# MySQL / Migration Conventions

- Always create schema changes with `php artisan make:migration`. Don't modify existing migration files — add a new migration instead.
- Prepare test/seed data with Seeders (`database/seeders/`) and Factories (`database/factories/`) — don't write raw INSERT statements in migration files.
- Use the `/db-reset` command when you want to rebuild the local DB (this deletes data, so confirm before running it).
- Follow Laravel's naming conventions for tables/columns (plural snake_case table names, foreign keys named `{singular}_id`).
