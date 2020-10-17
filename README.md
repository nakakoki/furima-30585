# テーブル設計

##usersテーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name     | string | null: false |
| birth_day      | date   | null: false |

###Association

- has_many :items
- has_many :purchases

##itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| prefectures_id     | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

###Association

- belongs_to :user
- has_one :purchase


##purchasesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false  foreign_key: true |
| user      | references | null: false, foreign_key: true |

###Association

- belongs_to :user
- belongs_to :item
- has_one :address

##addressesテーブル

| Column         | Type       | Option                        |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null:false                    |
| prefectures_id | integer    | null:false                    |
| city           | string     | null:false                    |
| address        | string     | null: false                   |
| building_name  | string     |                               |
| phone_number   | string     | null:false                    |
| purchase       | references | null:false, foreign_key: true |

###Association

- belongs_to :purchase
