# テーブル設計

## users テーブル
| Column                   | Type     | Options                   |
|--------------------------|----------|---------------------------|
| first_name               | string   | null: false               |
| last_name                | string   | null: false               |
| first_name_kana          | string   | null: false               |
| last_name_kana           | string   | null: false               |
| email                    | string   | null: false, unique: true |
| encrypted_password       | string   | null: false               |
| nickname                 | string   | null: false               |
| birth_day                | date     | null: false               |

### Association
has_many :items
has_many :orders


## items テーブル

| Column           | Type        | Options                       |
|------------------|-------------|-------------------------------|
| name             | string      | null: false,                  |
| user             | references  | null: false, foreign_key: true|
| price            | integer     | null: false                   |
| content          | text        | null: false                   |
| category_id      | integer     | null: false                   |
| condition_id     | integer     | null: false                   |
| shipment_id      | integer     | null: false                   |
| prefecture_id    | integer     | null: false                   |
| cost_id          | integer     | null: false                   |

### Association
belongs_to :user
has_one :order


## orders テーブル

| Column      | Type        | Options                        |
|-------------|-------------|--------------------------------|
| item        | references  | null: false, foreign_key: true |
| user        | references  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one : address


## addresses テーブル

| Column            | Typ         | Options     |
|-------------------|-------------|-------------|
| postcode          | string      | null: false |
| prefecture_id     | integer     | null: false |
| city              | string      | null: false |
| street_number     | string      | null: false |
| building_name     | string      |             |
| tel               | string      | null: false |
| order             | references  | null: false, foreign_key: true |

### Association
belongs_to :order