## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| password            | string     | null: false                    |
| nickname            | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birth_year          | date       | null: false                    |
| birth_month         | date       | null: false                    |
| birth_day           | date       | null: false                    |

### Association
- has_many :buys
- has_many :products

## productsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| item                | string     | null: false                    |
| explain             | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| del_charge          | string     | null: false                    |
| del_area            | string     | null: false                    |
| del_day             | string     | null: false                    |
| seller_name         | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| buy                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| buy_item            | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :product
- has_many :addresses

## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| build_name          | string     |                                |
| phone_number        | string     | null: false                    |
| buy_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :buy
