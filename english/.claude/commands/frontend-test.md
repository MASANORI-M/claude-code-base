---
description: Write tests for the specified React component
disable-model-invocation: true
argument-hint: [target component name]
---

Write tests for the component specified in `$ARGUMENTS`.

1. Check the target component's props and behavior (display conditions, click events, etc.).
2. Create the test file matching the project's existing test setup (e.g. Jest + React Testing Library).
3. Cover not just the happy path but also key branches such as error display and loading states.
4. After creating it, run the tests to confirm they pass (e.g. `docker compose exec frontend npm test -- --watchAll=false` inside the container).
