# テーブル設計

## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |


### Associations

- has_many :items
- has_many :purchases

## itemsテーブル
| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| name               | string     | null: false        |
| description        | text       | null: false        |
| category_id        | integer    | null: false        |
| condition_id       | integer    | null: false        |
| shipping_charge_id | integer    | null: false        |
| shipping_from_id   | integer    | null: false        |
| shipping_day_id    | integer    | null: false        |
| price              | integer    | null: false        |
| user               | references | foreign key: true  |

### Associations

- belongs_to :user
- has_one :purchase


## purchasesテーブル
| Column | Type       | Options            |
| ------ | ---------- | ------------------ |
| user   | references | foreign key: true  |
| item   | references | foreign key: true  |

### Associations

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column              | Type       | Options            |
| --------------------| ---------- | ------------------ |
| post                | string     | null: false        |
| shipping_from_id    | integer    | null: false        |
| city                | string     | null: false        |
| address             | string     | null: false        |
| building            | string     |                    |
| phone               | string     | null: false        |
| purchase            | references | foreign key: true  |

### Associations

- belongs_to :purchase
