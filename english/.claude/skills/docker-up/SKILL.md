---
name: docker-up
description: Start the development environment (frontend/backend/db) with Docker Compose
disable-model-invocation: true
allowed-tools: Bash(docker compose *)
---

1. Check whether `.env` exists. If not, suggest the user copy it from `.env.example`.
2. Run `docker compose up -d --build`.
3. Run `docker compose ps` to confirm each service (frontend, backend, db) has started.
4. If `APP_KEY` is not set in the `backend` container, run `docker compose exec backend php artisan key:generate`.
5. Once `db` is up, run `docker compose exec backend php artisan migrate` and confirm the migrations apply cleanly (on first startup, or when there are new migrations).
6. Check `docker compose logs backend --tail=50` for errors.
7. If everything looks good, tell the user:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
8. If there's an error, analyze the logs and narrow down the cause (port conflict, DB not connected, composer/npm build failure, etc.).
