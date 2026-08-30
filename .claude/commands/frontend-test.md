---
description: 指定したReactコンポーネントのテストを作成する
disable-model-invocation: true
argument-hint: [対象コンポーネント名]
---

$ARGUMENTS で指定されたコンポーネントに対するテストを作成する。

1. 対象コンポーネントの props・振る舞い（表示条件、クリックイベント等）を確認する。
2. プロジェクトの既存テスト構成（Jest + React Testing Library等）に合わせてテストファイルを作成する。
3. 正常系だけでなく、エラー表示やローディング状態など、主要な分岐もカバーする。
4. 作成後、テストを実行して通ることを確認する（コンテナ内で `docker compose exec frontend npm test -- --watchAll=false` 等）。
