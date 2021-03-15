# アプリケーション名
RAKUCHECK

# アプリケーション概要
中小規模の飲食店で体調管理をするためのアプリケーションです。食品業界では食中毒防止のため健康状態の記録をつけています。しかし、ほとんどの飲食店で記録が紙媒体で行われています。電子媒体で記録をすることで、健康状態の記録・確認を容易にすることが可能になります。

# URL

https://rakucheck.herokuapp.com/
http://13.231.47.19 (Elastic IP)

# テスト用アカウント

## BASIC認証

| ID   |rakucheck |
| ---- | -------- |
| PASS |check123  |

## テストアカウント

| メールアドレス | test@test |
| ------------ | --------- |
| パスワード    |abc123     |

# 利用方法
ログインした後、飲食店で働く従業員の登録をします。
登録された従業員は出勤時に自分の健康状態を記録します。
最後に責任者が当日の健康状態を確認します。

# 目指した課題解決
紙媒体での健康状態の記録は、確認などの作業が人の手でやる必要があり手間がかかります。人のてでやるミスを防ぐため確認作業を機械に代替してもらうことで、業務の効率化を実現できます。

# 洗い出した要件
- メールアドレスを利用してログインできる
- SNSアカウントを利用してログインできる
- 複数名の従業員が登録できる
- 選択肢で容易に健康状態を記録できる
- 従業員の健康状態を確認できる
- 体調に問題ある従業員がわかりやすくなる
- 従業員の健康状態が検索ができる
- 健康状態をまとめた記録をダウンロードできる
- 健康状態の記録は1日1回だけになる

# 実装した機能について
### 体調不良者の確認のしやすさ
https://gyazo.com/091ffee308a1a3302732455730d35cb1

### 1日1回の健康状態の記録
https://gyazo.com/965ae4a5eb6dbff1f4eda3b04b48b8da

# データベース設計
https://gyazo.com/4846d90d772914723edf70ba0bef195c

# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| shop_name             | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |

### Association

- has_many :employees
- has_many :conditions
- has_many :sns_credentials

## employees テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ------------------|
| name                  | string     | null: false       |
| employee_number       | string     | null: false       |
| user                  | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :conditions

## conditions テーブル

| Column                       | Type       | Options                             |
| ---------------------------- | ---------- | ----------------------------------- |
| temperature                  | float      | null: false, precision: 3, scale: 1 |
| fingers_status_id            | integer    | null: false                         | 
| gastrointestinal_symptom_id  | integer    | null: false                         |
| other_symptoms               | text       | null: false                         |
| user                         | references | foreign_key: true                   |
| employee                     | references | foreign_key: true                   |

### Association

- belongs_to :user
- belongs_to :employee

## sns_credentials テーブル

| Column   | Type       | Options           |
| ---------| ---------- | ------------------|
| provider | string     | null: false       |
| uid      | string     | null: false       |
| user     | references | foreign_key: true |

### Association

- belongs_to :user