# テーブル設計

## users テーブル

| Colum               | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| name                | string | null: false               |
| profile             | text   | null: false               |
| occupation          | text   | null: false               |
| position            | text   | null: false               |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Colum      | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| title      | string      | null: false                    |
| catch_copy | text        | null: false                    |
| concept    | text        | null: false                    |
| user       | refereneces | null: false, foreign_key: true |

### Association

- belong_to :user
- has_many :comments

## comments テーブル

| Colum     | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| concept   | text        | null: false                    |
| prototype | refereneces | null: false, foreign_key: true |
| user      | refereneces | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :prototype