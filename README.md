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

## employees テーブル

| Column                | Type       | Options                   |
| --------------------- | ---------- | ------------------------- |
| name                  | string     | null: false               |
| employee_number       | integer    | null: false, unique: true |
| shop                  | references | foreign_key: true         |

### Association

- belongs_to :shop
- has_many :conditions

## conditions テーブル

| Column                    | Type       | Options           |
| ------------------------- | ---------- | ----------------- |
| temperature               | integer    | null: false       |
| fingers_status            | string     | null: false       | 
| gastrointestinal_symptoms | string     | null: false       |
| other_symptoms            | text       | null: false       |
| shop                      | references | foreign_key: true |
| employee                  | references | foreign_key: true |

### Association

- belongs_to :shop
- belongs_to :employee
