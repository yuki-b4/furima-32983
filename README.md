# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| birthday           |        |                           |

### Associations

- has_many :items
- has_many :purchases

## itemsテーブル
| Column          | Type       | Options            |
| --------------- | ---------- | ------------------ |
| image           |            |                    |
| name            | string     | null: false        |
| description     | text       | null: false        |
| category        |            |                    |
| condition       |            |                    |
| shipping_charge |            |                    |
| shipping_from   |            |                    |
| shipping_days   |            |                    |
| price           | integer    | null: false        |
| user_id         | references | foreign keys: true |

### Associations

- belongs_to :user
- has_one :purchase


## purchasesテーブル
| Column  | Type       | Options            |
| ------- | ---------- | ------------------ |
| product | string     | null: false        |
| user_id | references | foreign keys: true |
| item_id | references | foreign keys: true |

### Associations

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column      | Type       | Options            |
| ----------- | ---------- | ------------------ |
| post        | integer    | null: false        |
| prefecture  |            |                    |
| city        | string     | null: false        |
| address     | string     | null: false        |
| building    | string     |                    |
| phone       | integer    | null: false        |
| purchase_id | references | foreign keys: true |

### Associations

- belongs_to :purchase


