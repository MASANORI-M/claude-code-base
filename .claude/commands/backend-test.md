---
description: 指定したエンドポイント/クラスに対するテストを作成する
disable-model-invocation: true
argument-hint: [対象エンドポイント/クラス名]
---

$ARGUMENTS で指定された対象に対するテストを作成する。

1. `docker compose exec backend php artisan make:test {テスト名}Test`（Feature/Unitはプロジェクトの既存構成に合わせる。既存テストがPestならPest記法、PHPUnitならPHPUnit記法に合わせる）でテストファイルを作成する。
2. 正常系だけでなく、バリデーションエラー（422）、認可エラー（403）、Not Found（404）などの異常系もカバーする。
3. DBを使うテストは `RefreshDatabase` トレイトを使い、他のテストに影響しないようにする。
4. 作成後、`docker compose exec backend php artisan test` （またはPestなら `docker compose exec backend ./vendor/bin/pest`）でテストが通ることを確認する。
