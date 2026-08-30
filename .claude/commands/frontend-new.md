---
description: 新規Reactコンポーネント/ページを作成する
disable-model-invocation: true
argument-hint: [コンポーネント名] [簡単な説明]
---

$ARGUMENTS の内容に従って、新規Reactコンポーネント（またはページ）を作成する。

1. 対象名と用途（コンポーネントかページか、propsは何か）を `$ARGUMENTS` から把握する。不明瞭なら簡潔に確認する。
2. `frontend/src/` 配下の既存の構成（`components/` / `pages/` 等）に合わせて配置場所を決める。
3. `frontend.md` の規約（関数コンポーネント+Hooks、API呼び出しは`src/api/`に集約）に沿って実装する。
4. APIを利用する場合は、対応するAPI呼び出し関数が `frontend/src/api/` に既にあるか確認し、無ければ追加する。
5. 作成後、`docker compose logs frontend` でコンパイルエラーが出ていないか確認する。
