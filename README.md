# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :incidents
- has_many :responses
- has_many :comments

## incidents テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| date     | integer    | null: false                    |
| place_id | integer    | null: false                    |
| title    | string     | null: false                    |
| content  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :response
- has_many :comments

## responses テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| date     | integer    | null: false                    |
| cost     | integer    |                                |
| title    | string     | null: false                    |
| content  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| incident | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :incident

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| incident | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :incident