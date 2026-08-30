---
paths:
  - "**/*"
---

# Git運用ルール

- コミットメッセージは Conventional Commits 形式（`feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:` 等のprefix）を用いる。
- `main` ブランチへの直接pushは禁止。作業は `feature/*`, `fix/*` などのブランチを切り、Pull Requestを経由してmergeする。
- Pull Requestの説明には変更内容と動作確認方法（テスト結果、`/docker-up`での確認結果等）を記載する。
- `git push --force`、`git reset --hard`、`git branch -D` などの破壊的操作は、実行前に必ずユーザーに確認する。
- コミットには秘密情報（`.env`の実値、APIキー、`.tfvars`の実値等）を含めない。コミット前に `git status` で意図しないファイルが含まれていないか確認する。
- `git add -A` / `git add .` のような無差別なステージングは避け、関連ファイルのみを明示的に `git add` する。
