# 紹介

各ゲームストアのセール情報を一括検索するアプリです。  
FlutterとFirebaseを勉強するために、一般的なアプリの基本機能を色々実装してみました。

## 機能
- セール情報の検索機能
  - フィルター機能（プラットフォーム、ジャンル）
  - ソート機能（リリース日、セール価格）
  - 遅延読み込
  - Pull-to-Refresh
  - ゲーム名で検索
- 発売予定のゲーム一覧機能
  - プラットフォーム別表示
  - リストのグループ別表示
  - 遅延読み込
  - Pull-to-Refresh
- ゲームの情報表示機能
  -  基本情報の表示
  -  詳細情報の表示
  -  セール履歴の折り線グラフ表示
  -  公式ストアへの遷移
  -  最新レビューの表示
  -  お気に入り追加機能
  -  シェア機能（未実装）
- レビュー機能
  -  レビューのいいね
  -  レビュー詳細の表示
  -  レビュー投稿
  -  レビュー全表示（未実装）
- 認証機能
  - アカウント作成
  - ログイン
  - パスワード忘れた場合のパスワードリセット
- 設定
  - お気に入り一覧の表示
    - 通知タイプの選択（通知off、価格変動通知、最低価格更新通知）
    - お気に入り一覧から削除
    - 実際の通知機能（未実装）
  - テーマの変更（ライト、ダーク）
  - 言語の変更（日本語、英語、中国語）

## 主な技術
| 名称 | 技術・パッケージ |
| ------ | ------ |
| 認証機能 | firebase_auth |
| 状態管理 | hooks_riverpod、flutter_hooks |
| データベース | cloud_firestore |
| ローカルストレージ | shared_preferences |
| immutableモデル | freezed |
| JSONコードジェネレータ| json_serializable |
| 地域化 | flutter_localizations、intl |
| ソース分析ツール | flutter_lints |
| グラフ | charts_flutter |
| URLで遷移 | url_launcher |
## ディレクトリ構造
```
├─assets        
   ├─images                      画像ファイル
├─lib
   ├─constants                   グローバル定数クラス
   ├─extension                   拡張メッソド
   ├─generated　                 地域化自動生成のコード
   ├─l10n                        地域化の設定ファイル、変更後、generatedにコードが生成される
   ├─models                      データモデルクラス
   ├─pages              　　　　　各画面のレイアウト
   ├─providers                   状態管理プロバイダー
   ├─repositories                Firebaseからデータ取得用クラス
   ├─screens                     メイン画面
   ├─utils                       汎用ユーティリティクラス
   ├─validators                  入力チェッククラス
   ├─widgets                     共通で使うウィジェット
   ─firebase_options.dart        Firebase設定情報
   ─main.dart                    エントリーポイント
─analysis_options.yaml           lintsツール設定ファイル
─pubspec.yaml                    パッケージ、リソース管理ファイル
```
