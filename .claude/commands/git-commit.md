---
description: 変更内容を確認し、規約に沿ったコミットを作成する
disable-model-invocation: true
argument-hint: [任意: コミット内容の補足]
---

`$ARGUMENTS` があれば参考にしつつ、以下の手順でコミットを作成する。

1. `git status` と `git diff`（staged/unstaged両方）で変更内容を確認する。
2. `.env` や秘密情報を含むファイルが含まれていないか確認する。含まれていれば除外する。
3. 関連するファイルのみを `git add` でステージする（`git add -A` / `git add .` は使わない）。
4. 変更内容から Conventional Commits 形式（`feat:`, `fix:`, `refactor:`, `test:`, `docs:`, `chore:` 等）でコミットメッセージを作成する（`git.md` 準拠）。
5. `git commit` を実行し、`git status` で成功したことを確認する。
6. push は行わない（別途ユーザーの指示があれば実施する）。
