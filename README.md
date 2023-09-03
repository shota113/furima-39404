# テーブル設計

## users テーブル
| Column              | Type   | Options                   |
|---------------------|--------|---------------------------|
| name                | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| date                | string | null: false               |

### Association
has_many :items
has_many :buyers


## items テーブル

| Column    | Type        | Options                       |
|-----------|-------------|-------------------------------|
| item      | string      | null: false                   |
| name      | references  | null: false, foreign_key: true|
| price     | integer     | null: false                   |
| image     | string      | null: false                   |
| content   | text        | null: false                   |
| category  | string      | null: false                   |
| condition | string      | null: false                   |
| shipment  | string      | null: false                   |
| adress    | string      | null: false                   |
| cost      | string      | null: false                   |

### Association
belongs_to :user
has_one :buyer


## buyers テーブル

| Column      | Type        | Options                        |
|-------------|-------------|--------------------------------|
| item        | references  | null: false, foreign_key: true |
| user        | string      | null: false                    |

### Association
belongs_to :user
belongs_to :item
has_one : adress


## adresses テーブル

| Column      | Typ     | Options     |
|-------------|---------|-------------|
| adress      | string  | null: false |
| price       | string  | null: false |
| shipment    | string  | null: false |
| tel         | string  | null: false |

### Association
belongs_to :buyer