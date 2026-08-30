---
name: db-reset
description: Reset the local MySQL data and reapply migrations and seeders
disable-model-invocation: true
allowed-tools: Bash(docker compose *)
---

This is a destructive operation, so always confirm with the user first: "This will delete all local DB data and rebuild it. OK to proceed?"

Once confirmed, prefer the lightweight approach first:

1. Run `docker compose exec backend php artisan migrate:fresh --seed` (drops and recreates all tables, then runs the seeders).

Only if that doesn't work (e.g. the container itself needs to be recreated):

2. `docker compose stop db`
3. `docker compose rm -f db`
4. Check the DB's named volume with `docker volume ls`, and remove it with `docker volume rm`
5. Recreate the DB container with `docker compose up -d db`
6. Run `docker compose exec backend php artisan migrate --seed`
