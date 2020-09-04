# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :sends
- has_many :cards


## Sendsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|-------|
|tel|string|-------|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|fee|string|null: false|
|ship_from|string|null: false|
|delay|string|null: false|
|price|integer|null: false|
|user_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|condition_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :condition
- has_many :images
- has_many :categories, through: :items_categories


## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :items


## Conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|state|string|null: false, unique: true|

### Association
- has_many :items


## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item


## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items, through: :items_categories


## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category

