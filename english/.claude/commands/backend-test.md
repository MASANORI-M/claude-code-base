---
description: Write tests for the specified endpoint/class
disable-model-invocation: true
argument-hint: [target endpoint/class name]
---

Write tests for the target specified in `$ARGUMENTS`.

1. Create the test file with `docker compose exec backend php artisan make:test {TestName}Test` (Feature vs Unit, and Pest vs PHPUnit, should match the project's existing setup).
2. Cover not just the happy path but also error cases: validation errors (422), authorization errors (403), not found (404), etc.
3. Use the `RefreshDatabase` trait for tests that touch the DB, so other tests aren't affected.
4. After creating it, run the tests to confirm they pass (`docker compose exec backend php artisan test`, or `docker compose exec backend ./vendor/bin/pest` for Pest).
