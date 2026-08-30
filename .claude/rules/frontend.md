---
paths:
  - "frontend/**/*.{js,jsx,ts,tsx}"
---

# React フロントエンド規約

- 関数コンポーネント + Hooks を使う。クラスコンポーネントは新規作成しない。
- API通信は `frontend/src/api/` に集約し、コンポーネント内で直接 `fetch`/`axios` を呼ばない。
- バックエンドのURLは `frontend/.env` の `REACT_APP_API_BASE_URL`（Viteなら `VITE_API_BASE_URL`）経由で参照し、ハードコードしない。
- ローカル状態は `useState`/`useReducer`。グローバル状態が必要そうなときは、ライブラリ導入前に提案して確認する。
- コンポーネント単位でスタイルを管理する（CSS Modules を基本とする）。
- Laravel APIのバリデーションエラー（422レスポンス）はフォーム側で個別フィールドにマッピングして表示する。
- 変更後は `docker compose logs frontend` でコンパイルエラー・warningがないか確認する。
