# テーブル設計

## users テーブル
| Column              | Type   | Options     |
|---------------------|--------|-------------|
| name                | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| encrypted_password  | string | null: false |
| birthday            | string | null: false |

### Association
has_many :items
has_many :buyers


## items テーブル

| Column    | Type    | Options     |
|-----------|---------|-------------|
| name      | string  | null: false |
| price     | integer | null: false |
| image     | string  | null: false |
| content   | text    | null: false |
| user      | string  | null: false |

### Association
belongs_to :users
has_one :buyers


## buyers テーブル

| Column      | Type    | Options     |
|-------------|---------|-------------|
| name        | string  | null: false |
| buyer_user  | string  | null: false |

### Association
belongs_to :users
belongs_to :items
has_one : adresses


## adresses テーブル

| Column      | Typ   | Options     |
|-------------|-------|-------------|
| adress      | text  | null: false |

### Association
belongs_to :buyers