---
description: フロントエンドの不具合を調査・修正する
disable-model-invocation: true
argument-hint: [不具合の内容]
---

$ARGUMENTS の不具合について、フロントエンド側の調査・修正を行う。

1. 不具合の再現条件を `$ARGUMENTS` と関連コードから整理する。必要ならユーザーに再現手順を確認する。
2. 関連コンポーネント・APIレスポンスの扱いを `Read`/`Grep` で調査し、原因を特定する。
3. Laravel側（バックエンド）の問題である可能性がある場合は、フロント側の対処に留めず、その旨をユーザーに報告する（バックエンド修正は `/backend-fix` を使う）。
4. 原因箇所に対して最小限の修正を行う。
5. `docker compose logs frontend` で修正後にエラーが出ていないか確認する。
