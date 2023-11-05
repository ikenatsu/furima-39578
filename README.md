# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| last_name          | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name         | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birth_day          | date     | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| comment               | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_cost_id      | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| shipping_duration_id  | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :deliveries


## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | integer    | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- has_many :orders