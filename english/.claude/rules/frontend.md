---
paths:
  - "frontend/**/*.{js,jsx,ts,tsx}"
---

# React Frontend Conventions

- Use function components + Hooks. Don't create new class components.
- Consolidate API calls under `frontend/src/api/` — don't call `fetch`/`axios` directly inside components.
- Reference the backend URL via `frontend/.env`'s `REACT_APP_API_BASE_URL` (or `VITE_API_BASE_URL` for Vite) — never hardcode it.
- Use `useState`/`useReducer` for local state. If global state seems necessary, propose it and confirm before introducing a library.
- Manage styles per component (CSS Modules by default).
- Map Laravel API validation errors (422 responses) to the individual form fields for display.
- After making a change, check `docker compose logs frontend` for compile errors/warnings.
