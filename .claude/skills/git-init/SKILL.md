---
name: git-init
description: このリポジトリをgit管理下に置く（git init・.gitignore確認・リモート設定・初回コミット）
disable-model-invocation: true
allowed-tools: Bash(git *)
---

まだこのリポジトリに `.git` が存在しない場合のみ実行する。

1. `git status` を実行し、`.git` が既に存在するか確認する。既に存在する場合は何もせず、ユーザーに現状を報告して終了する。
2. `.gitignore` の内容を確認する。`.env` / `node_modules/` / `vendor/` / `*.tfstate*` / `.terraform/` 等が漏れている場合はユーザーに追記を提案する。
3. `git init` を実行する。
4. リモートリポジトリ（GitHub）のURLをユーザーに確認する。作成済みならURLを、未作成ならこのタイミングで作るか確認する。取得できたら `git remote add origin <URL>` を設定する。
5. `git add` で意図したファイルのみがステージされているか `git status` で確認してから、初回コミットを作成する（メッセージは `git.md` の規約に沿う。例: `chore: initial commit`）。
6. リモートが設定されていれば、pushしてよいかユーザーに確認してからpushする。
