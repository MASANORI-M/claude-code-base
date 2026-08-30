---
description: Create a new API endpoint (Model/Migration/Controller/Request)
disable-model-invocation: true
argument-hint: [resource name] [brief description]
---

Create a new Laravel API endpoint end-to-end per `$ARGUMENTS`.

1. Determine the resource name (e.g. Task) and its purpose from `$ARGUMENTS`.
2. Create as needed (use `docker compose exec backend php artisan ...` inside the container):
   - `php artisan make:migration create_{table_name}_table` to add a migration
   - `php artisan make:model {ModelName}`
   - `php artisan make:request {ModelName}Request` (for validation)
   - `php artisan make:resource {ModelName}Resource` (for response shaping)
   - `php artisan make:controller Api/{ModelName}Controller --api`
3. Implement per the conventions in `backend.md` (thin controllers, logic in Services, never return Eloquent models directly).
4. Add the route to `routes/api.php`.
5. Run `docker compose exec backend php artisan migrate` to apply the migration.
6. Create at least one Feature test (you may use `/backend-test`).
