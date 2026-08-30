---
description: 現在のブランチの変更内容からPull Requestを作成する
disable-model-invocation: true
argument-hint: [任意: PRタイトルや背景の補足]
---

`$ARGUMENTS` があれば参考にする。

1. `git status`、現在のブランチ名、`main` との差分（`git log`, `git diff main...HEAD`）を確認する。
2. `main` ブランチ自体からのPR作成は行わない（`feature/*` 等の作業ブランチであることを確認する）。
3. 未pushの変更があれば、pushしてよいかユーザーに確認してからpushする。
4. 変更内容を要約し、PRタイトル（70文字以内）と本文（変更概要・動作確認方法）を作成する。
5. `gh pr create` でPRを作成し、作成後にPRのURLをユーザーに伝える。
