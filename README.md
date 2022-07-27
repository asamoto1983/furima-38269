## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birth_day           | date       | null: false                    |

### Association
- has_many :buys
- has_many :products

## productsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item                | string     | null: false                    |
| price               | integer    | null: false                    |
| explain             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| del_charge_id       | integer    | null: false                    |
| del_area_id         | integer    | null: false                    |
| del_day_id          | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :buy

## buysテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :addresses

## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| build_name          | string     |                                |
| phone_number        | string     | null: false                    |
| buy                 | references | null: false, foreign_key: true |

### Association
- has_one :buy
