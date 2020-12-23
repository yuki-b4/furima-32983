# テーブル設計

## usersテーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |

### Associations

- has_many :items
- has_one :purchases

## itemsテーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| description | text       | null: false |
| price       | integer    | null: false |
| user_id     | references |             |

### Associations

- belongs_to :user
- has_one :purchases

## purchasesテーブル
| Column        | Type       | Options  |
| ------------- | ---------- | -------- |
| card_number   | integer    | NOT NULL |
| valid_month   | integer    | NOT NULL |
| valid_year    | integer    | NOT NULL |
| security_code | integer    | NOT NULL |
| post          | integer    | NOT NULL |
| city          | string     | NOT NULL |
| address       | string     | NOT NULL |
| building      | string     |          |
| phone         | integer    | NOT NULL |
| user_id       | references | NOT NULL |
| item_id       | references | NOT NULL |

### Associations

- belongs_to :user
- belongs_to :item


