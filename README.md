# 神仏集合
![pf_main_img](https://user-images.githubusercontent.com/69796819/151986046-6b20b5b7-50c0-4740-be45-ea717735f042.jpg)

## URL
* アプリURL : https://worships-app.herokuapp.com/    
(ホーム画面・ヘッダーから、ゲストログインボタンで簡単にログインできます。)

## アプリの特徴
参拝した寺社仏閣の魅力と思い出を記録、共有するアプリです。
* 参拝した神社やお寺の紹介やレビューができる
* 自分だけの御朱印帳を作る事ができる
* 写真投稿で寺社仏閣の雰囲気がわかる

## アプリの開発背景
御朱印管理、寺社仏閣の検索アプリは存在するが、ユーザーが参拝した際の感想や、実際の雰囲気がわかる記事が一緒に掲載されているアプリやサイトが少ないと感じました。
自分自身、手持ちの御朱印帳や写真を見返した際にどこの寺社か思い出せず、きちんと記録を残さなかった事を後悔した経験から、本アプリの開発にいたりました。

## 使用技術
* 言語：Ruby (2.7.2)
* フレームワーク：Ruby on Rails (6.1.3.2)
* フロントエンド：HTML/Scss/JavaScript
* DB：PostgreSQL
* インフラ：Heroku/AWS（VPC・EC2・RDS・IAM・Route53）
* ソースコード管理：GitHub
* 開発環境：MacOS/Visual Studio Code

## 機能一覧
| | 機能 | gem等 |
|:---:|:---:|:---:|
|1 | ログイン・ログアウト | devise |
|2 | ユーザー登録・編集、削除 | devise |
|3 | ゲストログイン機能 | devise |
|4 | アカウント登録、編集、削除 | x |
|5 | 参拝、御朱印記事投稿(CRUD) | x |
|６ | コメント機能 | x |
|7 | 画像投稿機能 | carrierwave/mini-magick |
|8 | 画像カルーセル機能 | slick |
|9 | 画像モーダルウィンドウ | modal.js |
|10 | 管理者画面 | ActiveAdmin |
|11 | 検索機能 | Ransack |
|12 | いいね機能(非同期) | x |
|13 | フォロー機能 | x |
|14 | ページネーション | kaminari |
|15 | レスポンシブデザイン | Bootstrap |
|16 | フォーマッター | Rubocop |

## ER図
![er](https://i.gyazo.com/0c66d1f9df4579722036361c67425384.png)

## 使い方

### ゲストログイン
![pf_gestlogin_mov](https://user-images.githubusercontent.com/69796819/152141818-bf07b8d9-5f10-4778-9c9f-091cfdd517d4.gif)

### 記事投稿
![pf_post_mov](https://user-images.githubusercontent.com/69796819/152148644-c6a6b1ba-023d-414e-bff6-d1364c24b32b.gif)

### 検索機能
![pf_search_mov](https://user-images.githubusercontent.com/69796819/152149287-7be1d7ff-dbf0-4088-8a02-314979eec75b.gif)

### コメント機能
![pf_comment_mov](https://user-images.githubusercontent.com/69796819/152172016-4dd4eccc-d858-4874-b064-19f5d40c565c.gif)

### プロフィール画面
![pf_mypage_mov](https://user-images.githubusercontent.com/69796819/152180005-791a8802-bc2c-4395-b216-a0507d0a17da.gif)

## 工夫した点

### タスク管理
チーム開発を意識した開発を行う為、下記を実施
1. Git, GitHub を用いたソース管理
2. Projects のカンバン方式でタスクを管理を採用
3. issue・ブランチをタスクごとに作成し
4. 適切な頻度でのコミット、Pull Request

### UI/UX
* 日本の和をモチーフに配色を意識
華美過ぎず、落ち着いたカラーを選定し、全体に統一感を待たせた
![colors](https://user-images.githubusercontent.com/69796819/151981971-de6bb1a9-9c52-4a7d-8a7d-daa8c93ed412.jpg)
* タイトル等に毛筆フォントを使用し、日本らしさを表現
<img src="https://user-images.githubusercontent.com/69796819/151984523-497e5a64-a904-4759-991f-cb3cfdf2f633.jpg" width="200px">
* 投稿記事一覧などにも日本をイメージしたイラストを盛り込んだ

### トップページ
* 未ログインでも一部の機能利用制限を除いて、閲覧できるようにした
* ゲストログイン機能を採用し、トップページ上部に分かりやすく配置

### プロフィールページ
* 自信が投稿した記事を表示し、管理のしやすさを意識

### 画像表示
* 投稿画像にはスライド機能を採用
* モーダルウィンドウを用いて、画像選択時に大きく表示されるようにした

## 追加予定機能
* Googleマップ連携
* 星評価
* Twitterシェア
* 記事の下書き機能
* ブックマーク機能
* いいねした記事を一覧表示
