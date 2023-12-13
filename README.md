## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

## Association

- has_many :items
- has_many :addresses

## itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| item_name              | text       | null: false                    |
| item_description       | text       | null: false                    |
| category               | string     | null: false                    |
| status                 | string     | null: false                    |
| delivery_charge_burden | string     | null: false                    |
| delivery_from          | string     | null: false                    |
| days_delivery          | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :address
- has_one_attached :image

## addressesテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefectures            | string     | null: false                    |
| city                   | string     | null: false                    |
| block                  | string     | null: false                    |
| building_name          | string     | null: true                     |
| phone_number           | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item