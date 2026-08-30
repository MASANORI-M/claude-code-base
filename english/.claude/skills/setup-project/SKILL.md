---
name: setup-project
description: Build the Docker-based React + Laravel + MySQL development environment from scratch (including installing React/Laravel)
disable-model-invocation: true
allowed-tools: Bash(docker *), Bash(npx *), Bash(composer *), Bash(mkdir *), Bash(cp *), Bash(chmod *)
---

Build this project's Docker development environment end-to-end, starting from installing React and Laravel.
Scope: frontend (React.js) / backend (Laravel API) / DB (MySQL) / management (GitHub) / local Docker only (no cloud deployment).

## Steps

1. **Check existing files**
   Check whether `frontend/`, `backend/`, and `docker-compose.yml` already exist. If they do, don't overwrite them — confirm the approach with the user.

2. **Create the directory structure**
   ```
   .
   ├── frontend/       # React
   ├── backend/        # Laravel
   ├── docker-compose.yml
   ├── .env.example
   ├── .gitignore
   └── README.md
   ```

3. **Set up React (frontend)**
   - `npx create-react-app frontend` (or confirm with the user whether to use Vite instead before running)
   - Create `frontend/.env.example` with `REACT_APP_API_BASE_URL=http://localhost:8000`
   - Create `frontend/Dockerfile` (dev-oriented: a node image + `npm start`, assuming a volume mount for hot reload)

4. **Set up Laravel (backend)**
   - Create the Laravel project with `composer create-project laravel/laravel backend` (if composer isn't available locally, run it via a temporary Composer container)
   - Create `backend/.env.example` with DB connection info as environment variable references (`DB_HOST=db`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, etc.). Leave `APP_KEY` empty and run `php artisan key:generate` on first startup
   - Create `backend/Dockerfile` (PHP-FPM based, with required extensions such as pdo_mysql enabled, set up for dev with either `php artisan serve` or a regular PHP-FPM + volume-mount configuration for hot reload)
   - Confirm with the user whether to use a separate nginx container or simplify with `php artisan serve` before deciding the web server setup

5. **Create MySQL / docker-compose.yml**
   - `db` service: `mysql:8` image, named volume, environment variables via `.env`
   - `backend` service: `depends_on: db`, port `8000:8000` (or the appropriate port if going through nginx)
   - `frontend` service: `depends_on: backend`, port `3000:3000`
   - Prioritize developer experience by bind-mounting the source directories for `frontend`/`backend` so hot reload works

6. **Prepare .env.example / .gitignore**
   - Add `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`, `DB_ROOT_PASSWORD` (dummy values) to the root or per-directory `.env.example`
   - Add `.env`, `node_modules/`, `backend/vendor/`, and the MySQL data directory equivalent to `.gitignore`

7. **Write startup steps into README.md**
   Document: prepare `.env` → `/docker-up` → on first run only, run `php artisan key:generate` and `php artisan migrate` inside the `backend` container.

8. **Finally, run `/docker-up` to verify startup**, confirming all three services start and that the frontend at `http://localhost:3000` can reach the API at `http://localhost:8000`.

If something fails, read the logs (`docker compose logs`) and narrow down the cause before fixing it. For any ambiguous choice (React vs Vite, whether to use nginx, PHP version, etc.), confirm with the user before proceeding.
