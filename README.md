# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | text     | null: false, unique: true |
| last_name          | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name         | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birth_year         | string   | null: false               |
| birth_month        | string   | null: false               |
| birth_day          | string   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| comment            | text       | null: false                    |
| category           | text       | null: false                    |
| condition          | text       | null: false                    |
| shipping_cost      | text       | null: false                    |
| shipping_origin    | text       | null: false                    |
| shipping_duration  | text       | null: false                    |
| price              | text       | null: false                    |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| delivery_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :deliveries


## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false,                   |
| city           | string     | null: false,                   |
| house_number   | string     | null: false,                   |
| building       | string     |                                |
| tel            | string     | null: false,                   |
| order          | references | null: false, foreign_key: true |

### Association

- has_many :orders