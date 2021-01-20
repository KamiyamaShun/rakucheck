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
| employee_number       | string     | null: false, unique: true |
| user                  | references | foreign_key: true         |

### Association

- belongs_to :user
- has_many :conditions

## conditions テーブル

| Column                       | Type       | Options                             |
| ---------------------------- | ---------- | ----------------------------------- |
| temperature                  | float      | null: false, precision: 3, scale: 1 |
| fingers_status_id            | integer    | null: false                         | 
| gastrointestinal_symptoms_id | integer    | null: false                         |
| other_symptoms               | text       | null: false                         |
| user                         | references | foreign_key: true                   |
| employee                     | references | foreign_key: true                   |

### Association

- belongs_to :user
- belongs_to :employee
