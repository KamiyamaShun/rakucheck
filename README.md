# アプリケーション名
RAKUCHECK

# アプリケーション概要
中小規模の飲食店で体調管理をするためのアプリケーションです。食品業界では食中毒防止のため健康状態の記録をつけています。しかし、ほとんどの飲食店で記録が紙媒体で行われています。電子媒体で記録をすることで、健康状態の記録・確認を容易にすることが可能になります。

# URL
https://rakucheck.herokuapp.com/

13.231.47.19 (Elastic IP)

# テスト用アカウント

## BASIC認証

|ID   |rakucheck |
| --- | -------- |
|PASS |check123  |
## テストアカウント
|メールアドレス |rakucheck |
| ---------- | --------  |
|パスワード    |check123   |
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