---
description: 既存のReactコンポーネント/ページを編集・機能追加する
disable-model-invocation: true
argument-hint: [対象コンポーネント名] [変更内容]
---

$ARGUMENTS で指定された既存コンポーネントに対して、仕様変更・機能追加を行う。

1. `$ARGUMENTS` から対象コンポーネントと変更内容を把握する。対象ファイルを `Grep`/`Glob` で特定する。
2. 既存の実装スタイル・props構成を壊さないよう確認してから変更する。
3. `frontend.md` の規約に沿って実装する。
4. 変更によって呼び出し元（親コンポーネント）にも影響がないか確認する。
5. 変更後、`docker compose logs frontend` でエラーがないか確認する。
